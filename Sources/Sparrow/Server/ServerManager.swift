class ServerManager: ConnectionDelegate, Broadcastable {

  private var clients: [String: Client]
  private var channels: [String: Channel]


  init() {
    self.channels = [:]
    self.clients = [:]
  }


  func addClient(connection: ClientConnection) {
    let clientId = connection.getId()
    let client = Client(clientId: clientId, connection: connection)
    self.clients[clientId] = client
  }


  func removeClient() {

  }


  func getClient(clientId: String) -> Client? {

    if let client = self.clients[clientId] {
      return client
    }

    return nil
  }


  func handleClientCommand(clientId: String, command: Executable) {
    command.execute(clientId, managerInstance: self)
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


  /*
   * Generate a unique client id to associate with
   * each connection/client
  */
  func createClientId() -> String {

    let clientId = Random.randomString(12)

    guard let _ = self.clients[clientId] else {
      return clientId
    }

    return self.createClientId()
  }


  func sendMessage(message: String, nick: String) {
    if let client = self.clients[nick] {
      client.send(message)
    }
  }


}
