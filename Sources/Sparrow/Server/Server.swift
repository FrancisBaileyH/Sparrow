/*
 * Author: fbailey
 * Date:   2016-01-21T13:51:01-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T13:51:01-08:00
*/

import swiftysockets
import Foundation


class Server {

  private var ip: IP
  private var port: Int
  private var logger: LoggerInterface
  private var socket: TCPServerSocket
  private var serverManager: ServerManager
  private var configManager: ConfigManagerInterface


  init?(port: Int, logger: LoggerInterface, config: ConfigManagerInterface) {
    self.port = port
    self.logger = logger
    self.configManager = config
    self.serverManager = ServerManager(config: self.configManager)

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

  /*
   * @TODO, need to get IP Address/Hostname
  */
  func acceptConnection(connection: TCPClientSocket) {

    let client = ClientConnection(socket: connection)
    self.serverManager.addConnection(client)
  }

}
