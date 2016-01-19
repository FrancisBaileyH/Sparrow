class ServerManager: ConnectionDelegate, Broadcastable {

  private var unidentifiedClients: [ClientConnection]
  private var clients: [String: Client]
  private var channels: [String: Channel]


  init() {
    self.unidentifiedClients = []
    self.channels = [:]
    self.clients = [:]
  }


  func addClient(client: ClientConnection) {
    self.unidentifiedClients.append((client))
  }


  func removeClient() {

  }


  /*
   * Remove a client from the unidentified list and
   * add them to the clients list
  */
  func identifyClient(client: Client, clientId: Int) {
    self.clients[client.getNick()] = client
    self.unidentifiedClients.removeAtIndex(clientId)
  }


  func handleClientCommand(command: Executable) {
    command.execute(self)
  }


  func handleClientError(code: ReplyCode) {

  }


  func broadcast(message: String, nicks: [String]) {

    for nick in nicks {
      if let client = self.clients[nick] {
        client.send(message)
      }
    }
  }


  func sendMessage(message: String, nick: String) {
    if let client = self.clients[nick] {
      client.send(message)
    }
  }


}
