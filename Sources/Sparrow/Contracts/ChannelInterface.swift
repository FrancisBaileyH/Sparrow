/*
 * Author: fbailey
 * Date:   2016-01-25T12:49:41-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-25T12:49:41-08:00
*/

protocol ChannelInterface {
  func getClientList() -> [String: ClientInterface]
}
