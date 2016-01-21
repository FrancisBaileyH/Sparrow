class USER: Command, Executable {

  func execute(clientId: String, managerInstance: ServerManager) -> ReplyCode? {

    if let client = managerInstance.getClient(clientId) {

      if !client.isFullyIdentified() {
        client.setUserName(self.message.parameters[0])
        client.identify()
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

    if let identifier = client.getFullyIdentifiedName() {
      let message = identifier + " :Welcome to Test"
      let serverMessage = ServerMessageFactory.build(ReplyCode.RPL_WELCOME, message: message)

      client.send(serverMessage)
    }
    else {
      // something wrong has happened
    }
  }
}
