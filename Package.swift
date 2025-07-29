// swift-tools-version:6.2
import PackageDescription

let packageName = "habi"

let package = Package(
  name: packageName,
  platforms: [
    .iOS(.v16),
    .macOS(.v26),
  ],
  products: [
    .library(name: packageName, targets: [packageName])
  ],
  targets: [
    .target(name: packageName, path: packageName)
  ]
)
