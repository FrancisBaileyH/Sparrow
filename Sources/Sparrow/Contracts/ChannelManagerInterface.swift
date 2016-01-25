/*
 * Author: fbailey
 * Date:   2016-01-25T12:48:39-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-25T12:48:39-08:00
*/

protocol ChannelManagerInterface {
  
  func findChannelsForNick(nick: String) -> [ChannelInterface]
}
