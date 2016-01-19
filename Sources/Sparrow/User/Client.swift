struct Client {

  private var id: Int
  private var nick: String
  private var realname: String?
  private var modes: Int?
  private var connection: ClientConnection
  private var fullyIdentified: Bool


  init(clientId id: Int, nick: String, connection: ClientConnection) {
    self.id = id
    self.nick = nick
    self.connection = connection
    self.fullyIdentified = false
  }


  func sendWelcome() {
     let message = String(ReplyCode.RPL_WELCOME.rawValue) + self.nick
     self.connection.sendLine(message)
  }


  func send(message: String) {
    self.connection.sendLine(message)
  }


  func getNick() -> String {
    return self.nick
  }


  func setUser() {

  }


}
