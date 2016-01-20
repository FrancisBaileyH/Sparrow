class USER: Command, Executable {

  func execute(clientId: String, managerInstance: ServerManager) -> ReplyCode? {

    if let client = managerInstance.getClient(clientId) {

      if !client.isFullyIdentified() {
        client.setRealName(self.message.parameters[0])
        client.identify()
        client.sendWelcome()
      }

    }

    return nil
  }
}
