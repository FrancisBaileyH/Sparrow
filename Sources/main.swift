import swiftysockets
import Foundation


var clients: [TCPClientSocket] = []


do {
  let ip = try IP(port: 6667)
  let server = try TCPServerSocket(ip: ip)

  print("Server started")

  while true {
    do {
      let client = try server.accept()
      print("Connected")
      while true {
        do {
          if let s = try client.receiveString(untilDelimiter: "\n") {
            print("Recieved from client \(s)")
          }
        }
        catch let error {

        }
      }

    }
    catch let error {
      print("Error occurred")
    }
  }


}
catch let error {

}
