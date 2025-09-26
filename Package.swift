// swift-tools-version: 5.9
import PackageDescription

let package = Package(
  name: "MocaSDK",
  platforms: [.iOS(.v12)],
  products: [
    .library(
      name: "MocaSDK",
      targets: ["MocaSDK"]
    ),
  ],
  targets: [
    .binaryTarget(
      name: "MocaSDKBinary",
      url: "https://bin.mocaplatform.com/releases/moca-ios-sdk-3.11.0.xcframework.zip",
      checksum: "a802d6655dcfbd851108bdbd320d65c30f8baae32b46b1f9f848f7adc427b9c8"
    ),
    // Wrapper target that declares required dependencies
    .target(
      name: "MocaSDK",
      dependencies: ["MocaSDKBinary"],
      linkerSettings: [
        // Frameworks (from podspec)
        .linkedFramework("SystemConfiguration"),
        .linkedFramework("MapKit"),
        .linkedFramework("CoreTelephony"),
        .linkedFramework("MobileCoreServices"), // deprecated, but safe to link; binary may still reference it
        .linkedFramework("CoreLocation"),
        .linkedFramework("UIKit"),
        .linkedFramework("AudioToolbox"),

        // Libraries
        .linkedLibrary("sqlite3"),
      ]
    )
  ]
)