import Foundation


class Channel {

  private var chanName: String
  private var topic: String
  private var operators: [String]
  private var clients: [String: Client]


  init(channelName name: String, channelTopic topic: String) {
    self.chanName = name
    self.topic = topic
    self.operators = []
    self.clients = [:]
  }


  func getClientList() -> [String: Client] {
    return self.clients
  }
}
