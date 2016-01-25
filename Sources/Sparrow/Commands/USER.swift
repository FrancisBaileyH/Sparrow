/*
 * Author: fbailey
 * Date:   2016-01-21T14:12:10-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:12:10-08:00
*/

class USER: Command, Executable {

  func execute(clientId: String, managerInstance: ServerManager) {

    if let client = managerInstance.getClientManager().getClient(clientId) {

      if !client.isRegistered() && client.getNick() != nil {
        client.setUserName(self.message.parameters[0])
        client.register()
        self.sendRegistrationAcknowledgement(client)
      }
    }

  }


  /*
   * @TODO add error handling
   *
   * Send the "Welcome" reply to the client to acknowledge the
   * connection has been registered
  */
  func sendRegistrationAcknowledgement(client: ClientInterface) {

      let message = ":Welcome to Test"

      if let identifier = client.getFullyIdentifiedName() {
        client.send(identifier, replyCode: ReplyCode.RPL_WELCOME, message: message)
      }
  }
}
