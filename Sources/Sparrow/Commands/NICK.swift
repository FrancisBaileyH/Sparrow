/*
 * Author: fbailey
 * Date:   2016-01-21T14:29:21-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:29:21-08:00
*/

class NICK: Command, Executable {


  func execute(clientId: String, managerInstance: ServerManagerInterface) {

    let config        = managerInstance.getConfigManager().getConfig()
    let clientManager = managerInstance.getClientManager()
    let client        = clientManager.getClient(clientId)

    if self.message.parameters.count >= 1  {

      let nick = self.message.parameters[0]

      if let error = self.validateNick(nick, clientManager: clientManager) {
        let message = error.rawValue
        client?.send(config.serverName, message: message)
      }
      else {

        if let cli = client where cli.isRegistered() {
          let channelManager = managerInstance.getChannelManager()
          let oldNick = cli.getNick()
          self.notifyNickChange(oldNick!, newNick: nick, channelManager: channelManager)
        }
        else {
          client?.setNick(nick)
        }
      }
    }
  }


  /*
   * Notify every user that client is visible to that their nick has changed
  */
  private func notifyNickChange(oldNick: String, newNick: String, channelManager: ChannelManagerInterface) {
    //
    // for channel in channelManager.findChannelsForNick(nick) {
    //   channel.broadcast(oldNick:
    // }

  }


 /*
  * @TODO add in actual validation
  *
  * nickname: ( letter / special ) *8( letter / digit / special / "-" )
 */
  private func validateNick(nick: String, clientManager: ClientManagerInterface) -> ReplyCode? {

    if nick.characters.count > 9 {
      return ReplyCode.ERR_ERRONEOUSNICKNAME
    }
    else if clientManager.clientNickExists(nick) {
      return ReplyCode.ERR_NICKNAMEINUSE
    }

    return nil
  }

}
