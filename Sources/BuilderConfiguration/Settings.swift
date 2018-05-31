// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Created by Sam Deane, 14/03/2018.
// All code (c) 2018 - present day, Elegant Chaos Limited.
// For licensing terms, see http://elegantchaos.com/license/liberal/.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

public struct Setting {
  public let key: String
  public let value: Any

  var json : String { get { return asJSON(value: value, compact: true) } }
  var testJSON : String { get { return asJSON(value: value, compact: false) } }

  public static func setting(_ key: String, _ value: Any) -> Setting {
    return Setting(key: key, value: value)
  }

}

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

        public static func spec(name: String, filter: [String] = []) -> Inheritance {
            return Inheritance(name: name, filter: filter)
        }
    }

    public struct Spec {
        let name: String
        let value: [String:Any]

        init(name: String, values: [Setting]?, inherits: [Inheritance]?) {
            var info: [String:Any] = [:]

            if let values = values {
              var valueDict: [String:Any] = [:]
              for value in values {
                valueDict[value.key] = value.value
              }
              info["values"] = valueDict
            }

            if let inherits = inherits {
                info["inherits"] = inherits.map({ $0.value })
            }

            self.name = name
            self.value = info
        }

        public static func base(values: [Setting], inherits: [Inheritance]? = nil) -> Spec {
            return Spec(name: "«base»", values: values, inherits: inherits)
        }

        public static func spec(name: String,
                                  values: [Setting],
                                  inherits: [Inheritance]? = nil) -> Spec {
            return Spec(name: name, values: values, inherits: inherits)
        }

    }

    public init(specs : [Spec] = []) {
        var info : [String:Any] = [:]
        for spec in specs {
            info[spec.name] = spec.value
        }
        self.value = info
    }

}
