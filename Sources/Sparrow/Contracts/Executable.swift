protocol Executable {
  init(message: ClientMessage)
  func execute(instance: ServerManager) -> ReplyCode?
}
