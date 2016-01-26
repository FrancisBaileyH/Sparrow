/*
 * Author: fbailey
 * Date:   2016-01-25T12:59:25-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-25T12:59:25-08:00
*/

class PING: Command, Executable {


  func execute(clientId: String, managerInstance: ServerManagerInterface) {
    print("\(clientId)")

    if let client = managerInstance.getClientManager().getClient(clientId) {
      print("Called")
        self.respond(client)
    }
  }


  private func respond(client: ClientInterface) {

    let parameters = self.message.parameters

    if parameters.count == 1 {

      let message = ReplyCode.RPL_PONG.rawValue + " " + parameters[0]
      client.send("localhost", message: message)
    }
    else if parameters.count >= 2 {

      let message = ReplyCode.ERR_NOSUCHSERVER.rawValue + " PING " + parameters[0] + " " + parameters[1]
      client.send("localhost", message: message)
    }
    else if parameters.count < 1 {

      let message = ReplyCode.ERR_NEEDMOREPARAMS.rawValue + " PING"
      client.send("localhost", message: message)
    }
  }


}
