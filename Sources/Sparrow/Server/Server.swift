import swiftysockets
import Foundation


class Server {

  private var ip: IP
  private var port: Int
  private var logger: Logger
  private var socket: TCPServerSocket
  private var serverManager: ServerManager


  init?(port: Int, logger: Logger) {
    self.port = port
    self.logger = logger
    self.serverManager = ServerManager()

    do {
      self.ip = try IP(port: self.port)
      self.socket = try TCPServerSocket(ip: self.ip)
    }
    catch _ {
      self.logger.log("Unable to initiate server.", logLevel: LogLevel.Normal)
      return nil
    }
  }


  func listen() {

    while true {
      do {
        let connection = try self.socket.accept()
        self.acceptConnection(connection)
      }
      catch _ {
        self.logger.log("Unable to accept client.", logLevel: LogLevel.Verbose)
      }
    }
  }


  func acceptConnection(connection: TCPClientSocket) {
    let clientId = self.serverManager.createClientId()
    let client = ClientConnection(clientId: clientId, socket: connection, handler: self.serverManager)
    client.start()
    print("Client Added: \(clientId)")
    self.serverManager.addClient(client)
  }

}
