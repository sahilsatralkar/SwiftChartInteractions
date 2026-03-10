public struct ChartInteractionsConfiguration {
    public let interactions: Set<ChartInteraction>

    public init(_ interactions: [ChartInteraction]) {
        self.interactions = Set(interactions)
    }
}
