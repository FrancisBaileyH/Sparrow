import swiftysockets
import Foundation


class IRCClientConnection {


  private var clientSocket: TCPClientSocket
  private var delegate: ConnectionDelegate?


  convenience init(socket: TCPClientSocket, handler: ConnectionDelegate) {
    self.init(socket: socket)
    self.delegate = handler
  }

  init(socket: TCPClientSocket) {
    self.clientSocket = socket
  }


  func start() {

    let handlerThread = NSThread() {

      while true {
        do {
          if let message = try self.clientSocket.receiveString(untilDelimiter: "\n") {
            print("Recieved from client \(message)")
          }
        }
        catch _ {

        }
      }
    }

    handlerThread.start()
  }
}
