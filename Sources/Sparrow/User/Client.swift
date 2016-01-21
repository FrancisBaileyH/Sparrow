class Client {

  private var id: String
  private var nick: String?
  private var realName: String?
  private var userName: String?
  private var hostName: String
  private var modes: Int?
  private var connection: ClientConnection
  private var fullyIdentified: Bool


  init(clientId id: String, hostName: String, connection: ClientConnection) {
    self.id = id
    self.hostName = hostName
    self.connection = connection
    self.fullyIdentified = false
  }


  func send(message: String) {
    self.connection.sendLine(message)
  }


  /*
   * Compile a users identifiers into a proper client identifier
   * e.g. nick!username@localhost
  */
  func getFullyIdentifiedName() -> String? {

    if let nickN = self.nick, let userN = self.userName {
      return nickN + "!" + userN + "@" + self.hostName
    }

    return nil
  }


  /*
   * Getters and setters
  */
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


  func setUserName(name: String) {
    self.userName = name
  }


  func getUserName() -> String? {
    return self.userName
  }


  func setHostName(name: String) {
    self.hostName = name
  }


  func getHostName() -> String? {
    return self.hostName
  }


  func isFullyIdentified() -> Bool {
    return self.fullyIdentified
  }


  func identify() {
    self.fullyIdentified = true
  }


}
