// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Deskland",
    platforms: [.macOS(.v13)],
    products: [.executable(name: "Deskland", targets: ["Deskland"])],
    targets: [.executableTarget(name: "Deskland", path: "Sources/Deskland")]
)
