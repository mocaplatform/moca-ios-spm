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
      url: "https://bin.mocaplatform.com/releases/moca-ios-sdk-3.11.1.xcframework.zip",
      checksum: "c18f86f484acfc2d7743906478b485c56642404f4aeed872412fb9b8ad79a115"
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