/*
 * Author: fbailey
 * Date:   2016-01-25T12:49:41-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-25T12:49:41-08:00
*/

protocol ChannelInterface {
  func getClientList() -> [String: ClientInterface]
  func broadcast(nick: String, identifier: String, message: String)
  func broadcast(identifier: String, message: String)
}
