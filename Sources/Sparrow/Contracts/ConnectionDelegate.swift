protocol ConnectionDelegate {

  func handleClientCommand(command: Command)
  // optional func handleClientError()
}
