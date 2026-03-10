import SwiftUI

struct RangeSelectionOverlay: View {
    let start: CGPoint
    let end: CGPoint
    
    var body: some View {
        let minX = min(start.x, end.x)
        let width = abs(end.x - start.x)
        
        Rectangle()
            .fill(Color.blue.opacity(0.2))
            .frame(width: width)
            .position(x: minX + width / 2, y: (start.y + end.y) / 2)
    }
}
