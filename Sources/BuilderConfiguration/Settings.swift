// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Created by Sam Deane, 14/03/2018.
// All code (c) 2018 - present day, Elegant Chaos Limited.
// For licensing terms, see http://elegantchaos.com/license/liberal/.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

public struct Settings {
    public let value : [String:Any]

    var json : String { get { return asJSON(value: value, compact: true) } }
    var testJSON : String { get { return asJSON(value: value, compact: false) } }

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

        init(name: String, common: [String]?, c: [String]?, cpp: [String]?, swift: [String]?, linker: [String]?, values: [String:String]?, inherits: [Inheritance]?) {
            var info : [String:Any] = [:]
            if common != nil { info["common"] = common }
            if c != nil { info["c"] = c }
            if cpp != nil { info["cpp"] = cpp }
            if swift != nil { info["swift"] = swift }
            if linker != nil { info["linker"] = linker }
            if values != nil { info["values"] = values }
            if let inherits = inherits {
                info["inherits"] = inherits.map({ $0.value })
            }

            self.name = name
            self.value = info
        }

        public static func baseScheme(common: [String]? = nil,
            c: [String]? = nil,
            cpp: [String]? = nil,
            swift: [String]? = nil,
            linker: [String]? = nil,
            inherits: [Inheritance]? = nil) -> Scheme {

            return Scheme(name: "«base»", common: common, c: c, cpp: cpp, swift: swift, linker: linker, values: nil, inherits: inherits)
        }

        public static func scheme(name: String,
                                  common: [String]? = nil,
                                  c: [String]? = nil,
                                  cpp: [String]? = nil,
                                  swift: [String]? = nil,
                                  linker: [String]? = nil,
                                  inherits: [Inheritance]? = nil) -> Scheme {
            return Scheme(name: name, common: common, c: c, cpp: cpp, swift: swift, linker: linker, values: nil, inherits: inherits)
        }

        public static func scheme(name: String,
                                  values: [String:String],
                                  inherits: [Inheritance]? = nil) -> Scheme {
            return Scheme(name: name, common: nil, c: nil, cpp: nil, swift: nil, linker: nil, values: values, inherits: inherits)
        }

    }

    public init(schemes : [Scheme] = []) {
        var info : [String:Any] = [:]
        for scheme in schemes {
            info[scheme.name] = scheme.value
        }
        self.value = info
    }

}
