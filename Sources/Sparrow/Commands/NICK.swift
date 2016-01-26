/*
 * Author: fbailey
 * Date:   2016-01-21T14:29:21-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:29:21-08:00
*/

class NICK: Command, Executable {


  func execute(clientId: String, managerInstance: ServerManagerInterface) {

    let client = managerInstance.getClientManager().getClient(clientId)

    if self.message.parameters.count == 1  {

      let nick = self.message.parameters[0]

       if let error = self.validateNick(nick){
        //  let message = 
       }
       else {
         client?.setNick(nick)
       }
    }
  }


  private func respond(client: ClientInterface) {

  }


 /*
  * @TODO add in actual validation
  *
  * nickname: ( letter / special ) *8( letter / digit / special / "-" )
 */
  private func validateNick(nick: String) -> ReplyCode? {

    if nick.characters.count > 9 {
      return ReplyCode.ERR_ERRONEOUSNICKNAME
    }

    return nil
  }

}
