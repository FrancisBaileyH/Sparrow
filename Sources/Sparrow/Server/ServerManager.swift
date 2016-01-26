/*
 * Author: fbailey
 * Date:   2016-01-21T14:30:29-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:30:29-08:00
*/

class ServerManager: ConnectionDelegate {

  private var clientManager: ClientManagerInterface
  private var channelManager: ChannelManagerInterface


  init() {
    self.clientManager = ClientManager()
    self.channelManager = ChannelManager()
  }


  func addConnection(connection: ConnectionInterface) {
    self.clientManager.createClient(connection, handler: self)
  }


  /*
   * @TODO, may need to make this function thread-safe as commands are potentially
   * modifying data at the same time
   *
   * @TODO, handle permissions, is user registered? is user op? etc
  */
  func handleCommand(clientId: String, command: Executable) {
    command.execute(clientId, managerInstance: self)
  }


  func handleError(clientId: String, error: ErrorType) {
    // self.clientManager.removeClient(clientId)
  }

}


extension ServerManager: ServerManagerInterface {

  func getClientManager() -> ClientManagerInterface {
    return self.clientManager
  }

  func getChannelManager() -> ChannelManagerInterface {
    return self.channelManager
  }
}
