/*
 * Author: fbailey
 * Date:   2016-01-24T13:32:37-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-24T13:32:37-08:00
*/

protocol ConnectionInterface {

  func sendLine(message: String) throws 
  func readLine() throws -> Executable
}
