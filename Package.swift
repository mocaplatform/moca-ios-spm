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
      url: "https://bin.mocaplatform.com/releases/moca-ios-sdk-3.12.1.xcframework.zip",
      checksum: "8026dd069de3a6aef62d32c0354cae8edbf1e1e6f831d05f299e048fee0c8b1a"
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