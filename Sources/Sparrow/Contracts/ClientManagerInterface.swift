/*
 * Author: fbailey
 * Date:   2016-01-25T12:45:08-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-25T12:45:08-08:00
*/

protocol ClientManagerInterface {

  func createClient(connection: ConnectionInterface, handler: ConnectionDelegate)
  func removeClient(clientId: String)
  func getClient(clientId: String) -> ClientInterface?
  func clientNickExists(nick: String) -> Bool
}
