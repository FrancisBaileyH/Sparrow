/*
 * Author: fbailey
 * Date:   2016-01-21T14:29:44-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:29:44-08:00
*/

protocol Broadcastable {

  func broadcast(message: String, nicks: [String])
}
