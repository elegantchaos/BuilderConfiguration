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

        public static func toolPhase(name: String, tool: String, arguments: [String]? = nil) -> Phase {
            return Phase(name: name, tool: tool, arguments: arguments ?? [])
        }

        public static func buildPhase(name: String, target: String, arguments: [String]? = nil) -> Phase {
            return Phase(name: name, tool: "build", arguments: [target] + (arguments ?? []))
        }

        public static func testPhase(name: String, target: String, arguments: [String]? = nil) -> Phase {
            return Phase(name: name, tool: "test", arguments: [target] + (arguments ?? []))
        }

        public static func actionPhase(name: String, action: String, arguments: [String]? = nil) -> Phase {
            return Phase(name: name, tool: "action", arguments: [action] + (arguments ?? []))
        }

    }

    public struct Action {
        let name : String
        let value : [[String:Any]]

        init(name: String, phases: [Phase]) {
            self.name = name
            self.value = phases.map { $0.value }
        }

        public static func action(name: String, phases: [Phase]) -> Action {
            return Action(name: name, phases: phases)
        }
    }

    public init(dictionary : [String:Any]) {
        self.value = dictionary
    }

    public init(settings : Settings = Settings(), actions : [Action]) {
        var actionsValue : [String:Any] = [:]
        for action in actions {
            actionsValue[action.name] = action.value
        }
        self.value = [
          "settings" : settings.value,
          "actions" : actionsValue
        ]
    }

    public func outputToBuilder() {
        print(self.json)
    }

}
