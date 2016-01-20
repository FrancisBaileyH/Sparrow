class CommandFactory {

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
