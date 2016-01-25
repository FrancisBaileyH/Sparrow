import Foundation


class Channel: ChannelInterface {

  private var chanName: String
  private var topic: String
  private var operators: [String]
  private var clients: [String: ClientInterface]


  init(channelName name: String, channelTopic topic: String) {
    self.chanName = name
    self.topic = topic
    self.operators = []
    self.clients = [:]
  }


  func getClientList() -> [String: ClientInterface] {
    return self.clients
  }
}
