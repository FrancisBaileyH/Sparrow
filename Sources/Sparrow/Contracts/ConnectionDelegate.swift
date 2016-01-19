protocol ConnectionDelegate {

  func handleClientCommand(command: Executable)
  // optional func handleClientError()
}
