import SwiftUI

struct HighlightOverlay: View {
    let location: CGPoint
    
    var body: some View {
        Circle()
            .frame(width: 10, height: 10)
            .position(location)
    }
}
