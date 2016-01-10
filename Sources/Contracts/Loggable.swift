protocol Logger {

  static enum LogLevel: String {
    case Debug   = 7
    case Verbose = 4
    case Normal  = 1
  }

  func log(message: String, logLevel: LogLevel)
}
