/*
 * Author: fbailey
 * Date:   2016-01-21T14:14:45-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:14:45-08:00
*/


class ChannelManager: ChannelManagerInterface {

  /*
   * List of channels indexed by channel name
  */
  private var channels: [String: ChannelInterface]


  init(channels: [(String, String?)]?) {
    self.channels = [:]

    if let chans = channels {

      for channel in chans {

        let name = channel.0
        let topic = channel.1

        let chan = Channel(channelName: name, channelTopic: topic)

        self.channels[name] = chan
      }
    }
  }


  /*
   * Locate all channels that a client with a given nick resides
  */
  func findChannelsForNick(nick: String) -> [ChannelInterface] {

    var chans = [ChannelInterface]()

    for (chanName, channel) in self.channels {

      if let _ = channel.getClientList()[nick] {
        chans.append(channel)
      }
    }

    return chans
  }


  func getChannels() -> [ChannelInterface] {
    return self.channels
  }

}
