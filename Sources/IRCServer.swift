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
    catch let error {
      self.logger.log(error), Logger.Normal)
    }
  }


  func listen() {

    while true {
      do {
        let client = try self.server.accept()
        self.addClient(client)
      }
      catch let error {
        self.logger.log(error, Logger.Verbose)
      }
    }
  }


  func addClient(client: TCPClientSocket) {

    let client = new IRCClientConnection(socket: client, hanlder: self)
    client.start()

    self.clients.append(client)
  }


  func removeClient() {

  }


  func handleClientMessage() {

  }


}
