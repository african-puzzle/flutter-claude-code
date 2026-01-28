# Figma Fallback Strategy

This document defines the fallback strategy when Claude cannot immediately identify the correct Figma component or when multiple variants exist.

## Problem Scenarios

1. **Component not in registry**: User requests a component that doesn't exist in FIGMA_REGISTRY.md
2. **Multiple variants**: Component has many variants (e.g., 7 View Header types) and Claude must choose
3. **Ambiguous request**: User says "implement the button" but doesn't specify which variant
4. **New/undocumented component**: Component exists in Figma but hasn't been documented yet
5. **Figma URL provided**: User provides a raw Figma URL instead of component name

## Fallback Workflow

### Step 1: Parse User Input

**If user provides a Figma URL**, extract node ID automatically:

```python
# Example: https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX?node-id=362-6
# Extract: fileKey = "8S2Jt5xKHfTmlI8rSR6AcX", nodeId = "362-6"

def parse_figma_url(url):
    """Extract file key and node ID from Figma URL."""
    import re

    # Pattern for Figma URLs
    pattern = r'figma\.com/design/([^/]+).*node-id=([^&]+)'
    match = re.search(pattern, url)

    if match:
        file_key = match.group(1)
        node_id = match.group(2).replace('-', ':')  # Convert format
        return file_key, node_id

    return None, None
```

**Claude should**:
1. Detect Figma URL in user message
2. Extract fileKey and nodeId automatically
3. Fetch screenshot and design context directly
4. Skip registry lookup
5. Optionally suggest adding to registry

**Example**:
```
User: "Implement this: https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX?node-id=362-6"

Claude:
✓ Detected Figma URL
✓ Extracted fileKey: 8S2Jt5xKHfTmlI8rSR6AcX
✓ Extracted nodeId: 362:6
✓ Fetching live data...
[Shows screenshot and implements]

💡 Tip: This component isn't in FIGMA_REGISTRY.md yet. Would you like me to add it?
```

### Step 2: Fuzzy Matching

If component name isn't exact match in registry, try fuzzy matching:

**Examples**:
- User says: "button" → Suggest: "Buttons" (from registry)
- User says: "view-header" → Suggest: "View Headers"
- User says: "card" → Suggest: "Cards" (if in registry)

**Implementation**:
```python
def fuzzy_match_component(user_input, registry_components):
    """Find closest match in registry."""
    from difflib import get_close_matches

    matches = get_close_matches(
        user_input.lower(),
        [c.lower() for c in registry_components],
        n=3,
        cutoff=0.6
    )

    return matches  # Return top 3 matches
```

**Claude should**:
```
User: "Implement a button"

Claude:
I didn't find an exact match for "button" in FIGMA_REGISTRY.md.

Did you mean one of these?
1. Buttons (node-id: 362-6)
2. Icon Buttons (node-id: 1234-56) [if exists]

Or provide a Figma URL for the specific component.
```

### Step 3: Explore Component Structure

If component not in registry, use **metadata tool** to explore:

```
mcp__figma__get_metadata(fileKey="8S2Jt5xKHfTmlI8rSR6AcX", nodeId="0:1")
```

This returns XML structure of the entire page/frame, showing all components and their node IDs.

**Claude should**:
1. Call get_metadata on main page
2. Parse XML to find components
3. Present list to user
4. Let user select correct component

**Example**:
```
User: "Implement the pricing card"

Claude:
I don't have "pricing card" in the registry. Let me explore the Figma file...

Found these components that might match:
1. Cards > Puzzle Card (node-id: 789-10)
2. Cards > Pricing Card (node-id: 890-12)
3. Components > Card Variants (node-id: 901-15)

Which one should I use?
```

### Step 4: Visual Confirmation with AskUserQuestion

When multiple variants exist or ambiguity is high, **show visual options**:

**Enhanced AskUserQuestion Pattern**:

```dart
// Step 1: Fetch screenshots of all variants
// Step 2: Show them to user with AskUserQuestion

AskUserQuestion(
  questions: [
    {
      question: "Which button variant should I implement?",
      header: "Button Type",
      multiSelect: false,
      options: [
        {
          label: "Primary Button",
          description: "Elevated purple button with white text. Used for primary actions like 'Submit' or 'Continue'."
        },
        {
          label: "Secondary Button",
          description: "Outlined purple button with transparent background. Used for secondary actions."
        },
        {
          label: "Text Button",
          description: "Minimal button with no background. Used for tertiary actions like 'Cancel'."
        },
        {
          label: "Icon Button",
          description: "Circular button with icon only. Used for actions like 'Close' or 'Menu'."
        },
        {
          label: "Custom (provide Figma URL)",
          description: "I'll paste the Figma URL for a specific button variant."
        }
      ]
    }
  ]
)
```

**If user selects "Custom"**, follow up with:

```dart
AskUserQuestion(
  questions: [
    {
      question: "Please paste the Figma URL for the component:",
      header: "Figma URL",
      multiSelect: false,
      options: [
        {
          label: "Paste URL",
          description: "Paste the Figma URL here (e.g., https://figma.com/design/...?node-id=...)"
        }
      ]
    }
  ]
)
```

**Important**: Claude should then parse the URL from the user's answer and extract the node ID.

### Step 5: Variant Selection Matrix

For components with known variants, create a decision matrix:

#### View Headers (7 variants)

```
User request                 → Suggested variant
"home screen header"         → Default View Header
"calendar view header"       → Calendar View Header
"search screen header"       → Search View Header
"header with tabs"           → Tabs View Header
"photo gallery header"       → Album View Header
"contact detail header"      → Contact View Header
"project header"             → Project View Header
```

**Claude should**:
1. Analyze user's context clues
2. Suggest most likely variant
3. Ask for confirmation with description
4. Fetch specific variant's node ID

**Example**:
```
User: "Implement the header for the calendar screen"

Claude:
Based on your request for a "calendar screen," I recommend the Calendar View Header variant, which includes:
- Purple gradient background
- Menu icon (left)
- "Rendez-vous" title (centered)
- More icon (right)
- Calendar navigation subheader

Is this correct, or would you prefer a different header variant?
[Options: Confirm | Choose different variant | Provide Figma URL]
```

### Step 6: Add to Registry Workflow

When component is found but not in registry, offer to add it:

```
User: [provides URL] https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX?node-id=999-888

Claude:
✓ Fetched component from Figma
✓ Component: "Custom Card Variant"
✓ Implementing now...

💡 This component isn't in FIGMA_REGISTRY.md yet.

Would you like me to add it? This will make it easier to reference in the future.

[Options: Yes, add to registry | No, just implement | Add later]
```

**If user says yes**:

```dart
// Claude updates FIGMA_REGISTRY.md with new entry:

### Custom Card Variant
- **Node ID**: `999-888`
- **Full URL**: https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX?node-id=999-888
- **Contains**: [description from design context]
- **Last Verified**: 2026-01-28

**MCP Fetch Commands**:
[commands]
```

## Advanced Fallback Strategies

### Strategy 1: Interactive Component Browser

When user is unsure, offer to browse Figma interactively:

```
User: "I want to implement a card but I'm not sure which one"

Claude:
Let me help you browse the available cards in Figma.

Fetching components from the design system...

Found 5 card variants:
1. **Puzzle Card** (node: 789-10)
   - Image with price badge overlay
   - Rounded corners, shadow
   - Used in: Puzzle browsing grid

2. **Profile Card** (node: 890-12)
   - Avatar, name, bio
   - Used in: User profiles

3. **Appointment Card** (node: 901-13)
   - Time, title, description
   - Used in: Calendar view

4. **Contact Card** (node: 902-14)
   - Avatar, name, phone
   - Used in: Contacts list

5. **Custom (provide URL)**

Which card should I implement?
```

### Strategy 2: Context-Aware Suggestions

Use conversation context to infer component:

```
User: "Now add a header to this screen"

Claude:
[Checks previous messages]
- Previous task: Implemented calendar view with appointment list
- Context: Calendar screen

Suggested component: Calendar View Header
- Purple gradient with calendar navigation
- Node ID: 7398-31867 (variant 3 of 7)

Should I use this header? [Yes | Show other header options | Provide custom URL]
```

### Strategy 3: Hierarchical Discovery

If component is nested in Figma, traverse hierarchy:

```
User: "Implement the button inside the bottom sheet"

Claude:
Let me navigate the Figma hierarchy...

Found structure:
Bottom Sheets (906-2533)
└── Action Sheet Variant
    └── Button Group
        ├── Primary Action Button (node: 906-2540) ← Found it!
        └── Secondary Action Button (node: 906-2541)

Should I implement the Primary Action Button from the bottom sheet?
```

### Strategy 4: Batch Component Selection

When user needs multiple components:

```
User: "Build the entire onboarding flow"

Claude:
The onboarding flow requires multiple components. Let me identify them:

Found components:
✓ Splash Screen (node: 123-45) - from registry
✓ Language Selection Modal (node: 234-56) - from registry
✗ Onboarding Slide Template - NOT in registry

For the missing component, I found:
- Onboarding Frame (node: 345-67) - contains 3 slide variants

Should I:
1. Use Onboarding Frame with all variants
2. You provide specific URLs for each slide
3. I'll browse and show you options
```

## Best Practices for Claude

### DO:

✅ **Always parse Figma URLs first** - Extract node ID automatically
✅ **Use fuzzy matching** - Suggest close matches from registry
✅ **Show visual context** - Describe what component looks like
✅ **Provide options** - Give user 2-4 choices with descriptions
✅ **Offer to add to registry** - Improve system for future use
✅ **Use conversation context** - Infer from previous messages
✅ **Fetch metadata when stuck** - Explore Figma structure
✅ **Confirm before implementing** - Especially for ambiguous requests

### DON'T:

❌ **Guess blindly** - Never implement without confirmation if ambiguous
❌ **Ignore user URLs** - Always prioritize user-provided Figma links
❌ **Overwhelm with options** - Limit to 3-5 choices max
❌ **Skip registry updates** - Offer to add new components
❌ **Implement wrong variant** - Better to ask than assume

## AskUserQuestion Templates

### Template 1: Component Not Found

```dart
AskUserQuestion(
  questions: [
    {
      question: "I couldn't find '[component name]' in the registry. How should I proceed?",
      header: "Component Lookup",
      multiSelect: false,
      options: [
        {
          label: "Explore Figma file",
          description: "I'll search the Figma file and show you available components"
        },
        {
          label: "Provide Figma URL",
          description: "You'll paste the direct Figma URL for the component"
        },
        {
          label: "Use similar component",
          description: "I'll suggest the closest match from the registry"
        },
        {
          label: "Skip this component",
          description: "Continue without this component"
        }
      ]
    }
  ]
)
```

### Template 2: Multiple Variants

```dart
AskUserQuestion(
  questions: [
    {
      question: "There are [N] variants of [component]. Which one should I use?",
      header: "Variant Selection",
      multiSelect: false,
      options: [
        {
          label: "[Variant 1 Name]",
          description: "[When to use] - [Key features]"
        },
        {
          label: "[Variant 2 Name]",
          description: "[When to use] - [Key features]"
        },
        // ... up to 4 options
        {
          label: "Show me previews",
          description: "I'll fetch screenshots of each variant"
        },
        {
          label: "Custom (provide URL)",
          description: "I'll use a specific Figma URL you provide"
        }
      ]
    }
  ]
)
```

### Template 3: URL Request

```dart
AskUserQuestion(
  questions: [
    {
      question: "Please provide the Figma URL for the component you want to implement:",
      header: "Figma URL",
      multiSelect: false,
      options: [
        {
          label: "Paste URL below",
          description: "Example: https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX?node-id=362-6"
        },
        {
          label: "Browse registry instead",
          description: "I'll show you components from FIGMA_REGISTRY.md"
        }
      ]
    }
  ]
)
```

### Template 4: Preview Confirmation

```dart
// After fetching screenshot
AskUserQuestion(
  questions: [
    {
      question: "I fetched this component from Figma. Is this the correct one?",
      header: "Confirm Component",
      multiSelect: false,
      options: [
        {
          label: "Yes, implement this",
          description: "This is the correct component"
        },
        {
          label: "No, show other options",
          description: "Let me choose a different component"
        },
        {
          label: "No, I'll provide new URL",
          description: "I'll paste a different Figma URL"
        }
      ]
    }
  ]
)
```

## Error Recovery

### Scenario: Invalid Figma URL

```
User: [provides malformed URL]

Claude:
⚠️ I couldn't parse that Figma URL.

Valid URL format:
https://figma.com/design/[FILE_KEY]?node-id=[NODE_ID]

Example:
https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX?node-id=362-6

Would you like to:
1. Try pasting the URL again
2. Browse the registry instead
3. Describe the component (I'll search)
```

### Scenario: Node ID Not Found

```
User: [provides URL with invalid node ID]

Claude:
✓ URL parsed successfully
✗ Node ID "999-999" doesn't exist in this Figma file

Possible reasons:
- Component was deleted
- Node ID changed (Figma restructure)
- Wrong file URL

Would you like to:
1. Provide a different URL
2. Browse available components
3. Describe what you're looking for
```

### Scenario: Permission Denied

```
Claude:
✗ Cannot access this Figma file (permission denied)

This might mean:
- File is private and I don't have access
- Figma MCP server needs re-authentication
- File has been deleted

Would you like to:
1. Check file sharing settings
2. Use a different component
3. Work with cached documentation instead
```

## Metrics & Improvement

Track these to improve the system:

- **Fallback trigger rate**: How often fallback is needed
- **User-provided URL rate**: How often users paste URLs
- **Variant confusion rate**: How often wrong variant is suggested
- **Registry addition rate**: How many new components added per week

Goal: Reduce fallback triggers by improving registry completeness.

## Future Enhancements

### Enhancement 1: Smart Search

```
User: "button with icon and text"

Claude:
Searching Figma for: "button" + "icon" + "text"

Found: Icon + Text Button variant (node: 362-15)
[Shows screenshot]

Is this correct?
```

### Enhancement 2: Visual Similarity Matching

```
User: [uploads screenshot]

Claude:
Analyzing screenshot...
Found visually similar component in Figma: Primary Button (85% match)
[Shows side-by-side comparison]

Should I implement this?
```

### Enhancement 3: Natural Language to Node ID

```
User: "the purple button at the top of the login screen"

Claude:
Parsing: "purple" + "button" + "login screen context"
→ Identified: Primary Button (purple background)
→ Found in: Login Flow frame
→ Node ID: 362-6

Is this correct?
```

## Summary

The fallback strategy uses a **progressive discovery approach**:

1. **Parse Figma URL** → Direct access (fastest)
2. **Fuzzy match registry** → Suggest similar components
3. **Explore Figma metadata** → Browse structure
4. **Ask with visual context** → Show options with descriptions
5. **Confirm before implementing** → Validate choice
6. **Add to registry** → Improve system

This ensures Claude **never gets stuck** and always has a path forward, while minimizing user friction.
