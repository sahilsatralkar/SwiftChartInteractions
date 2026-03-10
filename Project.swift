import ProjectDescription

let project = Project(
    name: "SwiftChartInteractions",
    targets: [
        .target(
            name: "DemoApp",
            destinations: .iOS,
            platform: "iOS",
            product: .app,
            deploymentTarget: "iOS 18",
            sources: "Examples/DemoApp",
            dependencies: [
                .package(path: ".", product: "SwiftChartInteractions")
            ]
        ),
        .target(
            name: "SwiftChartInteractions",
            destinations: .iOS,
            platform: "iOS",
            product: .framework,
            deploymentTarget: "iOS 18",
            sources: "Sources/SwiftChartInteractions"
        ),
        .target(
            name: "SwiftChartInteractionsTests",
            destinations: .iOS,
            platform: "iOS",
            product: .unitTests,
            deploymentTarget: "iOS 18",
            sources: "Tests/SwiftChartInteractionsTests",
            dependencies: [
                .target(name: "SwiftChartInteractions")
            ]
        )
    ]
)
