/*
 * Author: fbailey
 * Date:   2016-01-27T13:05:49-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-27T13:05:49-08:00
*/

public enum ConfigError: ErrorType {
  case MissingValue
}


class ConfigManager: ConfigManagerInterface {


  private var config: Config
  private var fileManager: FileManager

  private let requiredValues = [
    "server-name",
    "welcome-message"
  ]


  init?(configFile: String) {

    self.fileManager = FileManager()

    self.config = Config()
    self.config.serverName = "localhost"
    self.config.welcomeMessage = "Welcome to " + self.config.serverName
    self.config.channels = ["help", "chat", "casual"]
  }


  func getConfig() -> Config {
    return self.config
  }


  func setConfig(config: Config) {
    self.config = config
  }

}
