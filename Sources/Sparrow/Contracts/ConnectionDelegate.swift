protocol ConnectionDelegate {

  func handleClientCommand(clientId: String, command: Executable)
  // optional func handleClientError()
}
