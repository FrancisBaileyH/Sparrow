import swiftysockets
import Foundation


class IRCServer: ConnectionDelegate {

  private var ip: IP
  private var port: Int
  private var logger: Logger
  private var socket: TCPServerSocket
  private var clients: [IRCClientConnection]
  private var channels: [IRCChannel]


  init?(port: Int, logger: Logger) {
    self.port = port
    self.logger = logger
    self.clients = []
    self.channels = []

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
        let client = try self.socket.accept()
        self.addClient(client)
      }
      catch _ {
        self.logger.log("Unable to accept client.", logLevel: LogLevel.Verbose)
      }
    }
  }


  func addClient(client: TCPClientSocket) {

    let client = IRCClientConnection(socket: client, handler: self)
    client.start()

    self.clients.append(client)
  }


  func removeClient() {

  }


  func handleClientMessage() {

  }


}
