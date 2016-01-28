/*
 * Author: fbailey
 * Date:   2016-01-27T13:05:49-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-27T13:05:49-08:00
*/

import JSON


public enum ConfigError: ErrorType {
  case MissingValue
}


class ConfigManager: ConfigManagerInterface {


  private var config: JSON
  private var fileManager: FileManager

  private let requiredValues = [
    "server-name",
    "welcome-message"
  ]


  init?(configFile: String) {

    self.fileManager = FileManager()

    do {
      let contents = self.fileManager.readStringFromFile(configFile)
      self.config = try JSONParser.parse(contents)
    }
    catch _ {
      return nil
    }
  }


  func getConfigValue(key: String) -> AnyObject? {
    return self.config[key] as? AnyObject
  }


  /*
   * Ensure expected values are found in the config file
  */
  func validateConfig() throws {

    for key in self.requiredValues {
      guard let _ = self.config[key] else {
        throw ConfigError.MissingValue
      }
    }
  }
}
