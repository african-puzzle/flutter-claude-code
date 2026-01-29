# Testing Strategy: Figma MCP & Skills Integration

This document outlines how to test the Figma MCP integration and design system skill without building the Flutter app.

## Testing Objectives

Validate that:
1. ✅ Figma MCP server is properly configured and accessible
2. ✅ Component registry contains correct node IDs
3. ✅ MCP tools can fetch live data from Figma
4. ✅ Skills load correctly and provide expected context
5. ✅ Flutter UI agents integrate with the skill properly
6. ✅ Fallback strategies work when components not found
7. ✅ URL parsing and node ID extraction works

## Phase 1: MCP Server Verification

### Test 1.1: Verify MCP Server is Configured

```bash
# List all MCP servers
claude mcp list
```

**Expected Output**:
```
figma    http    https://mcp.figma.com/mcp
```

**Pass Criteria**: Figma MCP server is listed and active

---

### Test 1.2: Verify Figma Authentication

Ask Claude:
```
Can you access the Figma MCP server? Please check using the whoami tool.
```

Claude should call:
```
mcp__figma__whoami()
```

**Expected Output**: Returns authenticated user information

**Pass Criteria**: No authentication errors, user info returned

---

### Test 1.3: Test Basic Figma Access

Ask Claude:
```
Can you fetch the screenshot for this Figma URL:
https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX?node-id=362-6
```

Claude should:
1. Parse the URL
2. Extract: fileKey = `8S2Jt5xKHfTmlI8rSR6AcX`, nodeId = `362-6`
3. Call `mcp__figma__get_screenshot(fileKey="8S2Jt5xKHfTmlI8rSR6AcX", nodeId="362-6")`
4. Return screenshot

**Pass Criteria**: Screenshot is fetched and displayed

---

## Phase 2: Component Registry Validation

### Test 2.1: Verify Registry Contains Components

Ask Claude:
```
Read the FIGMA_REGISTRY.md file and list all components with their node IDs.
```

**Expected Output**: List of 5+ components:
- Buttons (362-6)
- Bottom Sheets (906-2533)
- View Headers (7398-31867)
- Primitives/Colors (7353-10757)
- Icons (341-157)

**Pass Criteria**: All components listed with correct node IDs

---

### Test 2.2: Validate Node IDs are Current

For each component in registry, ask Claude:
```
Fetch the screenshot for the Buttons component using the node ID from FIGMA_REGISTRY.md
```

Claude should:
1. Read FIGMA_REGISTRY.md
2. Find Buttons → node ID: 362-6
3. Call MCP tool with that node ID
4. Return screenshot

**Pass Criteria**: All node IDs resolve to correct components (no "not found" errors)

---

## Phase 3: Live Data Fetching

### Test 3.1: Fetch Screenshot

Ask Claude:
```
Get a screenshot of the Buttons component from Figma.
Use the node ID from FIGMA_REGISTRY.md.
```

**Expected Behavior**:
1. Reads FIGMA_REGISTRY.md
2. Finds: Buttons (362-6)
3. Calls: `mcp__figma__get_screenshot(fileKey="8S2Jt5xKHfTmlI8rSR6AcX", nodeId="362-6")`
4. Shows screenshot

**Pass Criteria**: Correct screenshot displayed

---

### Test 3.2: Fetch Design Context

Ask Claude:
```
Get the design context (measurements, colors, spacing) for the Buttons component.
```

**Expected Behavior**:
1. Reads FIGMA_REGISTRY.md
2. Calls: `mcp__figma__get_design_context(fileKey="8S2Jt5xKHfTmlI8rSR6AcX", nodeId="362-6")`
3. Returns structured data with:
   - Colors (hex values)
   - Measurements (padding, margins, dimensions)
   - Typography (font family, size, weight)
   - Spacing values

**Pass Criteria**: Design context returned with specific measurements

---

### Test 3.3: Fetch Variable Definitions (Design Tokens)

Ask Claude:
```
Get the variable definitions (design tokens) for the Colors/Primitives component.
```

**Expected Behavior**:
1. Reads FIGMA_REGISTRY.md
2. Finds: Primitives/Colors (7353-10757)
3. Calls: `mcp__figma__get_variable_defs(fileKey="8S2Jt5xKHfTmlI8rSR6AcX", nodeId="7353-10757")`
4. Returns token mappings like:
   ```
   {
     "primary/500": "#3D2664",
     "basic/white": "#FFFFFF",
     "spacing/medium": "16px"
   }
   ```

**Pass Criteria**: Token mappings returned

---

## Phase 4: Skills Integration

### Test 4.1: Load African Puzzle Works Design Skill

Ask Claude:
```
Load the african-puzzle-works-design skill and summarize what it provides.
```

Claude should:
1. Read `@african-puzzle-works-design/SKILL.md`
2. Summarize:
   - Figma-first approach
   - Design tokens (colors, typography, spacing)
   - Component specifications
   - Theme configuration
   - References to FIGMA_REGISTRY.md

**Pass Criteria**: Skill loads successfully, summary is accurate

---

### Test 4.2: Access Registry Through Skill

Ask Claude:
```
You have the african-puzzle-works-design skill loaded.
Look up the node ID for the View Headers component.
```

**Expected Behavior**:
1. Reads `@african-puzzle-works-design/FIGMA_REGISTRY.md`
2. Finds: View Headers (7398-31867)
3. Returns node ID

**Pass Criteria**: Correct node ID returned

---

### Test 4.3: Fetch Live Data Through Skill Workflow

Ask Claude:
```
Using the african-puzzle-works-design skill workflow:
1. Look up the primary button in the registry
2. Fetch its screenshot from Figma
3. Fetch its design context
4. Tell me the exact background color
```

**Expected Behavior**:
Complete workflow:
1. Registry lookup → Buttons (362-6)
2. Fetch screenshot → Shows button image
3. Fetch design context → Gets specifications
4. Returns: Background color `#3D2664` (Primary 500)

**Pass Criteria**: Complete workflow executes, color is correct

---

## Phase 5: Flutter UI Designer Integration

### Test 5.1: Trigger Skill Auto-Load

Ask Claude:
```
I'm working on the African Puzzle Works app.
Can you help me implement a primary button?
```

**Expected Behavior**:
1. Detects "African Puzzle Works" mention
2. Auto-loads african-puzzle-works-design skill
3. Reads SKILL.md and FIGMA_REGISTRY.md
4. Looks up Buttons component
5. Fetches live screenshot
6. Provides widget hierarchy recommendation

**Pass Criteria**: Skill loads automatically without explicit request

---

### Test 5.2: Widget Hierarchy with Live Data

Ask Claude:
```
Using live Figma data, create a Flutter widget hierarchy for the primary button.
```

**Expected Output**:
```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary500, // #3D2664 from live Figma
    foregroundColor: AppColors.basicWhite, // #FFFFFF
    padding: EdgeInsets.symmetric(
      horizontal: 24, // From live Figma measurements
      vertical: 12,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // From Figma
    ),
    elevation: 2, // From Figma elevation specs
  ),
  onPressed: () {},
  child: Text('Button Text'),
)
```

**Pass Criteria**:
- Values match live Figma data
- Design tokens used (AppColors.*)
- Measurements accurate

---

## Phase 6: Fallback Strategy Testing

### Test 6.1: Component Not in Registry

Ask Claude:
```
I need to implement a pricing card for African Puzzle Works.
```

**Expected Behavior**:
1. Checks FIGMA_REGISTRY.md → Not found
2. Tries fuzzy match: "card" → No close matches
3. Uses AskUserQuestion:
   ```
   I couldn't find "pricing card" in the registry. How should I proceed?
   Options:
   1. Explore Figma file
   2. Provide Figma URL
   3. Use similar component
   4. Skip this component
   ```

**Pass Criteria**: Fallback workflow triggered, options presented

---

### Test 6.2: Automatic URL Parsing

Ask Claude:
```
Implement this component:
https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX?node-id=999-888
```

**Expected Behavior**:
1. Detects Figma URL in message
2. Extracts automatically:
   - fileKey: `8S2Jt5xKHfTmlI8rSR6AcX`
   - nodeId: `999-888` (converts to `999:888`)
3. Fetches screenshot directly (bypasses registry)
4. Shows preview
5. Optionally suggests: "Add this to FIGMA_REGISTRY.md?"

**Pass Criteria**: URL parsed automatically, no manual extraction needed

---

### Test 6.3: Fuzzy Matching

Ask Claude:
```
I need a button for African Puzzle Works.
```

**Expected Behavior**:
1. Searches registry for "button"
2. Finds close match: "Buttons"
3. Suggests: "Did you mean 'Buttons' (node: 362-6)?"
4. Fetches screenshot for confirmation

**Pass Criteria**: Fuzzy match found, suggestion offered

---

### Test 6.4: Multiple Variants Selection

Ask Claude:
```
Add a header for the calendar screen in African Puzzle Works.
```

**Expected Behavior**:
1. Finds: View Headers (7 variants)
2. Analyzes context: "calendar screen"
3. Infers: Calendar View Header (variant 3)
4. Suggests: "I recommend Calendar View Header (includes calendar nav). Is this correct?"
5. Waits for confirmation

**Pass Criteria**: Context-aware suggestion made, not just listing all variants

---

## Phase 7: Cross-Reference Validation

### Test 7.1: Live Figma vs Documentation

Ask Claude:
```
Compare the primary button specs from:
1. Live Figma (via MCP)
2. references/components.md

Are there any discrepancies?
```

**Expected Behavior**:
1. Fetches live Figma data
2. Reads components.md
3. Compares values (colors, spacing, measurements)
4. Reports any differences

**Pass Criteria**:
- Comparison executes successfully
- Any discrepancies are flagged
- If discrepancy: Claude suggests using Figma value (newer)

---

### Test 7.2: Token Mapping Accuracy

Ask Claude:
```
Get the primary purple color from live Figma and verify it matches AppColors.primary500 in the documentation.
```

**Expected Output**:
```
Live Figma: #3D2664
Documentation (tokens.md): AppColors.primary500 = #3D2664
✓ Match confirmed
```

**Pass Criteria**: Token values match between Figma and docs

---

## Phase 8: End-to-End Workflow Test

### Test 8.1: Complete Implementation Workflow (Dry Run)

Ask Claude:
```
Walk me through how you would implement the primary button from the African Puzzle Works design system, but don't actually write the code yet. Just explain each step.
```

**Expected Steps**:
1. ✅ Load african-puzzle-works-design skill
2. ✅ Read FIGMA_REGISTRY.md
3. ✅ Find Buttons component (node: 362-6)
4. ✅ Fetch live screenshot via MCP
5. ✅ Fetch design context via MCP
6. ✅ Cross-reference references/components.md for Flutter pattern
7. ✅ Map colors to AppColors.* tokens
8. ✅ Map spacing to AppSpacing.* tokens
9. ✅ Generate widget hierarchy with live values
10. ✅ Verify measurements against references/measurements.md

**Pass Criteria**: All steps are present and in correct order

---

### Test 8.2: Simulate Component Not Found (Full Fallback)

Ask Claude:
```
I want to implement a custom testimonial card for African Puzzle Works.
This component doesn't exist in your registry yet.
```

**Expected Workflow**:
1. Check registry → Not found
2. Try fuzzy match → No matches
3. Ask user for next step (using AskUserQuestion)
4. User provides Figma URL
5. Parse URL → Extract node ID
6. Fetch screenshot
7. Show preview for confirmation
8. User confirms
9. Fetch design context
10. Offer to add to registry
11. Generate implementation plan

**Pass Criteria**: Complete fallback workflow executes smoothly

---

## Phase 9: Error Handling Tests

### Test 9.1: Invalid Node ID

Ask Claude:
```
Fetch the screenshot for node ID "99999-99999" from the African Puzzle Works Figma file.
```

**Expected Behavior**:
1. Attempts to fetch
2. Receives error: "Node not found"
3. Responds gracefully: "This node ID doesn't exist. Possible reasons: [list]"
4. Offers alternatives

**Pass Criteria**: Error handled gracefully, helpful message provided

---

### Test 9.2: Invalid Figma URL

Ask Claude:
```
Implement this: https://figma.com/invalid-url-format
```

**Expected Behavior**:
1. Attempts to parse URL
2. Detects invalid format
3. Responds: "I couldn't parse that Figma URL. Valid format is: [example]"
4. Asks user to provide correct URL

**Pass Criteria**: Invalid URL detected, help provided

---

### Test 9.3: MCP Server Unavailable

Temporarily disable Figma MCP, then ask:
```
Get a screenshot of the primary button from Figma.
```

**Expected Behavior**:
1. Attempts MCP call
2. Receives connection error
3. Falls back to static files: "Figma MCP unavailable, using cached screenshots from assets/screens/"
4. Reads static screenshot if available
5. Warns: "Using cached data, may not be current"

**Pass Criteria**: Graceful fallback to static files

---

## Phase 10: Documentation Accuracy

### Test 10.1: Registry Completeness

Ask Claude:
```
Check FIGMA_REGISTRY.md: Are all node IDs documented with MCP fetch commands?
```

**Validation Checklist**:
- [ ] Each component has node ID
- [ ] Each component has full Figma URL
- [ ] Each component has MCP fetch commands
- [ ] Each component has "Last Verified" date
- [ ] Each component has description

**Pass Criteria**: All fields present for all components

---

### Test 10.2: Strategy Documentation

Ask Claude:
```
Read figma-sync-strategy.md and summarize the main workflow.
```

**Expected Summary**:
1. Figma is source of truth
2. Always fetch live data during implementation
3. Use FIGMA_REGISTRY.md for quick lookup
4. Cross-reference with references/*.md for context
5. Static screenshots are supplementary only

**Pass Criteria**: Summary is accurate

---

### Test 10.3: Fallback Strategy Coverage

Ask Claude:
```
Read figma-fallback-strategy.md and list all 5 fallback steps.
```

**Expected Output**:
1. Automatic URL parsing
2. Fuzzy matching
3. Hierarchical exploration
4. Visual confirmation
5. Registry updates

**Pass Criteria**: All 5 steps documented and explained

---

## Test Execution Checklist

### Setup Phase
- [ ] Figma MCP server configured (`claude mcp list`)
- [ ] Authenticated with Figma (`whoami` works)
- [ ] Repository cloned locally
- [ ] Skills available (`@african-puzzle-works-design/SKILL.md` exists)

### Smoke Tests (Critical Path)
- [ ] Test 1.3: Basic Figma access works
- [ ] Test 2.1: Registry contains components
- [ ] Test 3.1: Can fetch screenshot
- [ ] Test 4.1: Skill loads successfully
- [ ] Test 5.1: Skill auto-loads on trigger phrase
- [ ] Test 6.2: URL parsing works

### Full Test Suite
- [ ] Phase 1: All MCP server tests (3 tests)
- [ ] Phase 2: All registry tests (2 tests)
- [ ] Phase 3: All data fetching tests (3 tests)
- [ ] Phase 4: All skill integration tests (3 tests)
- [ ] Phase 5: All Flutter UI designer tests (2 tests)
- [ ] Phase 6: All fallback tests (4 tests)
- [ ] Phase 7: All validation tests (2 tests)
- [ ] Phase 8: All workflow tests (2 tests)
- [ ] Phase 9: All error handling tests (3 tests)
- [ ] Phase 10: All documentation tests (3 tests)

**Total Tests**: 27 tests across 10 phases

### Pass Criteria

**Minimum Viable** (for PR approval):
- ✅ All smoke tests pass
- ✅ At least 80% of full test suite passes
- ✅ No critical failures in error handling

**Production Ready**:
- ✅ 100% of full test suite passes
- ✅ All documentation accurate
- ✅ Fallback strategies work smoothly

## Quick Test Script

Copy-paste this into Claude to run basic validation:

```
I want to test the Figma MCP integration for African Puzzle Works.

Please do the following tests in order and report results:

1. Check if Figma MCP server is configured (use whoami)
2. Load the african-puzzle-works-design skill
3. Read FIGMA_REGISTRY.md and list all components
4. Fetch the screenshot for the Buttons component (node: 362-6)
5. Fetch the design context for the Buttons component
6. Tell me the background color of the primary button

For each step, report: ✅ Success or ❌ Failure with error details.
```

**Expected Result**: All 6 steps should succeed with ✅

## Troubleshooting Guide

### Issue: "MCP server not found"
**Solution**: Run `claude mcp add --transport http figma https://mcp.figma.com/mcp`

### Issue: "Authentication required"
**Solution**: Re-authenticate with Figma MCP server

### Issue: "Node ID not found"
**Solution**:
1. Check if node ID format is correct (`362-6` or `362:6`)
2. Verify component still exists in Figma
3. Check if Figma file structure changed

### Issue: "Skill not loading"
**Solution**: Verify file path: `@african-puzzle-works-design/SKILL.md` exists

### Issue: "Registry doesn't have component"
**Solution**: This is expected! Use fallback workflow to add it

---

## Success Indicators

After testing, you should be able to:

1. ✅ **Fetch any component** from Figma using registry node IDs
2. ✅ **Get live measurements** that match current Figma state
3. ✅ **Auto-load skill** when working on African Puzzle Works
4. ✅ **Handle missing components** gracefully with fallbacks
5. ✅ **Parse Figma URLs** automatically without manual extraction
6. ✅ **Cross-reference** live Figma with documentation
7. ✅ **Detect discrepancies** between Figma and cached docs

## Next Steps After Testing

If all tests pass:
- ✅ Mark PR as ready for review
- ✅ Merge to main
- ✅ Start using in production

If tests fail:
- 🔧 Fix identified issues
- 📝 Update documentation
- 🔄 Re-run failed tests
- 📊 Document any known limitations

---

**Last Updated**: 2026-01-28
**Test Coverage**: 27 tests across 10 phases
**Maintained By**: African Puzzle Works Team
