/*
 * Author: fbailey
 * Date:   2016-01-21T14:30:29-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:30:29-08:00
*/

class ServerManager: ConnectionDelegate {

  private var clientManager: ClientManager
  private var channels: [String: Channel]


  init() {
    self.clientManager = ClientManager()
    self.channels = [:]
  }


  /*
   * @TODO remove hard coded localhost value, once we
   * are able to do host identification
  */
  func addConnection(connection: ClientConnection) {
    self.clientManager.createClient(connection, handler: self)
  }


  /*
   * @TODO, may need to make this function thread-safe as commands are potentially
   * modifying data at the same time
  */
  func handleCommand(clientId: String, command: Executable) {
    command.execute(clientId, managerInstance: self)
  }


  func handleError(clientId: String, error: ErrorType) {
    self.clientManager.removeClient(clientId)
  }


}


extension ServerManager {

  func getClientManager() -> ClientManager {
    return self.clientManager
  }
}
