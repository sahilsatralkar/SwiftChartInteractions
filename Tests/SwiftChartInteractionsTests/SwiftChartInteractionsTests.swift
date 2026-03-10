import Testing
@testable import SwiftChartInteractions

@Test func configurationInit() {
    let config = ChartInteractionsConfiguration([.tapHighlight, .crosshair])
    #expect(config.interactions.contains(.tapHighlight))
    #expect(config.interactions.contains(.crosshair))
    #expect(!config.interactions.contains(.tooltip))
}

@Test func interactionEnumHashable() {
    let interaction1: ChartInteraction = .tapHighlight
    let interaction2: ChartInteraction = .tapHighlight
    #expect(interaction1 == interaction2)
}

@Test func multipleInteractions() {
    let interactions: [ChartInteraction] = [.tapHighlight, .crosshair, .tooltip, .rangeSelection, .zoom]
    let config = ChartInteractionsConfiguration(interactions)
    #expect(config.interactions.count == 5)
}
