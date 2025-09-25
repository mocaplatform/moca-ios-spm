// swift-tools-version: 5.9
import PackageDescription

let package = Package(
  name: "MocaSDK",
  platforms: [.iOS(.v11)],
  products: [
    .library(
      name: "MocaSDK",
      targets: ["MocaSDK"]
    ),
  ],
  targets: [
    .binaryTarget(
      name: "MocaSDK",
      url: "https://bin.mocaplatform.com/releases/moca-ios-sdk-3.12.0.xcframework.zip",
      checksum: "<<< paste checksum from script output >>>"
    )
  ]
)