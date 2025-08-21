// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MusicaPalHector",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "MusicaPalHector",
            targets: ["MusicaPalHector"]),
    ],
    dependencies: [
        .package(url: "https://github.com/lottie-ios/lottie-ios.git", from: "4.3.0"),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.18.0"),
        .package(url: "https://github.com/dmrschmidt/DSWaveformImage", from: "13.0.0")
    ],
    targets: [
        .target(
            name: "MusicaPalHector",
            dependencies: [
                .product(name: "Lottie", package: "lottie-ios"),
                "SDWebImage",
                "DSWaveformImage"
            ]),
    ]
)