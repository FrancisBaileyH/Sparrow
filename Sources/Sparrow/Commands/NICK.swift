class NICK: Command, Executable {

  func execute(clientId: String, managerInstance: ServerManager) -> ReplyCode? {

    let client = managerInstance.getClient(clientId)

    if self.message.parameters.count == 1  {

      let nick = self.message.parameters[0]

      if self.validateNick(nick) {
          client?.setNick(nick)
      }
    }

    return nil
  }

 /*
  * @TODO add in actual validation
 */
  func validateNick(nick: String) -> Bool {
    return true
  }

}
