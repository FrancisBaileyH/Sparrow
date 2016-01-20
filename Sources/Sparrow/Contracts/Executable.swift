protocol Executable {
  init(message: ClientMessage)
  func execute(clientId: String, managerInstance: ServerManager) -> ReplyCode?
  // func cancel()
}
