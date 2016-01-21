/*
 * Author: fbailey
 * Date:   2016-01-21T14:14:45-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:14:45-08:00
*/


class ChannelManager {

  /*
   * List of channels indexed by channel name
  */
  private var channels: [String: Channel]


  init() {
    self.channels = [:]
  }


  /*
   * Locate all channels that a client with a given nick resides
  */
  func findChannelsForNick(nick: String) -> [Channel] {

    var chans = [Channel]()

    for (chanName, channel) in self.channels {

      if let _ = channel.getClientList()[nick] {
        chans.append(channel)
      }
    }

    return chans
  }

}
