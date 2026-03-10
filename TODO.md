# SwiftChartInteractions — Implementation Todo Plan

## Phase 1 — Repository Setup

- [ ] **Step 1**: Initialize git repository and create development branch
  - Run `git init`
  - Run `git checkout -b develop`
  - Commit: "chore: initialize repository and create develop branch"

- [ ] **Step 2**: Create Swift Package structure
  - Run `swift package init --type library`
  - Update Package.swift to set `.iOS(.v18)` as minimum platform
  - Install Tuist CLI for project generation: `brew install tuist` or `curl -Ls https://install.tuist.io | bash`
  - Commit: "chore: create Swift package structure"

- [ ] **Step 3**: Add Package Description
  - Create README.md with basic package info
  - Create LICENSE (MIT)
  - Commit: "docs: add initial README and license"


## Phase 2 — Core Architecture

- [ ] **Step 4**: Define Interaction Types
  - Create `Sources/SwiftChartInteractions/ChartInteraction.swift`
  - Define enum with: `.tapHighlight`, `.crosshair`, `.tooltip`, `.rangeSelection`, `.zoom`
  - Commit: "feat: add ChartInteraction enum"

- [ ] **Step 5**: Create Interaction Configuration
  - Create `Sources/SwiftChartInteractions/ChartInteractionsConfiguration.swift`
  - Implement `ChartInteractionsConfiguration` struct with `interactions: Set<ChartInteraction>`
  - Commit: "feat: add configuration container for chart interactions"

- [ ] **Step 6**: Add SwiftUI Modifier Entry Point
  - Create `Sources/SwiftChartInteractions/ChartInteractionsModifier.swift`
  - Implement `ChartInteractionsModifier: ViewModifier` with empty body
  - Commit: "feat: add base view modifier for chart interactions"

- [ ] **Step 7**: Add Public View Extension
  - Create `Sources/SwiftChartInteractions/View+ChartInteractions.swift`
  - Add `chartInteractions(_:)` extension to View
  - Commit: "feat: expose chartInteractions SwiftUI modifier"

- [ ] **Step 7b**: Create Tuist Project.swift
  - Create `Project.swift` for demo app and test targets
  - Define `DemoApp` target (iOS app)
  - Define `SwiftChartInteractionsTests` target
  - Commit: "chore: add Tuist Project.swift configuration"


## Phase 3 — Gesture Infrastructure

- [ ] **Step 8**: Create Interaction State
  - Create `Sources/SwiftChartInteractions/ChartInteractionState.swift`
  - Implement `ChartInteractionState: ObservableObject` with `selectedLocation: CGPoint?`
  - Commit: "feat: add interaction state container"

- [ ] **Step 9**: Inject Interaction State into Modifier
  - Update `ChartInteractionsModifier` to add `@StateObject private var state = ChartInteractionState()`
  - Commit: "feat: integrate interaction state into modifier"

- [ ] **Step 10**: Add Basic Drag Gesture
  - Add `DragGesture` to modifier with `onChanged` to update `state.selectedLocation`
  - Commit: "feat: add base drag gesture for interaction tracking"


## Phase 4 — Tap Highlight Interaction

- [ ] **Step 11**: Create Highlight Overlay
  - Create `Sources/SwiftChartInteractions/HighlightOverlay.swift`
  - Implement `Circle()` overlay with 10x10 frame
  - Commit: "feat: add highlight overlay view"

- [ ] **Step 12**: Enable Highlight When Interaction Active
  - Conditionally render `HighlightOverlay` when `.tapHighlight` is enabled
  - Commit: "feat: implement tap highlight interaction"


## Phase 5 — Crosshair Interaction

- [ ] **Step 13**: Create Crosshair View
  - Create `Sources/SwiftChartInteractions/CrosshairOverlay.swift`
  - Implement vertical line using `Path`
  - Commit: "feat: add crosshair overlay"

- [ ] **Step 14**: Attach Crosshair to Gesture Location
  - Update crosshair position based on `state.selectedLocation`
  - Commit: "feat: connect crosshair overlay to gesture state"


## Phase 6 — Tooltip Interaction

- [ ] **Step 15**: Create Tooltip View
  - Create `Sources/SwiftChartInteractions/TooltipView.swift`
  - Implement tooltip with `Text`, padding, `.ultraThinMaterial` background, corner radius
  - Commit: "feat: add tooltip view"

- [ ] **Step 16**: Display Tooltip Near Selected Point
  - Position tooltip near interaction location
  - Commit: "feat: render tooltip near selected chart point"


## Phase 7 — Range Selection

- [ ] **Step 17**: Add Range Selection State
  - Update `ChartInteractionState` with `dragStart: CGPoint?` and `dragEnd: CGPoint?`
  - Commit: "feat: add range selection state"

- [ ] **Step 18**: Draw Range Highlight Overlay
  - Create rectangle overlay for range selection
  - Implement `Rectangle().fill(.blue.opacity(0.2))`
  - Commit: "feat: implement range selection overlay"


## Phase 8 — Zoom Interaction (Optional)

- [ ] **Step 19**: Add Magnification Gesture
  - Add `MagnificationGesture()` to support zoom interaction
  - Commit: "feat: add zoom gesture support"


## Phase 9 — Demo Application

- [ ] **Step 20a**: Install Tuist skill for generated-projects
  - Run `npx skills add tuist/agent-skills --skill generated-projects`
  - This provides guidance on generation, build/test commands for Tuist projects
  - Commit: "chore: install tuist generated-projects skill"

- [ ] **Step 20b**: Create Demo App with Tuist
  - Create `Examples/DemoApp/` directory
  - Create `DemoApp` target in `Project.swift`
  - Generate Xcode project with `tuist generate`
  - Implement demo with line chart, bar chart, and interactions
  - Commit: "feat: add demo app showcasing chart interactions"


## Phase 10 — Tests

- [ ] **Step 21a**: Add Tuist skill for fix-flaky-tests (optional)
  - Run `npx skills add tuist/agent-skills --skill fix-flaky-tests`
  - Useful for analyzing and fixing test failures

- [ ] **Step 21b**: Add Unit Test Target with Tuist
  - Create test target in `Project.swift`
  - Generate project with `tuist generate`
  - Add tests for configuration and interaction enabling
  - Commit: "test: add initial unit tests"


## Phase 11 — Documentation

- [ ] **Step 22**: Improve README
  - Expand README with: Introduction, Installation (SPM), Usage, Examples, Feature list
  - Commit: "docs: expand README with usage and examples"

- [ ] **Step 23**: Add Demo GIF
  - Record example interaction demo
  - Add GIF to README
  - Commit: "docs: add demo GIF to README"


## Phase 12 — Open Source Readiness

- [ ] **Step 24**: Add Contribution Guide
  - Create `CONTRIBUTING.md`
  - Commit: "docs: add contributing guide"

- [ ] **Step 25**: Tag First Release
  - Run `git tag 0.1.0`
  - Commit: "release: v0.1.0 initial release"


---

## Summary

| Phase | Steps | Status |
|-------|-------|--------|
| Phase 1: Repository Setup | 1-3 | ⬜ |
| Phase 2: Core Architecture | 4-7b | ⬜ |
| Phase 3: Gesture Infrastructure | 8-10 | ⬜ |
| Phase 4: Tap Highlight | 11-12 | ⬜ |
| Phase 5: Crosshair | 13-14 | ⬜ |
| Phase 6: Tooltip | 15-16 | ⬜ |
| Phase 7: Range Selection | 17-18 | ⬜ |
| Phase 8: Zoom | 19 | ⬜ |
| Phase 9: Demo App | 20a-20b | ⬜ |
| Phase 10: Tests | 21a-21b | ⬜ |
| Phase 11: Documentation | 22-23 | ⬜ |
| Phase 12: Release | 24-25 | ⬜ |

**Total: 28 steps**
