

class MockLogger: Logger {

  func log(message: String, logLevel: LogLevel) {

  }
}


let server = Server(port: 10022, logger: MockLogger())
server?.listen()
