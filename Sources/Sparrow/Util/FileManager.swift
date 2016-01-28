import Glibc

/*
 * @TODO - remove, this is just a temp solution while we wait for The
 * Foundation lib to be fully completed
*/
class FileManager {


  // Convert String to UInt8 bytes
  func bytesFromString(string: String) -> [UInt8] {
      return Array(string.utf8)
  }

  // Convert UInt8 bytes to String
  func stringFromBytes(bytes: UnsafeMutablePointer<UInt8>, count: Int) -> String {
      return String((0..<count).map ({Character(UnicodeScalar(bytes[$0]))}))
  }

  // Use fopen/fwrite to output string
  func writeStringToFile(string: String, path: String) -> Bool {
      let fp = fopen(path, "w"); defer {fclose(fp)}
      let byteArray = bytesFromString(string)
      let count = fwrite(byteArray, 1, byteArray.count, fp)
      return count == string.utf8.count
  }

  // Use fread to input string
  func readStringFromFile(path: String) -> String {
      let fp = fopen(path, "r"); defer {fclose(fp)}
      var outputString = ""
      let chunkSize = 1024
      let buffer: UnsafeMutablePointer<UInt8> = UnsafeMutablePointer.alloc(chunkSize); defer {buffer.dealloc(chunkSize)}
      repeat {
          let count: Int = fread(buffer, 1, chunkSize, fp)
          guard ferror(fp) == 0 else {break}
          if count > 0 {
              outputString += stringFromBytes(buffer, count: count)
          }
      } while feof(fp) == 0

      return outputString
  }
}
