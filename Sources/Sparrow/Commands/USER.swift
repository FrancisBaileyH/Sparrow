/*
 * Author: fbailey
 * Date:   2016-01-21T14:12:10-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:12:10-08:00
*/

class USER: Command, Executable {


  func execute(client: ClientInterface, managerInstance: ServerManagerInterface) {

    let config = managerInstance.getConfigManager().getConfig()

    if !client.isRegistered()
    && self.message.parameters.count >= 1 {

      client.setUserName(self.message.parameters[0])
      client.register()
      self.sendRegistrationAcknowledgement(client, config: config)
    }
  }


  /*
   * @TODO add error handling
   *
   * Send the "Welcome" reply to the client to acknowledge the
   * connection has been registered
  */
  func sendRegistrationAcknowledgement(client: ClientInterface, config: Config) {

    let identifier = client.getFullyIdentifiedName()
    let message = ReplyCode.RPL_WELCOME.rawValue + " " + identifier + " :" + config.welcomeMessage
    client.send(config.serverName, message: message)
  }

}
