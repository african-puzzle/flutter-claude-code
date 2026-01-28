# Flutter Development Ecosystem - Complete Agent Architecture

> **African Puzzle Works Customized Version**
> This is a fork of [flutter-claude-code](https://github.com/cleydson/flutter-claude-code) customized for the African Puzzle Works mobile app. It includes the complete original ecosystem plus the **African Puzzle Works Design System** skill.

This repository contains a comprehensive Flutter development ecosystem powered by 19 specialized Claude Code agents and skills, available as modular plugins.

## Overview

This system provides **19 specialized agents** and **2 comprehensive skills** organized into **6 categories** that enable seamless Flutter development from design to production deployment on iOS and Android.

**Note:** This is a customized fork that includes the **African Puzzle Works Design System** skill (v2.0.0), which provides design tokens, component specifications, and theme configuration for the African Puzzle Works mobile app. **Key differentiator**: This fork implements a **Figma-first approach** using the Figma MCP server to fetch live design data, eliminating stale screenshot issues and ensuring implementations are always current with the latest designs.

## What's New in This Fork

### v2.0.0 - Figma Live Sync Strategy (PR #4)
**Major Innovation**: Eliminates stale screenshot issues by using Figma as the source of truth

- ✨ **Figma MCP Integration**: Direct integration with Figma MCP server for real-time design data
- 📋 **Component Registry**: [FIGMA_REGISTRY.md](african-puzzle-works-design/FIGMA_REGISTRY.md) maps all components to Figma node IDs
- 🔄 **Live Fetching**: Always fetch latest design during implementation (no more stale screenshots)
- 🧠 **Intelligent Fallback**: 5-step progressive discovery when components not in registry
- 📊 **8 New Reference Docs**: measurements, animations, states, icons, elevation, responsive, dark-mode, edge-cases
- 📸 **Organized Screenshots**: Restructured into components/, screens/, redlines/, examples/ for better organization
- 📚 **Visual Quick Start Guide**: Decision tree flowchart for component lookup workflows

### v1.1.0 - Screen Assets Addition (PR #3)
- 📸 Added contact, profile, and splash screen reference screenshots
- 🎨 Expanded visual reference library for implementation

See [african-puzzle-works-design/SKILL.md](african-puzzle-works-design/SKILL.md) for complete changelog and version history.

## Installation

This repository is structured as a Claude Code plugin marketplace. You can install everything at once or choose specific categories:

### Install Everything (Recommended)
```bash
# For African Puzzle Works customized version (includes design system)
/plugin marketplace add https://github.com/african-puzzle/flutter-claude-code
/plugin install flutter-all@flutter-claude-code

# For original version
# /plugin marketplace add https://github.com/cleydson/flutter-claude-code
# /plugin install flutter-all@flutter-claude-code
```

### Install Specific Categories
```bash
/plugin install flutter-ui@flutter-claude-code                    # UI & Design agents
/plugin install flutter-testing-performance@flutter-claude-code   # Testing & Performance
/plugin install flutter-architecture@flutter-claude-code          # Architecture & State Management
/plugin install flutter-platform@flutter-claude-code              # Platform Integration
/plugin install flutter-backend@flutter-claude-code               # Backend Integration
/plugin install flutter-deployment@flutter-claude-code            # iOS & Android Deployment
/plugin install flutter-patterns@flutter-claude-code              # Patterns & Best Practices Skill
```

### African Puzzle Works Custom Installation
This fork includes the African Puzzle Works Design System:
```bash
# The african-puzzle-works-design skill is included in this repository
# and automatically available to the flutter-ui-designer agent
```

### Figma MCP Server Setup (African Puzzle Works Fork)
To enable live Figma sync, configure the Figma MCP server:

```bash
# Verify MCP server is available
claude mcp list

# If not configured, add Figma MCP server
claude mcp add --transport http figma https://mcp.figma.com/mcp
```

Once configured, agents will automatically fetch live design data from Figma instead of using static screenshots.

**Figma Design System**: [African Puzzle Design System](https://www.figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX/African-Puzzle-Design-System) (File Key: `8S2Jt5xKHfTmlI8rSR6AcX`)

See [african-puzzle-works-design/references/figma-sync-strategy.md](african-puzzle-works-design/references/figma-sync-strategy.md) for complete workflow details.

See [PLUGIN_INSTALLATION.md](PLUGIN_INSTALLATION.md) for detailed installation instructions and plugin documentation.

## To Do: Items to Add to Figma Component Registry

- [X] `Button` - Primary, Secondary, Text, Icon, Segmented button variants with all states
- [X] `Bottom Sheets` - Action sheet, Selection sheet, Calendar sheet, Price sheet variations
- [X] `View Headers` - 7 header variants (Default, Project, Calendar, Search, Tabs, Album, Contact)
- [X] `Primitives / Colors` - Complete color palette with all shades (Primary, Basic, Success, Info, Warning, Danger)
- [X] `Icons` - White, Dark, and Other icon sets
- [ ] `Bottom Nav` - Bottom navigation bar with icons
- [ ] `Cards` -  
- [ ] `Inputs` - Text input with validation and error states
- [ ] `Forms` - Form with validation and error states
- [ ] `List` - List with items and separators
- [ ] `Navigation` - Bottom navigation bar with icons
- [ ] `Progress` - Progress indicator with different styles
- [ ] `Audio player` - Audio player with controls
- [ ] `Audio Recorder` - Audio recorder with controls
- [ ] `Project List` - Project list with items
- [ ] `Project Detail` - Project detail with items
- [ ] `Calendar List` - Calendar list with items
- [ ] `Search` - Search with results
- [ ] `Tabs` - Tabs with content
- [ ] `Album` - Album with images
- [ ] `Contact's Projects` - Contact with projects
- [ ] `Measurement Card` - Measurement card with details
- [ ] `Sidebar` - Sidebar with navigation
- [ ] `Image Carousel` - Image carousel with navigation
- [ ] `Photo Detail view` - Photo detail view with navigation and menu


## Quick Links

### Installation & Usage
- **[PLUGIN_INSTALLATION.md](PLUGIN_INSTALLATION.md)** - Installation guide
- **[AGENT_USAGE_SCENARIOS.md](AGENT_USAGE_SCENARIOS.md)** - Practical usage examples
- **[WORKFLOW_DIAGRAMS.md](WORKFLOW_DIAGRAMS.md)** - Visual workflow diagrams

### African Puzzle Works Design System (Fork-Specific)
- **[FIGMA_REGISTRY.md](african-puzzle-works-design/FIGMA_REGISTRY.md)** - Component → Figma node ID registry
- **[QUICK_START.md](african-puzzle-works-design/QUICK_START.md)** - Visual guide for component lookup
- **[figma-sync-strategy.md](african-puzzle-works-design/references/figma-sync-strategy.md)** - Figma live sync strategy
- **[figma-fallback-strategy.md](african-puzzle-works-design/references/figma-fallback-strategy.md)** - Intelligent fallback system
- **[SKILL.md](african-puzzle-works-design/SKILL.md)** - Complete design system skill documentation

### Contributing
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - Contributing guidelines and architecture reference

## System Architecture

### Category 1: Design-to-Implementation Pipeline
The core workflow for converting designs into pixel-perfect Flutter implementations.

- **flutter-ui-designer**: Flutter UI Designer (Design Analysis & Widget Selection)
- **flutter-ui-implementer**: Flutter UI Implementer (Code Generation & Styling)
- **flutter-device-orchestrator**: Flutter Device Orchestrator (Simulator/Emulator Management)
- **flutter-ui-comparison**: UI Comparison & Validation Specialist
- **flutter-design-iteration-coordinator**: Design Iteration Coordinator (Workflow Orchestrator)

### Category 2: Flutter Architecture & Code Organization
Ensures clean, maintainable, and scalable applications.

- **flutter-architect**: Flutter Architect (Project Structure & Patterns)
- **flutter-state-management**: Flutter State Management Specialist

### Category 3: Platform-Specific Development
Handles iOS and Android native integrations.

- **flutter-ios-integration**: iOS Integration Specialist
- **flutter-android-integration**: Android Integration Specialist
- **flutter-platform-channel-architect**: Platform Channel Architect

### Category 4: Performance Optimization
Ensures smooth, efficient applications.

- **flutter-performance-analyzer**: Flutter Performance Analyzer
- **flutter-performance-optimizer**: Flutter Performance Optimizer

### Category 5: API Integration & Backend Connectivity
Connects to various backend services.

- **flutter-rest-api**: Flutter REST API Specialist
- **flutter-firebase**: Flutter Firebase Integration Expert
- **flutter-aws**: Flutter AWS Integration Expert
- **flutter-graphql**: Flutter GraphQL Integration Expert

### Category 6: Quality Assurance & Deployment
Ensures code quality and smooth deployments.

- **flutter-testing**: Flutter Testing Expert
- **flutter-ios-deployment**: Flutter Deployment Specialist (iOS)
- **flutter-android-deployment**: Flutter Deployment Specialist (Android)

## Primary Workflows

### 1. Design-to-Implementation (Core Workflow)

```
Design Input → UI Designer → UI Implementer → Device Orchestrator →
UI Comparison → Design Iteration Coordinator → Pixel-Perfect Implementation
```

**Capabilities:**
- Analyze Figma designs or screenshots
- Generate Flutter widget hierarchies
- Implement with exact styling
- Launch on iOS simulators and Android emulators
- Compare implementation with original design
- Iterate until pixel-perfect (>95% fidelity)

### 2. Complete Development Lifecycle

```
Design → Architecture → Implementation → Backend Integration →
Performance Optimization → Testing → Deployment
```

**Capabilities:**
- Set up Clean Architecture project structure
- Implement state management (Provider, BLoC, Riverpod)
- Integrate iOS/Android native features
- Connect to REST APIs, Firebase, AWS, GraphQL
- Profile and optimize performance
- Write comprehensive tests
- Deploy to App Store and Play Store

## Documentation Foundation

All agents are grounded in the official Flutter documentation at https://docs.flutter.dev, covering:

- **UI Development**: /ui/widgets, /ui/layout, /ui/animations, /ui/design/material
- **Platform Integration**: /platform-integration/ios, /platform-integration/android, /platform-integration/platform-channels
- **State & Data**: /data-and-backend/state-mgmt, /data-and-backend/networking, /data-and-backend/firebase
- **Performance**: /perf, /perf/rendering-performance, /tools/devtools
- **Testing**: /testing/overview, /testing/debugging
- **Deployment**: /deployment/android, /deployment/ios
- **Architecture**: /resources/architectural-overview, /get-started/fundamentals

## Key Features

### Design Fidelity
- Pixel-perfect accuracy (>95% fidelity)
- Automated comparison between design and implementation
- Iterative refinement process
- Support for Figma, screenshots, and mockups

### Figma Live Sync (African Puzzle Works Fork)
- **Real-time design data**: Always fetches latest from Figma via MCP server
- **No stale screenshots**: Eliminates manual screenshot updates and sync issues
- **Component registry**: Quick lookup system for instant component fetching
- **Intelligent fallback**: 5-step discovery strategy when components not found
- **Single source of truth**: Figma is authoritative, documentation references it
- **Automatic validation**: Compare implementation against live Figma state
- **Version tracking**: Design system versioning with comprehensive changelog

### Platform Parity
- Consistent features across iOS and Android
- Platform-specific native integrations when needed
- Proper Material Design (Android) and Cupertino (iOS) implementations
- Platform channel support for native code

### Backend Flexibility
- REST API integration (http, dio)
- Firebase (FlutterFire) support
- AWS Amplify integration
- GraphQL client setup
- Custom backend solutions

### Production Ready
- Comprehensive testing (unit, widget, integration)
- Performance optimization
- App Store deployment automation
- Play Store deployment automation
- CI/CD pipeline setup

## Getting Started

### Quick Start Example: Design to Implementation

```
1. Export your design from Figma as PNG
2. Save to /designs/screen_name.png
3. Ask flutter-design-iteration-coordinator:
   "Create a pixel-perfect implementation of /designs/screen_name.png"
4. Agent orchestrates the complete workflow
5. Receive pixel-perfect Flutter code
```

### Example: New Project Setup

```
1. Ask flutter-architect:
   "Create a new e-commerce app with Clean Architecture"
2. Receive complete project structure
3. Ask flutter-state-management:
   "Set up BLoC for state management"
4. Receive configured state management
```

### Example: Firebase Integration

```
1. Ask flutter-firebase:
   "Set up Firebase Auth and Firestore for user profiles"
2. Receive complete Firebase integration
3. Get authentication service and Firestore service
```

## Success Metrics

The system tracks effectiveness through:

- **Design Fidelity**: Percentage match between design and implementation
- **Iteration Efficiency**: Number of iterations to achieve pixel-perfect result
- **Code Quality**: Maintainability score, test coverage
- **Performance**: Frame rendering, memory usage, app size
- **Deployment Success**: App store approval rate, deployment time

## Available Skills

### flutter-patterns
The `flutter-patterns` skill provides on-demand reference for:

1. **Widget Patterns**: Common widget compositions and best practices
2. **Animation Patterns**: Reusable animation implementations
3. **Testing Patterns**: Test templates and strategies
4. **Performance Patterns**: Optimization techniques
5. **Security Patterns**: Security best practices

### african-puzzle-works-design
The `african-puzzle-works-design` skill provides the complete design system for the African Puzzle Works mobile app with a **Figma-first approach** (v2.0.0):

1. **Figma Live Sync**: Direct integration with Figma MCP server for real-time design data
2. **Component Registry**: [FIGMA_REGISTRY.md](african-puzzle-works-design/FIGMA_REGISTRY.md) mapping components to Figma node IDs for instant fetching
3. **Design Tokens**: Colors, typography, spacing system (8pt grid), border radii, shadows
4. **Component Specifications**: 30+ component specs with Flutter widget mappings
5. **Layout Patterns**: Screen templates, navigation flows, loading/error/empty states
6. **Flutter Theme**: Complete ThemeData configuration with ColorScheme and TextTheme
7. **Intelligent Fallback**: 5-step progressive discovery strategy when components aren't found
8. **Integration**: Automatically triggered by flutter-ui-designer for African Puzzle Works projects

**Key Innovation**: Uses Figma as source of truth instead of static screenshots, eliminating stale design issues and ensuring implementations are always current.

## Figma MCP Integration

This customized version includes **Figma MCP server integration** for the African Puzzle Works Design System, enabling real-time design synchronization:

### How It Works

1. **Component Registry**: [FIGMA_REGISTRY.md](african-puzzle-works-design/FIGMA_REGISTRY.md) maps all design system components to Figma node IDs
2. **Live Fetching**: Agents use `mcp__figma__get_screenshot`, `mcp__figma__get_design_context`, and `mcp__figma__get_variable_defs` tools
3. **No Stale Screenshots**: Always fetches latest design from Figma during implementation
4. **Automatic Validation**: Compare implementation against current Figma state

### Workflow Example

```
User: "Implement the primary button"
     ↓
1. Check FIGMA_REGISTRY.md → Buttons (node: 362-6)
2. Fetch live screenshot via MCP
3. Fetch specs (colors, spacing, typography)
4. Cross-reference references/components.md
5. Implement with live Figma values
     ↓
Result: Pixel-perfect, always up-to-date implementation
```

### Intelligent Fallback Strategy

When a component isn't in the registry, the system uses a 5-step progressive discovery approach:

1. **URL Parsing**: Auto-extract node ID from Figma URLs
2. **Fuzzy Matching**: Suggest similar components from registry
3. **Hierarchical Exploration**: Navigate Figma structure via metadata
4. **Visual Confirmation**: Show preview before implementation
5. **Registry Updates**: Add newly-found components for future use

See [references/figma-sync-strategy.md](african-puzzle-works-design/references/figma-sync-strategy.md) and [references/figma-fallback-strategy.md](african-puzzle-works-design/references/figma-fallback-strategy.md) for complete details.

## Agent Interaction Matrix

Agents are designed to work together:

- **flutter-design-iteration-coordinator** orchestrates flutter-ui-designer, flutter-ui-implementer, flutter-device-orchestrator, and flutter-ui-comparison
- **flutter-architect** works with flutter-state-management
- **flutter-platform-channel-architect** coordinates with flutter-ios-integration and flutter-android-integration
- **flutter-performance-analyzer** feeds findings to flutter-performance-optimizer
- **flutter-ios-deployment** and **flutter-android-deployment** work in parallel
- **flutter-ui-designer** integrates with **african-puzzle-works-design** skill and Figma MCP for real-time design sync

## Repository Structure

```
flutter-claude-code/
├── README.md                      # Overview and quick start
├── CLAUDE.md                      # Project-specific instructions
├── PLUGIN_INSTALLATION.md         # Installation instructions
├── AGENT_USAGE_SCENARIOS.md       # Practical usage examples
├── CONTRIBUTING.md                # Contributing guidelines
├── WORKFLOW_DIAGRAMS.md           # Visual workflow diagrams
├── ARCHITECTURE_NOTES.md          # Technical architecture notes
├── .claude/                       # Agent and skill definitions
│   ├── agents/                    # 19 specialized agent definitions
│   │   ├── flutter-ui-designer.md
│   │   ├── flutter-ui-implementer.md
│   │   ├── flutter-device-orchestrator.md
│   │   ├── flutter-ui-comparison.md
│   │   ├── flutter-design-iteration-coordinator.md
│   │   ├── flutter-architect.md
│   │   ├── flutter-state-management.md
│   │   ├── flutter-ios-integration.md
│   │   ├── flutter-android-integration.md
│   │   ├── flutter-platform-channel-architect.md
│   │   ├── flutter-performance-analyzer.md
│   │   ├── flutter-performance-optimizer.md
│   │   ├── flutter-rest-api.md
│   │   ├── flutter-firebase.md
│   │   ├── flutter-aws.md
│   │   ├── flutter-graphql.md
│   │   ├── flutter-testing.md
│   │   ├── flutter-ios-deployment.md
│   │   └── flutter-android-deployment.md
│   └── skills/                    # Reusable skill definitions
│       └── flutter-patterns/      # Flutter patterns & best practices
├── african-puzzle-works-design/   # African Puzzle Works Design System skill (v2.0.0)
│   ├── SKILL.md                   # Skill definition and overview (Figma-first approach)
│   ├── FIGMA_REGISTRY.md          # Component → Figma node ID registry for MCP fetching
│   ├── QUICK_START.md             # Visual guide and decision tree for component lookup
│   ├── references/                # Design system documentation
│   │   ├── tokens.md              # Colors, typography, spacing, shadows
│   │   ├── components.md          # Component specifications
│   │   ├── patterns.md            # Layout patterns and screen templates
│   │   ├── flutter-theme.md       # ThemeData implementation guide
│   │   ├── figma-sync-strategy.md # Programmatic Figma sync strategy
│   │   ├── figma-fallback-strategy.md # Intelligent fallback when components not found
│   │   ├── measurements.md        # Precise component measurements
│   │   ├── animations.md          # Animation specifications
│   │   ├── states.md              # Component state documentation
│   │   ├── icons.md               # Icon library and usage
│   │   ├── elevation.md           # Shadow system specifications
│   │   ├── responsive.md          # Responsive behavior guidelines
│   │   ├── dark-mode.md           # Dark theme specifications
│   │   └── edge-cases.md          # Edge case handling patterns
│   └── assets/                    # Design assets and theme code
│       ├── screens/               # Reference screenshots (supplementary, not source of truth)
│       │   ├── components/        # Component screenshots by type
│       │   ├── screens/           # Full screen screenshots (contacts, profile, splash)
│       │   ├── redlines/          # Annotated measurement screenshots
│       │   └── examples/          # Edge case examples
│       └── theme/                 # Flutter theme implementation
│           └── app_theme.dart     # Complete ThemeData configuration
├── flutter-all/                   # Meta-plugin for full installation
│   └── skills/
├── flutter-ui/                    # UI & Design agents plugin
│   └── agents/
├── flutter-testing-performance/   # Testing & Performance plugin
│   └── agents/
├── flutter-architecture/          # Architecture & State Management plugin
│   └── agents/
├── flutter-platform/              # Platform Integration plugin
│   └── agents/
├── flutter-backend/               # Backend Integration plugin
│   └── agents/
├── flutter-deployment/            # iOS & Android Deployment plugin
│   └── agents/
└── flutter-patterns/              # Patterns & Best Practices skill plugin
    └── skills/
```

## Getting Started

1. **Install** the plugins using the instructions in `PLUGIN_INSTALLATION.md`
2. **Explore** practical usage examples in `AGENT_USAGE_SCENARIOS.md`
3. **Review** workflow diagrams in `WORKFLOW_DIAGRAMS.md`
4. **Start** building with the agents that match your needs

## Contributing

Contributions are welcome! See `CONTRIBUTING.md` for guidelines on:
- Adding new agents
- Improving existing agents
- Updating documentation
- Testing and quality standards

## Documentation Coverage

This architecture covers:
- ✅ UI Development (Material, Cupertino, layouts, animations)
- ✅ Platform Integration (iOS, Android, platform channels)
- ✅ State Management (Provider, BLoC, Riverpod, etc.)
- ✅ Networking (REST, GraphQL, WebSockets)
- ✅ Backend Services (Firebase, AWS, custom APIs)
- ✅ Performance (profiling, optimization, DevTools)
- ✅ Testing (unit, widget, integration, golden)
- ✅ Deployment (iOS App Store, Google Play Store, CI/CD)
- ✅ Architecture (Clean Architecture, design patterns)
- ✅ Responsive Design (multi-device, adaptive layouts)

## Production Deployment Support

Both iOS and Android deployment are fully supported:

**iOS:**
- Xcode configuration
- Code signing setup
- TestFlight beta testing
- App Store submission
- CI/CD automation

**Android:**
- Gradle configuration
- App signing
- Play Store internal testing
- Production release
- CI/CD automation

## Conclusion

This Flutter agent ecosystem provides a complete, production-ready development system that takes you from initial design concepts through to deployed applications on both iOS and Android platforms.

The modular architecture allows you to start with the core design-to-implementation workflow and progressively expand to cover all aspects of Flutter development.

---

**Total Agents**: 19 specialized agents
**Total Skills**: 2 comprehensive skills (flutter-patterns + african-puzzle-works-design v2.0.0)
**Coverage**: Complete Flutter development lifecycle
**Platforms**: iOS, Android (with Web/Desktop extensibility)
**Documentation Base**: Official Flutter docs at https://docs.flutter.dev
**Figma Integration**: Real-time design sync via MCP server (African Puzzle Works fork)
**Status**: Production ready
