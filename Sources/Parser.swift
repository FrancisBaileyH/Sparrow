import Foundation


struct Message {
  let commandPrefix: String?
  let command: String
  let parameters: [String]
}


class Parser {

  /*
   * @TODO add error checking
  */
  func parse(message: String) -> Message? {

    let components = message.characters.split(" ").map(String.init)

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

      return Message(commandPrefix: commandPrefix, command: command, parameters: parameters)
    }
    else {
      return nil
    }
  }

}
