# AGENTS.md - SwiftChartInteractions

## Overview

SwiftChartInteractions is a Swift Package that adds interaction capabilities (tap highlight, crosshair, tooltip, range selection, zoom) to Apple's Swift Charts using SwiftUI modifiers.

- **Platform**: iOS 18.0+
- **Swift Version**: 6.0+
- **Framework**: SwiftUI, Swift Charts

---

## Build, Test & Run Commands

### Build Commands

```bash
# Build the Swift Package
xcodebuild -scheme SwiftChartInteractions -destination 'platform=iOS Simulator,name=iPhone 17' build

# Or use xcodebuild with simulator ID
xcodebuild -scheme SwiftChartInteractions -destination 'platform=iOS Simulator,id=B619F8F8-B1E1-468F-B216-49BA8F3ECEDC' build

# SPM build (for library only)
swift build
```

### Test Commands

```bash
# Run all tests
swift test

# Run a single test
swift test --filter configurationInit
swift test --filter interactionEnumHashable  
swift test --filter multipleInteractions

# Run tests with verbose output
swift test -v

# Run tests matching a pattern
swift test --filter ".*Interaction.*"
```

### Demo App

```bash
# Build the demo app
xcodebuild -scheme DemoApp -destination 'platform=iOS Simulator,name=iPhone 17' build

# Run demo app
xcrun simctl boot "iPhone 17"
xcrun simctl install booted DerivedDataPath/*.app
xcrun simctl launch booted com.example.DemoApp
```

---

## Code Style Guidelines

### File Organization

- One public type per file (or group related small types)
- File name matches type name: `ChartInteraction.swift` contains `ChartInteraction`
- Imports at top of file, no empty lines between imports

```swift
import SwiftUI
import Combine

public struct ChartInteractionsConfiguration { ... }
```

### Naming Conventions

- **Types**: PascalCase (`ChartInteraction`, `HighlightOverlay`)
- **Properties/Variables**: camelCase (`selectedLocation`, `dragStart`)
- **Constants**: camelCase, prefer descriptive names (`minX`, `width`)
- **Enums**: PascalCase, members PascalCase (`.tapHighlight`, `.crosshair`)
- **Acronyms**: Keep uppercase if 2 letters (`UIKit`), lowercase if 3+ (`url`, `utf8`)

### Types & Declarations

- Use explicit types for public APIs, inferred for internal
- Use `public` for library API, `private`/`fileprivate` for implementation details
- Mark classes as `final` unless inheritance is needed

```swift
public struct ChartInteractionsConfiguration {
    public let interactions: Set<ChartInteraction>
    
    public init(_ interactions: [ChartInteraction]) {
        self.interactions = Set(interactions)
    }
}

final class ChartInteractionState: ObservableObject {
    @Published var selectedLocation: CGPoint?
}
```

### SwiftUI Patterns

- Use `@StateObject` for observable state in ViewModifiers
- Use `@State` for local view state
- Prefer `.overlay { }` and `.background { }` over `.overlay(alignment:) { }`
- Use `GeometryReader` for sizing overlays

```swift
public struct ChartInteractionsModifier: ViewModifier {
    let configuration: ChartInteractionsConfiguration
    @StateObject private var state = ChartInteractionState()
    
    public func body(content: Content) -> some View {
        content
            .gesture(...)
            .overlay {
                GeometryReader { geometry in
                    // overlay content
                }
            }
    }
}
```

### Control Flow

- Use `if let` for optional unwrapping
- Use `guard` early in functions
- Avoid nested conditionals when possible

```swift
if configuration.interactions.contains(.tapHighlight),
   let location = state.selectedLocation {
    HighlightOverlay(location: location)
}
```

### Error Handling

- Use `guard` for precondition checks
- Return optionals for operations that may fail gracefully
- Avoid force unwrapping (`!`) unless absolutely certain

### Formatting

- 4-space indentation (no tabs)
- No trailing whitespace
- Max line length: ~120 characters (soft guideline)
- Opening brace on same line, closing on new line
- Use trailing closure syntax where appropriate

```swift
// Good
Chart(data) { point in
    LineMark(x: .value("Year", point.year), y: .value("Value", point.value))
}

// Good - multi-line with proper indentation
.onChanged { value in
    state.selectedLocation = value.location
}
```

### Testing

- Use Swift Testing framework (`@Test` macro)
- Use `#expect()` for assertions
- Group related tests with descriptive names

```swift
@Test func configurationInit() {
    let config = ChartInteractionsConfiguration([.tapHighlight, .crosshair])
    #expect(config.interactions.contains(.tapHighlight))
}
```

### Git Conventions

- Use conventional commits: `feat:`, `fix:`, `chore:`, `docs:`, `test:`
- Keep commits atomic and focused
- Write descriptive commit messages

---

## Project Structure

```
SwiftChartInteractions/
├── Package.swift              # SPM manifest
├── Project.swift              # Tuist config (optional)
├── Sources/SwiftChartInteractions/
│   ├── ChartInteraction.swift
│   ├── ChartInteractionsConfiguration.swift
│   ├── ChartInteractionsModifier.swift
│   ├── ChartInteractionState.swift
│   ├── HighlightOverlay.swift
│   ├── CrosshairOverlay.swift
│   ├── TooltipView.swift
│   ├── RangeSelectionOverlay.swift
│   └── View+ChartInteractions.swift
├── Examples/DemoApp/
│   └── DemoApp.swift
└── Tests/
    └── SwiftChartInteractionsTests/
```

---

## Common Tasks

### Adding a New Interaction

1. Add case to `ChartInteraction` enum
2. Add state property to `ChartInteractionState` if needed
3. Create overlay view in `Sources/SwiftChartInteractions/`
4. Update `ChartInteractionsModifier` to handle the new interaction

### Adding a New Test

1. Add test function to `Tests/SwiftChartInteractionsTests/`
2. Use `@Test` attribute and `#expect()` assertions
3. Run: `swift test --filter testName`

---

## Notes

- This package targets iOS 18+ due to Swift Charts requirements
- All SwiftUI APIs used are from iOS 18+ (no availability checks needed)
- Use Swift 6.0+ features where appropriate
