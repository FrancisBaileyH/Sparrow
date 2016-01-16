


class ServerManager: ConnectionDelegate {

  private var clients: [ClientConnection]
  private var channels: [Channel]


  init() {
    self.channels = []
    self.clients = []
  }


  func addClient(client: ClientConnection) {

    self.clients.append(client)
  }


  func removeClient() {

  }


  func handleClientCommand(command: Command) {

  }


  func handleClientError(code: ErrorCode) {

  }


}
