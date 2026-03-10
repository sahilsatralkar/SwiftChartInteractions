import SwiftUI
import Charts

struct DataPoint: Identifiable {
    let id = UUID()
    let year: Int
    let value: Double
}

let sampleData: [DataPoint] = [
    .init(year: 2020, value: 30),
    .init(year: 2021, value: 45),
    .init(year: 2022, value: 60),
    .init(year: 2023, value: 55),
    .init(year: 2024, value: 80),
    .init(year: 2025, value: 95)
]

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 32) {
                    VStack(alignment: .leading) {
                        Text("Line Chart")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        Chart(sampleData) { point in
                            LineMark(
                                x: .value("Year", point.year),
                                y: .value("Value", point.value)
                            )
                            .foregroundStyle(.blue)
                        }
                        .frame(height: 200)
                        .chartInteractions([.tapHighlight, .crosshair, .tooltip])
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(radius: 2)
                    
                    VStack(alignment: .leading) {
                        Text("Bar Chart")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        Chart(sampleData) { point in
                            BarMark(
                                x: .value("Year", point.year),
                                y: .value("Value", point.value)
                            )
                            .foregroundStyle(.green)
                        }
                        .frame(height: 200)
                        .chartInteractions([.tapHighlight, .crosshair])
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(radius: 2)
                    
                    VStack(alignment: .leading) {
                        Text("Range Selection")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        Chart(sampleData) { point in
                            LineMark(
                                x: .value("Year", point.year),
                                y: .value("Value", point.value)
                            )
                            .foregroundStyle(.orange)
                        }
                        .frame(height: 200)
                        .chartInteractions([.rangeSelection])
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(radius: 2)
                }
                .padding()
            }
            .navigationTitle("SwiftChartInteractions")
        }
    }
}

#Preview {
    ContentView()
}
