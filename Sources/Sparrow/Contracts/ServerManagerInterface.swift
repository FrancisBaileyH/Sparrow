/*
 * Author: fbailey
 * Date:   2016-01-25T12:53:36-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-25T12:53:36-08:00
*/

protocol ServerManagerInterface {

  func getClientManager() -> ClientManagerInterface
  func getChannelManager() -> ChannelManagerInterface
}
