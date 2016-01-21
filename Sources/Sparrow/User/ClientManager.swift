/*
 * Author: fbailey
 * Date:   2016-01-21T13:50:48-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T13:50:48-08:00
*/


class ClientManager {

  /*
   * Clients are indexed by their client id
  */
  private var clients: [String: Client]


  init() {
    self.clients = [:]
  }


  /*
   * @TODO remove hard coded localhost value, once we
   * are able to do host identification
  */
  func createClient(connection: ClientConnection, handler: ConnectionDelegate) {

    let clientId = self.createClientId()
    let client   = Client(clientId: clientId, hostName: "localhost", connection: connection, handler: handler)
    client.startReceiving()

    self.clients[clientId] = client
  }


  /*
   * Remove a client from the client list
  */
  func removeClient(clientId: String) {

    self.clients.removeValueForKey(clientId)
  }


  /*
   * Retreive a client
  */
  func getClient(clientId: String) -> Client? {

    if let client = self.clients[clientId] {
      return client
    }

    return nil
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


}
