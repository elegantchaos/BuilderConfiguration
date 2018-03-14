// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Created by Sam Deane, 14/03/2018.
// All code (c) 2018 - present day, Elegant Chaos Limited.
// For licensing terms, see http://elegantchaos.com/license/liberal/.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

public struct Configuration {
    public let value : [String:Any]
    
    var json : String { get { return asJSON(value: value, compact: true) } }
    var testJSON : String { get { return asJSON(value: value, compact: false) } }
    
    public struct Phase {
        let value : [String:Any]
        
        init(name: String, tool: String, arguments: [String]) {
            self.value = ["name": name, "tool": tool, "arguments": arguments]
        }
        
        public static func phase(name: String, tool: String, arguments: [String]) -> Phase {
            return Phase(name: name, tool: tool, arguments: arguments)
        }
        
    }
    
    public struct Scheme {
        let name : String
        let value : [String:Any]
        
        init(name: String, phases: [Phase]) {
            self.name = name
            self.value = [
                "name": name,
                "phases": phases.map { $0.value }
            ]
        }
        
        public static func scheme(name: String, phases: [Phase]) -> Scheme {
            return Scheme(name: name, phases: phases)
        }
    }
    
    public init(dictionary : [String:Any]) {
        self.value = dictionary
    }
    
    public init(settings : Settings, schemes : [Scheme]) {
        var info : [String:Any] = [:]
        for scheme in schemes {
            info[scheme.name] = scheme.value
        }
        self.value = info
    }
    
    public func outputToBuilder() {
        print(self.json)
    }
    
}
