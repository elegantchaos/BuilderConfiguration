
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Created by Sam Deane, 14/03/2018.
// All code (c) 2018 - present day, Elegant Chaos Limited.
// For licensing terms, see http://elegantchaos.com/license/liberal/.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import XCTest
@testable import BuilderBasicConfigure


class BuilderTests: XCTestCase {
    
    @available(macOS 10.13, *) func testCompilerSetting() throws {
        let test = Settings(schemes: [
            .scheme(name: "test")
            ]
        )
        
        let expected = """
{"test":{}}
"""
        
        let encoded = try JSONSerialization.data(withJSONObject: test.value, options: .sortedKeys)
        if let json = String(data: encoded, encoding: String.Encoding.utf8) {
            XCTAssertEqual(json, expected)
        }
        
    }

}

