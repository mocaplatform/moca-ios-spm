// swift-tools-version: 5.9
import PackageDescription

let package = Package(
  name: "MocaSDK",
  platforms: [.iOS(.v12)],
  products: [
    // Expose both: the binary and link dependencies
    .library(name: "MocaSDK", targets: ["MocaSDKSupport"]),
  ],
  targets: [
    .binaryTarget(
      name: "MocaSDK",
      url: "https://bin.mocaplatform.com/releases/moca-ios-sdk-3.12.2.xcframework.zip",
      checksum: "a68038daf81cbc7dbc44daa2751fba9768ca1ba6340a2b3cac60b84a18d73ad2"
    ),
    // Wrapper target that declares required dependencies
    .target(
      name: "MocaSDKSupport",
      dependencies: ["MocaSDK"],  
      path: "Sources/MocaSDKSupport",
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