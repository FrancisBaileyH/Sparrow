class ServerMessageFactory {

  /*
   * @TODO - remove. This is a temp structure to work on some other impending features
  */
  static func build(replyCode: ReplyCode, message: String) -> String {

    let msgPrefix = ":localhost " + replyCode.rawValue
    let serverMessage = msgPrefix + " " + message + "\r\n"

    return serverMessage
  }

}
