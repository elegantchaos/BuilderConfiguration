// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Created by Sam Deane, 28/02/2018.
// All code (c) 2018 - present day, Elegant Chaos Limited.
// For licensing terms, see http://elegantchaos.com/license/liberal/.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

func asJSON(value : Any, compact : Bool) -> String {
    var options : JSONSerialization.WritingOptions = []
    if #available(macOS 10.13, *) {
        options.insert(.sortedKeys)
    }
    if !compact {
        options.insert(.prettyPrinted)
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
