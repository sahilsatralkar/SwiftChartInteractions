# SwiftChartInteractions

A Swift Package that adds interaction capabilities (tap highlight, crosshair, tooltip, range selection, zoom) to Swift Charts using simple SwiftUI modifiers.

## Installation

Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/SwiftChartInteractions.git", from: "0.1.0")
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

## Features

- Tap Highlight
- Crosshair
- Tooltip
- Range Selection
- Zoom

## License

MIT
