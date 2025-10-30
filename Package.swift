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
      url: "https://bin.mocaplatform.com/releases/moca-ios-sdk-3.12.0.xcframework.zip",
      checksum: "86d0b1abd3811f7ce79bcbb0b7b2e457ca6079a8f2ef762d0687143cacafead5"
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