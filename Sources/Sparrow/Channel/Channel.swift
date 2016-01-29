import Foundation


class Channel: ChannelInterface {

  private var chanName: String
  private var topic: String?
  private var operators: [String]
  private var clients: [String: ClientInterface]


  init(channelName name: String, channelTopic topic: String?) {
    self.chanName = name
    self.topic = topic
    self.operators = []
    self.clients = [:]
  }


  func getClientList() -> [String: ClientInterface] {
    return self.clients
  }


  /*
   * Broadcast to all clients except the original sender
  */
  func broadcast(nick: String, identifier: String, message: String) {

    for (nickInChan, client) in self.clients {
      if nickInChan != nick {
        client.send(identifier, message: message)
      }
    }
  }


  /*
   * Broadcast indescriminately
  */
  func broadcast(identifier: String, message: String) {

    for (_, client) in self.clients {
      client.send(identifier, message: message)
    }
  }

}
