import swiftysockets
import Foundation


class ClientConnection {

  private var clientId: String
  private var initiated: Bool
  private var socket: TCPClientSocket
  private var delegate: ConnectionDelegate?


  convenience init(clientId id: String, socket: TCPClientSocket, handler: ConnectionDelegate) {
    self.init(clientId: id, socket: socket)
    self.delegate = handler
  }


  init(clientId id: String, socket: TCPClientSocket) {
    self.clientId = id
    self.socket = socket
    self.initiated = false
  }


  /*
   * Initiate a thread to handle client transmissions
  */
  func start() {

    if !self.initiated {

      let handlerThread = NSThread() {
        while true {
          self.readLine()
        }
      }

      handlerThread.start()
    }
  }


  /*
   * Read incoming messages and parse them
  */
  private func readLine() {
      do {
        if let message = try self.socket.receiveString(untilDelimiter: "\n") {
          print("Recieved from client \(message)")
          self.parseMessage(message)
        }
      }
      catch _ {

      }
  }

  // @TODO send client ID with handleClientCommand so that
  // ServerManager can identifyClient and a Client class can
  // be instantiated
  private func parseMessage(message: String) {

    if let parsedMsg = CommandParser.parse(message) {

      if let command = CommandFactory.build(parsedMsg) {
        self.delegate?.handleClientCommand(self.clientId, command: command)
      }
      else {

      }
    }
  }


  func sendLine(serverName: String, replyCode: ReplyCode, message: String) {
    do {

      let response = ":"
        + serverName
        + " "
        + replyCode.rawValue
        + " "
        + message

      try self.socket.sendString(response)
      try self.socket.flush()
    }
    catch _ {

    }
  }


  func getId() -> String {
    return self.clientId
  }

}
