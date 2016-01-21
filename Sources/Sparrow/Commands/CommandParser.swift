import Foundation


struct ClientMessage {
  let commandPrefix: String?
  let command: String
  let parameters: [String]
}


class CommandParser {

  /*
   * @TODO add error checking/more resiliant parsing
  */
  static func parse(message: String) -> ClientMessage? {

    var cleanedMessage = message
    cleanedMessage.removeRange(message.endIndex.advancedBy(-1)..<message.endIndex)
    let components = cleanedMessage.characters.split(" ").map(String.init)

    if components.count >= 2 {

      var commandPrefix: String?
      var command: String = ""
      var parameterIndex = 1
      var parameters: [String] = []

      if components[0].hasPrefix(":") {
        commandPrefix = components[0]
        command = components[1]
        parameterIndex = 2
      }
      else {
        command = components[0]
      }

      for i in parameterIndex...components.count - 1 {
        parameters.append(components[i])
      }

      return ClientMessage(commandPrefix: commandPrefix, command: command, parameters: parameters)
    }
    else {
      return nil
    }
  }

}
