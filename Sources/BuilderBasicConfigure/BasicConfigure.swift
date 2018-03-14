// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Created by Sam Deane, 28/02/2018.
// All code (c) 2018 - present day, Elegant Chaos Limited.
// For licensing terms, see http://elegantchaos.com/license/liberal/.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation



public struct Settings {
    public let value : [String:Any]
    
    public struct Inheritance {
        let value : [String:Any]
        
        init(name: String, filter: [String]) {
            var info : [String:Any] = [ "name" : name ]
            if filter.count > 0 {
                info["filter"] = filter
            }
            self.value = info
        }
        
        public static func scheme(name: String, filter: [String] = []) -> Inheritance {
            return Inheritance(name: name, filter: filter)
        }
    }
    
    public struct Scheme {
        let name : String
        let value : [String:Any]
        
        init(name: String, common: [String]?, c: [String]?, cpp: [String]?, swift: [String]?, linker: [String]?, inherits: [Inheritance]?) {
            var info : [String:Any] = [:]
            if common != nil { info["common"] = common }
            if c != nil { info["c"] = c }
            if cpp != nil { info["cpp"] = cpp }
            if swift != nil { info["swift"] = swift }
            if linker != nil { info["linker"] = linker }
            if let inherits = inherits {
                info["inherits"] = inherits.map({ $0.value })
            }
            
            self.name = name
            self.value = info
        }
        
        public static func scheme(name: String,
                                  common: [String]? = nil,
                                  c: [String]? = nil,
                                  cpp: [String]? = nil,
                                  swift: [String]? = nil,
                                  linker: [String]? = nil,
                                  inherits: [Inheritance]? = nil) -> Scheme {
            return Scheme(name: name, common: common, c: c, cpp: cpp, swift: swift, linker: linker, inherits: inherits)
        }
        
    }
    
    public init(schemes : [Scheme]) {
        var info : [String:Any] = [:]
        for scheme in schemes {
            info[scheme.name] = scheme.value
        }
        self.value = info
    }
    
    var json : String { get {
        let options : JSONSerialization.WritingOptions
        if #available(macOS 10.13, *) {
            options = [.sortedKeys, .prettyPrinted]
        } else {
            options = .prettyPrinted
        }
        
        do {
            let encoded = try JSONSerialization.data(withJSONObject: value, options: options)
            if let json = String(data: encoded, encoding: String.Encoding.utf8) {
                return json
            }
        } catch {
        }
        
        return ""
        }
    }
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
