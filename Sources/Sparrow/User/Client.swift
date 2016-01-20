class Client {

  private var id: String
  private var nick: String?
  private var realName: String?
  private var modes: Int?
  private var connection: ClientConnection
  private var fullyIdentified: Bool


  init(clientId id: String, connection: ClientConnection) {
    self.id = id
    self.connection = connection
    self.fullyIdentified = false
  }


  func sendWelcome() {
    if let nick = self.nick, let realname = self.realName {
      let message = nick
        + "!"
        + realname
        + "@localhost :Welcome to Test"
      self.connection.sendLine("localhost", replyCode: ReplyCode.RPL_WELCOME, message: message)
    }
  }


  func send(message: String) {
    // self.connection.sendLine(message)
  }


  func getNick() -> String? {
    return self.nick
  }


  func setNick(nick: String) {
    self.nick = nick
  }


  func setRealName(name: String) {
    self.realName = name
  }


  func getRealName() -> String? {
    return self.realName
  }


  func isFullyIdentified() -> Bool {
    return self.fullyIdentified
  }


  func identify() {
    self.fullyIdentified = true
  }


}
