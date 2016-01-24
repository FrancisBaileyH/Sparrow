/*
 * Author: fbailey
 * Date:   2016-01-21T14:29:55-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:29:55-08:00
*/

protocol ConnectionDelegate {

  func handleCommand(clientId: String, command: Executable)
  func handleError(clientId: String, error: ErrorType)
}
