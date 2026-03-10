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
            .overlay {
                if configuration.interactions.contains(.tapHighlight),
                   let location = state.selectedLocation {
                    HighlightOverlay(location: location)
                }
            }
    }
}
