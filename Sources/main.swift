

class MockLogger: Logger {

  func log(message: String, logLevel: LogLevel) {

  }
}


let server = IRCServer(port: 10022, logger: MockLogger())
server?.listen()
