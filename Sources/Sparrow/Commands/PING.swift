/*
 * Author: fbailey
 * Date:   2016-01-25T12:59:25-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-25T12:59:25-08:00
*/

class PING: Command, Executable {


  func execute(client: ClientInterface, managerInstance: ServerManagerInterface) {

    let serverName = managerInstance.getConfigManager().getConfig().serverName
    self.handlePing(client, serverName: serverName)
  }


  private func handlePing(client: ClientInterface, serverName: String) {

    let parameters = self.message.parameters
    var message: String = ""

    if parameters.count == 1 {

      message = ReplyCode.RPL_PONG.rawValue + " " + parameters[0]
    }
    else if parameters.count < 1 {

      message = ReplyCode.ERR_NEEDMOREPARAMS.rawValue + " PING"
    }
    else {

      message = ReplyCode.ERR_NOSUCHSERVER.rawValue + " PING " + parameters[0] + " " + parameters[1]
    }

    client.send(serverName, message: message)
  }


}
