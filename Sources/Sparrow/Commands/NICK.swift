class NICK: Command, Executable {

  func execute(instance: ServerManager) -> ReplyCode? {
    print("Called")
    return nil
  }

}
