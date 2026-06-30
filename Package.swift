// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "llvm swift",
    products: [.library(name: "LLVM", targets: ["LLVM"])],
    targets: [.target(name: "LLVM"), .systemLibrary(name: "LLVMC", pkgConfig: "llvm")]
)
