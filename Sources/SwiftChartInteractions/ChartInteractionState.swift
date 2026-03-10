import SwiftUI
import Combine

final class ChartInteractionState: ObservableObject {
    
    @Published var selectedLocation: CGPoint?
    @Published var dragStart: CGPoint?
    @Published var dragEnd: CGPoint?
    
}
