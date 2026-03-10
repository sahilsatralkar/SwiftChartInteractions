import SwiftUI

public struct ChartInteractionsModifier: ViewModifier {
    
    let configuration: ChartInteractionsConfiguration
    @StateObject private var state = ChartInteractionState()
    @State private var scale: CGFloat = 1.0
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        state.selectedLocation = value.location
                        if state.dragStart == nil {
                            state.dragStart = value.location
                        }
                        state.dragEnd = value.location
                    }
                    .onEnded { _ in
                        state.dragStart = nil
                        state.dragEnd = nil
                    }
            )
            .gesture(
                configuration.interactions.contains(.zoom) ?
                MagnificationGesture()
                    .onChanged { value in
                        scale = value
                    }
                    .onEnded { value in
                        withAnimation {
                            scale = 1.0
                        }
                    }
                : nil
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
                    
                    if configuration.interactions.contains(.rangeSelection),
                       let start = state.dragStart,
                       let end = state.dragEnd {
                        RangeSelectionOverlay(start: start, end: end)
                    }
                }
            }
    }
}
