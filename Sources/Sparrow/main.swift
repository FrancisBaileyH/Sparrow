
/*
 * @TODO really need to find a logging library and implement,
 * no need to have this mock logger anymore
*/
class MockLogger: Logger {

  func log(message: String, logLevel: LogLevel) {

  }
}


let server = Server(port: 10022, logger: MockLogger())
server?.listen()
