class ServerManager: ConnectionDelegate, Broadcastable {

  private var clients: [String: Client]
  private var channels: [String: Channel]


  init() {
    self.channels = [:]
    self.clients = [:]
  }


  /*
   * @TODO remove hard coded localhost value, once we
   * are able to do host identification
  */
  func addClient(connection: ClientConnection) {
    let clientId = connection.getId()
    let client = Client(clientId: clientId, hostName: "localhost", connection: connection)
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


  /*
   * @TODO, may need to make this function thread-safe as commands are potentially
   * modifying data at the same time
  */
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
   * @TODO, really need to consider how to access Client via Nick Handle,
   * it could be computationally expensive to search every user for given
   * nick handle. If indexed by nick we'll have O(1) search time
   *
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

  // @TODO remove, should be done at command level, only broadcast should remain
  func sendMessage(message: String, nick: String) {
    if let client = self.clients[nick] {
      client.send(message)
    }
  }


}
