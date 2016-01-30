/*
 * Author: fbailey
 * Date:   2016-01-21T13:55:17-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T13:55:17-08:00
*/

protocol ClientInterface {

  func send(identifier: String, message: String)
  func startReceiving()
  func getHostmask() -> String
  func getNick() -> String
  func setNick(nick: String)
  func setRealName(name: String)
  func getRealName() -> String?
  func setUserName(name: String)
  func getUserName() -> String
  func setHostName(name: String)
  func getHostName() -> String
  func isRegistered() -> Bool
  func register()
}
