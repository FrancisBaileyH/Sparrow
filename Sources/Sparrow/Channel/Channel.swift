import Foundation


class Channel {

  private var chanName: String
  private var topic: String
  private var operators: [String]


  init(channelName name: String, channelTopic topic: String) {
    self.chanName = name
    self.topic = topic
    self.operators = []
  }
}
