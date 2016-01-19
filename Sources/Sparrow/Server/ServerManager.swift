class ServerManager: ConnectionDelegate, Broadcastable {

  private var unidentifiedClients: [ClientConnection]
  private var clients: [Client]
  private var channels: [String: Channel]


  init() {
    self.unidentifiedClients = []
    self.channels = [:]
    self.clients = []
  }


  func addClient(client: ClientConnection) {
    self.unidentifiedClients.append((client))
  }


  func removeClient() {

  }


  func handleClientCommand(command: Executable) {
    command.execute(self)
  }


  func handleClientError(code: ReplyCode) {

  }


  func broadcast(message: String, clientIds: [Int]) {

    for id in clientIds {
      if self.clients.indices.contains(id) {
        let client = self.clients[id]
        client.send(message)
      }
    }
  }


  func sendMessage(message: String, clientId: Int) {
    if self.clients.indices.contains(clientId) {
      let client = self.clients[clientId]
      client.send(message)
    }
  }


}
