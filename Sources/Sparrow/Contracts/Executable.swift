/*
 * Author: fbailey
 * Date:   2016-01-21T14:30:00-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:30:00-08:00
*/

protocol Executable: Cancellable {

  init(message: ClientMessage)
  func execute(client: ClientInterface, managerInstance: ServerManagerInterface)
}
