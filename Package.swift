import PackageDescription

let package = Package(
  name: "Sparrow-Proto",
  dependencies: [
    .Package(url: "https://github.com/iachievedit/swiftysockets", majorVersion: 0)
  ]
)
