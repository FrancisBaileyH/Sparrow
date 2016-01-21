class NICK: Command, Executable {

  func execute(clientId: String, managerInstance: ServerManager) -> ReplyCode? {

    let client = managerInstance.getClientManager().getClient(clientId)

    if self.message.parameters.count == 1  {

      let nick = self.message.parameters[0]

       if let error = self.validateNick(nick){
         return error
       }
       else {
         client?.setNick(nick)
       }
    }

    return nil
  }

 /*
  * @TODO add in actual validation
  *
  * nickname: ( letter / special ) *8( letter / digit / special / "-" )
 */
  func validateNick(nick: String) -> ReplyCode? {

    if nick.characters.count > 9 {
      return ReplyCode.ERR_ERRONEOUSNICKNAME
    }

    return nil
  }

}
