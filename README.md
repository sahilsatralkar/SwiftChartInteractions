# SwiftChartInteractions

A lightweight Swift Package that adds powerful interaction capabilities to Apple's Swift Charts framework using simple SwiftUI modifiers.

## Features

- **Tap Highlight** - Circle overlay at touch location
- **Crosshair** - Vertical line following finger/cursor
- **Tooltip** - Display values near selected point
- **Range Selection** - Drag to select a range on the chart
- **Zoom** - Pinch to zoom interaction

## Requirements

- iOS 18.0+
- Swift 6.0+
- Swift Charts (included in iOS 18)

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/sahilsatralkar/SwiftChartInteractions.git", from: "0.1")
]
```

## Usage

```swift
import SwiftChartInteractions
import SwiftUI
import Charts

struct MyChartView: View {
    var body: some View {
        Chart(data) {
            LineMark(
                x: .value("Year", $0.year),
                y: .value("Value", $0.value)
            )
        }
        .chartInteractions([
            .tapHighlight,
            .crosshair,
            .tooltip
        ])
    }
}
```

### Available Interactions

| Interaction | Description |
|-------------|-------------|
| `.tapHighlight` | Shows a circle at the touch location |
| `.crosshair` | Displays a vertical line following the touch |
| `.tooltip` | Shows a tooltip with coordinates near the touch |
| `.rangeSelection` | Allows dragging to select a range |
| `.zoom` | Enables pinch-to-zoom gesture |

### Combining Interactions

```swift
// All interactions enabled
.chartInteractions([.tapHighlight, .crosshair, .tooltip, .rangeSelection, .zoom])

// Just crosshair and tooltip
.chartInteractions([.crosshair, .tooltip])
```

## Examples

The package includes a demo app in `Examples/DemoApp/` showcasing:

- Line chart with tap highlight, crosshair, and tooltip
- Bar chart with tap highlight and crosshair
- Chart with range selection

## License

MIT
