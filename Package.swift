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
      url: "https://bin.mocaplatform.com/releases/moca-ios-sdk-3.12.3.xcframework.zip",
      checksum: "9a37b76905be6d1c1e2425daf26274a3492195f53753297f55214b8a2219f0c3"
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