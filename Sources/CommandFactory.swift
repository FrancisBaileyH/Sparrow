class CommandFactory {

  let enabledCommands: [String: Command] = [

  ]

  static func build(message: Message) -> Command? {

    if let strCommand = enabledCommands[message.command] {
      let command = strCommand.init()
      return command
    }

    return nil
  }

}
