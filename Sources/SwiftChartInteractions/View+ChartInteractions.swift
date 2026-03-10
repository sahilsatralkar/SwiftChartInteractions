import SwiftUI

public extension View {
    
    func chartInteractions(_ interactions: [ChartInteraction]) -> some View {
        modifier(
            ChartInteractionsModifier(
                configuration: ChartInteractionsConfiguration(interactions)
            )
        )
    }
}
