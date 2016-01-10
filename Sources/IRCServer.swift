import swiftysockets
import Foundation


class IRCServer {

  private var ip: IP
  private var port: Int
  private var logger: Logger
  private var socket: TCPServerSocket
  private var clients: [TCPClientSocket]
  private var channels: [IRCChannel]


  init?(port: port, logger: Logger) {
    self.port = port
    self.logger = logger
    self.clients = []
    self.channels = []

    do {
      self.ip = try IP(port: self.port)
      self.socket = try TCPServerSocket(ip: self.ip)
    }
    catch let error {
      self.logger.log("Error creating server socket on port \(self.port)", Logger.Normal)
    }
  }


  func listen() {

    while true {
      do {
        let client = try self.server.accept()
        self.addClient(client)
      }
      catch let error {
        self.logger.log("Error accepting client connection", Logger.Verbose)
      }
    }
  }

  func addClient(client: TCPClientSocket) {
    self.clients.append(client)
  }

  func removeClient() {

  }


}
