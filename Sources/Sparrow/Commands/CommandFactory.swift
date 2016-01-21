/*
 * Author: fbailey
 * Date:   2016-01-21T14:29:11-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:29:11-08:00
*/

class CommandFactory {

  /*
   * @TODO this should eventually be moved into a Config object or somewhere in
   * in the Server object
  */
  static let enabledCommands: [String: Executable.Type] = [
    "NICK": NICK.self,
    "USER": USER.self
  ]

  static func build(message: ClientMessage) -> Executable? {

    if let commandType = enabledCommands[message.command] {
      let command = commandType.init(message: message)
      return command
    }

    return nil
  }

}
