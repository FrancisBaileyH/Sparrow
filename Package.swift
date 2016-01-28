import PackageDescription

let package = Package(
  name: "Sparrow-Proto",
  dependencies: [
    .Package(url: "https://github.com/iachievedit/swiftysockets", majorVersion: 0),
    .Package(url: "https://github.com/Zewo/JSON", majorVersion: 0)
  ]
)
