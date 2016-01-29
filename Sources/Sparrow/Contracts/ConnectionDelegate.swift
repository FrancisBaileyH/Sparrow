/*
 * Author: fbailey
 * Date:   2016-01-21T14:29:55-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:29:55-08:00
*/

protocol ConnectionDelegate {

  func handleCommand(client: ClientInterface, command: Executable)
  func handleError(client: ClientInterface, error: ErrorType)
}
