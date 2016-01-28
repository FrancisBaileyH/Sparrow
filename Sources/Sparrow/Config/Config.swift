/*
 * Author: fbailey
 * Date:   2016-01-27T19:50:34-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-27T19:50:34-08:00
*/

struct Config {

  var serverName: String!
  var operators: [(String, String)]!
  var channels: [(String, String?)]?
  var welcomeMessage: String!
  var motd: String?
}
