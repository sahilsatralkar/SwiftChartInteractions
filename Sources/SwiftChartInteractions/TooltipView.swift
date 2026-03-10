import SwiftUI

struct TooltipView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.caption)
            .padding(6)
            .background(.ultraThinMaterial)
            .cornerRadius(6)
    }
}
