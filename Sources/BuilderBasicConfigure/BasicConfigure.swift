// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Created by Sam Deane, 28/02/2018.
// All code (c) 2018 - present day, Elegant Chaos Limited.
// For licensing terms, see http://elegantchaos.com/license/liberal/.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

public struct SettingsScheme {
  let name : String
  let value : [String:Any]
    
    init(name: String, common: [String]?, c: [String]?, cpp: [String]?, swift: [String]?, linker: [String]?) {
        var info : [String:Any] = [:]
        if common != nil { info["common"] = common }

        self.name = name
        self.value = info
    }
    
    public static func scheme(name: String, common: [String]? = nil, c: [String]? = nil, cpp: [String]? = nil, swift: [String]? = nil, linker: [String]? = nil) -> SettingsScheme {
        return SettingsScheme(name: name, common: common, c: c, cpp: cpp, swift: swift, linker: linker)
    }

}

public struct Settings {
  public let value : [String:Any]

  public init(schemes : [SettingsScheme]) {
    var info : [String:Any] = [:]
    for scheme in schemes {
      info[scheme.name] = scheme.value
    }
    self.value = info
  }
}

extension SettingsScheme {
}

public class BasicConfigure {
  let configuration : [String:Any]

  public init(dictionary: [String:Any]) {
    self.configuration = dictionary
  }

  public func run() throws {
    let encoded = try JSONSerialization.data(withJSONObject: configuration, options: .prettyPrinted)
    if let json = String(data: encoded, encoding: String.Encoding.utf8) {
        print(json)
    }
  }
}
