/*
 * Author: fbailey
 * Date:   2016-01-21T14:31:02-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:31:02-08:00
*/

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
