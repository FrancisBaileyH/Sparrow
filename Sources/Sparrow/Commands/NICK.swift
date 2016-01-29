/*
 * Author: fbailey
 * Date:   2016-01-21T14:29:21-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:29:21-08:00
*/

class NICK: Command, Executable {


  func execute(client: ClientInterface, managerInstance: ServerManagerInterface) {

    let config        = managerInstance.getConfigManager().getConfig()
    let clientManager = managerInstance.getClientManager()


    if let error = self.validateNick(self.message.parameters, clientManager: clientManager) {
      let message = error.rawValue
      client.send(config.serverName, message: message)

      return
    }

    let nick = self.message.parameters[0]
    client.setNick(nick)

    if client.isRegistered() {
      let channelManager = managerInstance.getChannelManager()
      let oldNick = client.getNick()
      self.notifyNickChange(oldNick, newNick: nick, channelManager: channelManager)
    }

  }


  /*
   * Notify every user that client is visible to that their nick has changed
  */
  private func notifyNickChange(oldNick: String, newNick: String, channelManager: ChannelManagerInterface) {

    for channel in channelManager.findChannelsForNick(oldNick) {
      //  channel.broadcast(oldNick:
    }

  }


  /*
   * @TODO add in actual validation
   *
   * nickname: ( letter / special ) *8( letter / digit / special / "-" )
  */
  private func validateNick(parameters: [String], clientManager: ClientManagerInterface) -> ReplyCode? {

    guard parameters.count >= 1 else {
      return ReplyCode.ERR_NEEDMOREPARAMS
    }

    let nick = parameters[0]

    if nick.characters.count > 9 {
      return ReplyCode.ERR_ERRONEOUSNICKNAME
    }
    else if clientManager.clientNickExists(nick) {
      return ReplyCode.ERR_NICKNAMEINUSE
    }

    return nil
  }

}
