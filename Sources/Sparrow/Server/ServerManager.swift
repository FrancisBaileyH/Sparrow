/*
 * Author: fbailey
 * Date:   2016-01-21T14:30:29-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:30:29-08:00
*/

class ServerManager: ConnectionDelegate {

  private var clientManager: ClientManagerInterface
  private var channelManager: ChannelManagerInterface
  private var configManager: ConfigManagerInterface


  init(config: ConfigManagerInterface) {
    self.configManager = config
    self.clientManager = ClientManager()
    self.channelManager = ChannelManager(channels: self.configManager.getConfig().channels)
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
  func handleCommand(client: ClientInterface, command: Executable) {

    if !command.isCancelled() {
      command.execute(client, managerInstance: self)
    }
  }


  func handleError(client: ClientInterface, error: ErrorType) {
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

  func getConfigManager() -> ConfigManagerInterface {
    return self.configManager
  }
}
