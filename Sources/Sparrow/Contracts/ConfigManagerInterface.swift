/*
 * Author: fbailey
 * Date:   2016-01-27T13:07:14-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-27T13:07:14-08:00
*/

protocol ConfigManagerInterface {

  func getConfigValue(key: String) -> AnyObject?
}
