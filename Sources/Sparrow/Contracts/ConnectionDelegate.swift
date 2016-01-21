protocol ConnectionDelegate {

  func handleCommand(clientId: String, command: Executable)
  func handleError(clientId: String, error: ErrorType)
}
