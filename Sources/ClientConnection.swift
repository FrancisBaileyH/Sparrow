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


  func start() {

    let handlerThread = NSThread() {
      while true {
        self.readLine()
      }
    }

    handlerThread.start()
  }

  private func readLine() {
      do {
        if let message = try self.clientSocket.receiveString(untilDelimiter: "\n") {
          print("Recieved from client \(message)")
        }
      }
      catch _ {

      }
  }


  public func sendLine(message: String) {
    
  }

}
