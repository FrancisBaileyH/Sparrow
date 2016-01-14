protocol Logger {

  func log(message: String, logLevel: LogLevel)
}

enum LogLevel: Int {
  case Debug   = 7
  case Verbose = 4
  case Normal  = 1
}
