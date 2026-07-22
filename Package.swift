// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "llvm swift",
    targets: [.target(name: "LLVM", dependencies: ["LLVMC"]), .systemLibrary(name: "LLVMC", pkgConfig: "llvm")]
)
