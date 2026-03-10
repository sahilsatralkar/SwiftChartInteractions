import SwiftUI

public struct ChartInteractionsModifier: ViewModifier {
    
    let configuration: ChartInteractionsConfiguration
    @StateObject private var state = ChartInteractionState()
    
    public func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture()
                    .onChanged { value in
                        state.selectedLocation = value.location
                    }
            )
            .background {
                GeometryReader { geometry in
                    if configuration.interactions.contains(.crosshair),
                       let location = state.selectedLocation {
                        CrosshairOverlay(x: location.x, height: geometry.size.height)
                    }
                }
            }
            .overlay {
                GeometryReader { geometry in
                    if configuration.interactions.contains(.tapHighlight),
                       let location = state.selectedLocation {
                        HighlightOverlay(location: location)
                    }
                    
                    if configuration.interactions.contains(.tooltip),
                       let location = state.selectedLocation {
                        TooltipView(text: "X: \(Int(location.x)), Y: \(Int(location.y))")
                            .position(x: min(max(location.x, 50), geometry.size.width - 50),
                                     y: max(location.y - 40, 30))
                    }
                }
            }
    }
}
