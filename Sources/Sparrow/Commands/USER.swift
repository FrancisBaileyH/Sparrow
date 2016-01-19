class USER: Command, Executable {

  func execute(instance: ServerManager) -> ReplyCode? {
    print("\(self.message.parameters)")
    return nil
  }
}
