import SwiftUI

struct CrosshairOverlay: View {
    let x: CGFloat
    let height: CGFloat
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: x, y: 0))
            path.addLine(to: CGPoint(x: x, y: height))
        }
        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
    }
}
