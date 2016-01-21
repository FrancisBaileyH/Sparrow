/*
 * Author: fbailey
 * Date:   2016-01-21T14:30:19-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:30:19-08:00
*/

class MessageFactory {

  /*
   * @TODO - remove. This is a temp structure to work on some other impending features
  */
  static func build(replyCode: ReplyCode, message: String) -> String {

    let msgPrefix = ":localhost " + replyCode.rawValue
    let serverMessage = msgPrefix + " " + message + "\r\n"

    return serverMessage
  }

}
