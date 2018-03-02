// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Created by Sam Deane, 28/02/2018.
// All code (c) 2018 - present day, Elegant Chaos Limited.
// For licensing terms, see http://elegantchaos.com/license/liberal/.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

public class BasicConfigure {
  let configuration : [String:String]

  public init(dictionary: [String:String]) {
    self.configuration = dictionary
  }

  public func run() throws {
    let encoded = try JSONSerialization.data(withJSONObject: configuration, options: .prettyPrinted)
    if let json = String(data: encoded, encoding: String.Encoding.utf8) {
        print(json)
    }
  }
}
