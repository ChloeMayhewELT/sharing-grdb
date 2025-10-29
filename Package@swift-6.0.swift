// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "sqlite-data",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v7),
  ],
  products: [
  ],
  dependencies: [
//    .package(url: "https://github.com/apple/swift-collections", from: "1.0.0"),
//    .package(url: "https://github.com/pointfreeco/swift-concurrency-extras", from: "1.0.0"),
//    .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "1.3.3"),
//    .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.9.0"),
//    .package(url: "https://github.com/pointfreeco/swift-sharing", from: "2.3.0"),
//    .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.18.4"),
//    .package(url: "https://github.com/pointfreeco/swift-structured-queries", from: "0.24.0"),
//    .package(url: "https://github.com/pointfreeco/xctest-dynamic-overlay", from: "1.5.0"),
  ],
  targets: [
    .binaryTarget(
      name: "GRDB",
      path: "./Sources/GRDB.xcframework"
    )
  ],
  swiftLanguageModes: [.v6]
)

let swiftSettings: [SwiftSetting] = [
  .enableUpcomingFeature("MemberImportVisibility")
]

for index in package.targets.indices {
  package.targets[index].swiftSettings = swiftSettings
}

#if !os(Windows)
  // Add the documentation compiler plugin if possible
  package.dependencies.append(
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
  )
#endif
