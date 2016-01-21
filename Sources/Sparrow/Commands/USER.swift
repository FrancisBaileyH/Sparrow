class USER: Command, Executable {

  func execute(clientId: String, managerInstance: ServerManager) -> ReplyCode? {

    if let client = managerInstance.getClientManager().getClient(clientId) {

      if !client.isRegistered() && client.getNick() != nil {
        client.setUserName(self.message.parameters[0])
        client.register()
        self.sendRegistrationAcknowledgement(client)
      }
    }

    return nil
  }


  /*
   * @TODO add error handling
   *
   * Send the "Welcome" reply to the client to acknowledge the
   * connection has been registered
  */
  func sendRegistrationAcknowledgement(client: Client) {

      let message = ":Welcome to Test"

      if let identifier = client.getFullyIdentifiedName() {
        client.send(identifier, replyCode: ReplyCode.RPL_WELCOME, message: message)
      }
  }
}
