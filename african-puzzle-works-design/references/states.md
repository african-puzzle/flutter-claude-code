# Component States

This document defines all visual states for interactive components in the African Puzzle Works design system.

## Button States

### Primary Button (Elevated)

**Default**:
- Background: `#3D2664` (Primary 500)
- Text: `#FFFFFF` (White)
- Elevation: 2dp
- Shadow: `0px 2px 4px rgba(0,0,0,0.15)`
- Opacity: 100%

**Hover** (web/desktop):
- Background: `#4A2F7A` (Primary 600 - 15% darker)
- Text: `#FFFFFF`
- Elevation: 4dp
- Shadow: `0px 4px 8px rgba(0,0,0,0.15)`
- Cursor: pointer

**Pressed/Active**:
- Background: `#2A1B47` (Primary 700 - 25% darker)
- Text: `#FFFFFF`
- Elevation: 1dp
- Shadow: `0px 1px 2px rgba(0,0,0,0.2)`
- Scale: 0.98 (subtle press down)
- Ripple: White at 20% opacity

**Focus** (keyboard navigation):
- Background: `#3D2664`
- Text: `#FFFFFF`
- Elevation: 2dp
- Outline: 2px solid `#776793` (text-subtle) with 2px offset
- Accessibility: Clear focus indicator

**Disabled**:
- Background: `#E4E9F2` (Basic 300)
- Text: `#8F9BB3` (Basic 600)
- Elevation: 0dp
- Shadow: None
- Opacity: 60%
- Cursor: not-allowed
- No interaction

**Loading**:
- Background: `#3D2664`
- Spinner: White, 20px × 20px, 2px stroke
- Text: Hidden or "Loading..."
- Disabled: true (no interaction)
- Elevation: 2dp

### Secondary Button (Outlined)

**Default**:
- Background: Transparent or `rgba(61, 38, 100, 0.04)`
- Border: 1px solid `#3D2664` (Primary 500)
- Text: `#3D2664`
- Elevation: 0dp

**Hover**:
- Background: `rgba(61, 38, 100, 0.08)`
- Border: 1px solid `#3D2664`
- Text: `#3D2664`
- Cursor: pointer

**Pressed**:
- Background: `rgba(61, 38, 100, 0.12)`
- Border: 1px solid `#3D2664`
- Text: `#3D2664`
- Ripple: Primary color at 12% opacity

**Focus**:
- Background: Transparent
- Border: 2px solid `#3D2664` (thicker)
- Text: `#3D2664`
- Outline: 2px solid `#776793` with 2px offset

**Disabled**:
- Background: Transparent
- Border: 1px solid `#E4E9F2` (Basic 300)
- Text: `#8F9BB3` (Basic 600)
- Opacity: 60%

### Text Button

**Default**:
- Background: Transparent
- Text: `#3D2664` (Primary 500)
- Underline: None

**Hover**:
- Background: `rgba(61, 38, 100, 0.04)`
- Text: `#3D2664`
- Cursor: pointer

**Pressed**:
- Background: `rgba(61, 38, 100, 0.08)`
- Text: `#2A1B47` (Primary 700)
- Ripple: Primary color at 12%

**Focus**:
- Background: Transparent
- Text: `#3D2664`
- Outline: 2px solid `#776793` with 2px offset

**Disabled**:
- Background: Transparent
- Text: `#8F9BB3` (Basic 600)
- Opacity: 60%

### Icon Button

**Default**:
- Background: Transparent
- Icon: Context-dependent color
- Size: 48px × 48px container, 24px icon

**Hover**:
- Background: `rgba(0, 0, 0, 0.04)` (light) or `rgba(255, 255, 255, 0.08)` (dark)
- Icon: Same color
- Border Radius: 24px (circular)

**Pressed**:
- Background: `rgba(0, 0, 0, 0.08)` (light)
- Icon: Same color
- Ripple: Circular, matching icon color at 12%

**Disabled**:
- Background: Transparent
- Icon: `#E4E9F2` (Basic 300)
- Opacity: 38%

## Input Field States

### Text Input

**Default** (Unfocused, Empty):
- Background: `#F7F9FC` (Basic 200)
- Border: 1px solid `#E4E9F2` (Basic 400)
- Text: `#192038` (Basic 900)
- Placeholder: `#8F9BB3` (Basic 600)
- Label: `#8F9BB3` (Basic 600), 14px

**Focused**:
- Background: `#FFFFFF` (White)
- Border: 2px solid `#3D2664` (Primary 500)
- Text: `#192038`
- Placeholder: Fades out
- Label: `#3D2664`, moves up if floating label
- Cursor: Blinking vertical line, `#3D2664`

**Filled** (Has text, unfocused):
- Background: `#F7F9FC`
- Border: 1px solid `#E4E9F2`
- Text: `#192038`
- Label: Remains elevated if floating

**Hover** (Unfocused):
- Background: `#F7F9FC`
- Border: 1px solid `#C5BED1` (Primary 100)
- Text: `#192038`
- Cursor: text cursor

**Error**:
- Background: `#FFF5F5` (light red tint)
- Border: 2px solid `#FF7070` (Danger 500)
- Text: `#192038`
- Label: `#FF7070`
- Error Message: `#FF7070`, 12px, below input
- Icon: Error icon in `#FF7070`

**Disabled**:
- Background: `#F7F9FC`
- Border: 1px solid `#E4E9F2`
- Text: `#8F9BB3` (Basic 600)
- Label: `#8F9BB3`
- Opacity: 60%
- Cursor: not-allowed

**Read-Only**:
- Background: `#F7F9FC`
- Border: 1px solid `#E4E9F2`
- Text: `#192038`
- Cursor: default (not text cursor)
- No focus state

## Card States

### Standard Card

**Default**:
- Background: `#FFFFFF` (White)
- Border: None
- Elevation: 2dp
- Shadow: `0px 2px 12px 2px rgba(0,0,0,0.25)`
- Border Radius: 8px

**Hover** (if interactive):
- Background: `#FFFFFF`
- Elevation: 4dp
- Shadow: `0px 4px 16px 2px rgba(0,0,0,0.25)`
- Transform: translateY(-2px)
- Cursor: pointer
- Transition: 150ms ease-out

**Pressed** (if interactive):
- Background: `#FFFFFF`
- Elevation: 1dp
- Shadow: `0px 1px 8px 2px rgba(0,0,0,0.2)`
- Transform: translateY(0px)
- Scale: 0.98

**Selected**:
- Background: `#FFFFFF`
- Border: 2px solid `#3D2664` (Primary 500)
- Elevation: 2dp
- Shadow: Same as default
- Checkmark: Optional, top-right corner

**Disabled** (if interactive):
- Background: `#F7F9FC` (Basic 200)
- Opacity: 60%
- Elevation: 0dp
- Shadow: None
- Cursor: not-allowed

## List Item States

### List Tile

**Default**:
- Background: Transparent
- Text: `#192038` (Basic 900)
- Subtitle: `#8F9BB3` (Basic 600)
- Icon: Context color
- Divider: `#E4E9F2` (if present)

**Hover**:
- Background: `rgba(0, 0, 0, 0.04)`
- Text: `#192038`
- Cursor: pointer

**Pressed**:
- Background: `rgba(0, 0, 0, 0.08)`
- Ripple: Grey at 12%

**Selected**:
- Background: `rgba(61, 38, 100, 0.08)` (Primary 500 at 8%)
- Text: `#3D2664` (Primary 500)
- Icon: `#3D2664`
- Border-left: 4px solid `#3D2664` (optional accent)

**Disabled**:
- Background: Transparent
- Text: `#8F9BB3` (Basic 600)
- Icon: `#E4E9F2` (Basic 300)
- Opacity: 60%

## Navigation States

### Bottom Navigation Item

**Default** (Unselected):
- Icon: `#776793` (text-subtle)
- Label: `#776793`, 10px Bold
- Background: Transparent

**Selected**:
- Icon: `#776793` (same as unselected - design choice)
- Label: `#776793` (same as unselected)
- Background: Transparent
- Indicator: Optional underline or background

**Pressed**:
- Background: `rgba(119, 103, 147, 0.08)`
- Ripple: Subtle grey

**Badge** (on unselected or selected):
- Background: `#FF7070` (Danger 500)
- Text: `#FFFFFF`, 10px Bold
- Position: Top-right of icon

## Switch & Toggle States

### Switch (Toggle)

**Off** (Default):
- Track: `#E4E9F2` (Basic 400)
- Thumb: `#FFFFFF` (White)
- Thumb Position: Left
- Elevation: 2dp on thumb

**On**:
- Track: `#3D2664` (Primary 500)
- Thumb: `#FFFFFF`
- Thumb Position: Right
- Elevation: 2dp on thumb

**Off + Hover**:
- Track: `#C5BED1` (Primary 100)
- Thumb: `#FFFFFF`

**On + Hover**:
- Track: `#4A2F7A` (Primary 600)
- Thumb: `#FFFFFF`

**Off + Disabled**:
- Track: `#F7F9FC` (Basic 200)
- Thumb: `#E4E9F2` (Basic 300)
- Opacity: 38%

**On + Disabled**:
- Track: `#C5BED1` (Primary 100)
- Thumb: `#E4E9F2`
- Opacity: 38%

## Checkbox States

### Checkbox

**Unchecked**:
- Border: 2px solid `#8F9BB3` (Basic 600)
- Background: Transparent
- Size: 20px × 20px
- Border Radius: 2px

**Checked**:
- Border: 2px solid `#3D2664` (Primary 500)
- Background: `#3D2664`
- Checkmark: White, stroke-width 2px
- Size: 20px × 20px

**Unchecked + Hover**:
- Border: 2px solid `#3D2664`
- Background: `rgba(61, 38, 100, 0.04)`

**Checked + Hover**:
- Border: 2px solid `#3D2664`
- Background: `#4A2F7A` (Primary 600)

**Indeterminate**:
- Border: 2px solid `#3D2664`
- Background: `#3D2664`
- Icon: Dash (minus) in white

**Disabled + Unchecked**:
- Border: 2px solid `#E4E9F2` (Basic 300)
- Background: Transparent
- Opacity: 38%

**Disabled + Checked**:
- Border: 2px solid `#E4E9F2`
- Background: `#E4E9F2`
- Checkmark: `#8F9BB3` (Basic 600)
- Opacity: 38%

## Radio Button States

### Radio

**Unselected**:
- Border: 2px solid `#8F9BB3` (Basic 600)
- Background: Transparent
- Size: 20px × 20px (outer circle)
- Border Radius: 50%

**Selected**:
- Border: 2px solid `#3D2664` (Primary 500)
- Background: Transparent
- Inner Circle: 10px × 10px, `#3D2664`, centered

**Unselected + Hover**:
- Border: 2px solid `#3D2664`
- Background: `rgba(61, 38, 100, 0.04)`

**Selected + Hover**:
- Border: 2px solid `#3D2664`
- Background: `rgba(61, 38, 100, 0.04)`
- Inner Circle: 10px, `#3D2664`

**Disabled + Unselected**:
- Border: 2px solid `#E4E9F2` (Basic 300)
- Background: Transparent
- Opacity: 38%

**Disabled + Selected**:
- Border: 2px solid `#E4E9F2`
- Background: Transparent
- Inner Circle: 10px, `#E4E9F2`
- Opacity: 38%

## Slider States

### Slider

**Default**:
- Active Track: `#3D2664` (Primary 500)
- Inactive Track: `#E4E9F2` (Basic 400)
- Thumb: `#3D2664`, 16px × 16px, circular
- Elevation: 2dp on thumb

**Hover**:
- Active Track: `#3D2664`
- Inactive Track: `#E4E9F2`
- Thumb: `#3D2664`, 20px × 20px (grows)
- Elevation: 4dp on thumb

**Pressed/Dragging**:
- Active Track: `#3D2664`
- Inactive Track: `#E4E9F2`
- Thumb: `#3D2664`, 20px × 20px
- Elevation: 8dp on thumb
- Ripple: Primary color at 12%, 40px radius

**Disabled**:
- Active Track: `#E4E9F2`
- Inactive Track: `#F7F9FC` (Basic 200)
- Thumb: `#E4E9F2`
- Opacity: 38%

## FAB States

### Floating Action Button

**Default**:
- Background: `#00E096` (Success 500 - green)
- Icon: `#FFFFFF`, 24px × 24px
- Elevation: 6dp
- Shadow: `0px 6px 12px rgba(0,0,0,0.25)`

**Hover**:
- Background: `#00C481` (Success 600)
- Icon: `#FFFFFF`
- Elevation: 12dp
- Shadow: `0px 12px 24px rgba(0,0,0,0.3)`

**Pressed**:
- Background: `#00A86B` (Success 700)
- Icon: `#FFFFFF`
- Elevation: 6dp
- Scale: 0.96

**Disabled**:
- Background: `#E4E9F2` (Basic 300)
- Icon: `#8F9BB3` (Basic 600)
- Elevation: 0dp
- Opacity: 38%

## Loading States

### Circular Progress Indicator

**Indeterminate** (no progress value):
- Stroke: 2.5px
- Color: `#3D2664` (Primary 500)
- Size: 24px (inline), 48px (full-screen)
- Animation: Continuous rotation + grow/shrink

**Determinate** (with progress value):
- Stroke: 2.5px
- Color: `#3D2664`
- Background Track: `#E4E9F2` (Basic 400)
- Size: As needed
- Value: 0-100%

### Linear Progress Indicator

**Indeterminate**:
- Height: 4px
- Color: `#3D2664`
- Background: `#E4E9F2`
- Animation: Sliding bar

**Determinate**:
- Height: 4px
- Active: `#3D2664`
- Inactive: `#E4E9F2`
- Value: 0-100%

## Empty & Error States

### Empty State

**Container**:
- Icon: 64px × 64px, `#8F9BB3` (Basic 600)
- Title: 18px Bold, `#192038` (Basic 900)
- Message: 14px Regular, `#8F9BB3` (Basic 600)
- Action Button: Optional
- Layout: Centered vertically and horizontally

### Error State

**Container**:
- Icon: 64px × 64px, `#FF7070` (Danger 500)
- Title: 18px Bold, `#192038` (Basic 900)
- Message: 14px Regular, `#FF7070` (Danger 500)
- Retry Button: Primary button style
- Layout: Centered

### Loading State (Screen)

**Container**:
- Spinner: 48px × 48px, `#3D2664`
- Message: "Loading..." 14px Regular, `#8F9BB3`
- Layout: Centered
- Background: Optional dim overlay

## Implementation Notes

### State Transitions
- All state transitions should be smooth: 150-200ms duration
- Use `AnimatedContainer` for color/size changes
- Use Material ripple effects for touch feedback

### Accessibility
- Focus states must have clear visual indicators
- Disabled states should have `semantics: excludeFromSemantics: true`
- Loading states should announce to screen readers

### Testing States
- Test all states in both light and dark mode
- Verify keyboard navigation shows focus states
- Check touch targets are minimum 48dp × 48dp
- Verify color contrast ratios meet WCAG AA standards (4.5:1 for text)
