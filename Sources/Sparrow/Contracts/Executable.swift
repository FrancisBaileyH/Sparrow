protocol Executable: Cancellable {

  init(message: ClientMessage)
  func execute(clientId: String, managerInstance: ServerManager) -> ReplyCode?
}
