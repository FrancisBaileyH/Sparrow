import swiftysockets
import Foundation


class ClientConnection {


  private var clientSocket: TCPClientSocket
  private var delegate: ConnectionDelegate?


  convenience init(socket: TCPClientSocket, handler: ConnectionDelegate) {
    self.init(socket: socket)
    self.delegate = handler
  }

  init(socket: TCPClientSocket) {
    self.clientSocket = socket
  }

  /*
   * Initiate a thread to handle client transmissions
  */
  func start() {

    let handlerThread = NSThread() {
      while true {
        self.readLine()
      }
    }

    handlerThread.start()
  }

  /*
   *
  */
  private func readLine() {
      do {
        if let message = try self.clientSocket.receiveString(untilDelimiter: "\n") {
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
        command.execute(nil)
      }
      else {
        print("Error Occurred")
      }
    }
  }


  func sendLine(message: String) {

  }

}
