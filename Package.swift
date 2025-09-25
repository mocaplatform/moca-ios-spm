// moca-ios-sdk SPM package
//
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
      checksum: "3d66191ef85e5a8c80bdc5b29823736dc52c7df90673522c33df3568c79c9fb3"
    ),
    // Wrapper target that applies the same link requirements CocoaPods did
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

        // Match podspec OTHER_LDFLAGS
        .unsafeFlags(["-ObjC", "-all_load"], .when(platforms: [.iOS])),
      ]
    )
  ]
)