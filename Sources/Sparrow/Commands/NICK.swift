class NICK: Command, Executable {

  func execute(instance: ServerManager) -> ReplyCode? {
    print("Called")
    print("\(self.message.parameters)")
    return nil
  }

}
