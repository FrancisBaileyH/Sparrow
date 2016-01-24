/*
 * Author: fbailey
 * Date:   2016-01-21T13:55:17-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T13:55:17-08:00
*/

import Foundation


class Client {

  private var id: String
  private var nick: String?
  private var realName: String?
  private var userName: String?
  private var hostName: String
  private var connection: ConnectionInterface
  private var delegate: ConnectionDelegate?
  private var registered: Bool


  convenience init(clientId id: String, hostName: String, connection: ConnectionInterface, handler: ConnectionDelegate) {
    self.init(clientId: id, hostName: hostName, connection: connection)
    self.delegate = handler
  }


  init(clientId id: String, hostName: String, connection: ConnectionInterface) {
    self.id = id
    self.hostName = hostName
    self.connection = connection
    self.registered = false
  }


  /*
   * Send a message through the client connection
  */
  func send(identifier: String, replyCode: ReplyCode, message: String) {

    do {
      let idAndMessage = identifier + " " + message
      let reply = MessageFactory.build(replyCode, message: idAndMessage)

      try self.connection.sendLine(reply)
    }
    catch let error {
      self.delegate?.handleError(self.id, error: error)
    }
  }


  /*
   * Initiate a thread to start handling incoming messages from
   * the client connection
  */
  func startReceiving() {

    let handlerThread = NSThread() {

      while true {
        self.receive()
      }
    }

    handlerThread.start()
  }


  /*
   * Receieve a command from the client connection
  */
  private func receive() {

    do {
      let command = try self.connection.readLine()
      self.delegate?.handleCommand(self.id, command: command)
    }
    catch let error {
      self.delegate?.handleError(self.id, error: error)
    }
  }

}


extension Client {


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


  func isRegistered() -> Bool {
    return self.registered
  }


  func register() {
    self.registered = true
  }


}
