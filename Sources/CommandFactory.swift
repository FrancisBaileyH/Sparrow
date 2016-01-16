class CommandFactory {

  static let enabledCommands: [String: Command.Type] = [
    "NICK": NICK.self
  ]

  static func build(message: ClientMessage) -> Command? {

    if let commandType = enabledCommands[message.command] {
      let command = commandType.init(message: message)
      return command
    }

    return nil
  }

}
