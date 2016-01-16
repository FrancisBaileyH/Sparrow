import swiftysockets
import Foundation


class ClientConnection {

  private var initiated: Bool
  private var socket: TCPClientSocket
  private var delegate: ConnectionDelegate?


  convenience init(socket: TCPClientSocket, handler: ConnectionDelegate) {
    self.init(socket: socket)
    self.delegate = handler
  }


  init(socket: TCPClientSocket) {
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
   *
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


  private func parseMessage(message: String) {

    if let parsedMsg = Parser.parse(message) {

      if let command = CommandFactory.build(parsedMsg) {
        self.delegate?.handleClientCommand(command)
      }
      else {

      }
    }
  }


  func sendLine(message: String) {
    do {
      try self.socket.sendString(message)
      try self.socket.flush()
    }
    catch _ {

    }
  }

}
