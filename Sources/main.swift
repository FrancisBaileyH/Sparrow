

let server = Server(10022, logger: MockLogger())
server.listen()


class MockLogger: Logger {

  func log(message: String, logLevel: LogLevel) {

  }
}
