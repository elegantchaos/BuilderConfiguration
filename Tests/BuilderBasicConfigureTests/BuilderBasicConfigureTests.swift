
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Created by Sam Deane, 14/03/2018.
// All code (c) 2018 - present day, Elegant Chaos Limited.
// For licensing terms, see http://elegantchaos.com/license/liberal/.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import XCTest
@testable import BuilderBasicConfigure


class BuilderTests: XCTestCase {
    
    /*
     let settings : [String:Any] = [
     "common" :    [
     "common" : [],
     "c" : [],
     "cpp" : [],
     "swift" : [],
     "inherits" : [
     ["name": "mac", "platform" : "macOS"],
     ["name": "debug", "configuration" : "debug"]
     ]
     ],
     "mac" :    [
     "swift" : [
     "target", "x86_64-apple-macosx10.12"
     ]
     ],
     "debug" : [
     "swift" : [
     "Onone"
     ]
     ]
     ]
     */
    
    func testCompilerSetting() throws {
        let test = Settings(schemes: [
            .scheme(
                name: "common",
                swift: ["Dexample"],
                inherits: [
                    .scheme(name: "mac", filter: ["macOS"]),
                    .scheme(name: "debug", filter: ["debug"])
                ]
            ),
            .scheme(
                name: "mac",
                swift: ["target", "x86_64-apple-macosx10.12"]
            ),
            .scheme(
                name: "debug",
                swift: ["Onone"]
            )
            ]
        )
        
        let expected = """
            {
              "common" : {
                "inherits" : [
                  {
                    "filter" : [
                      "macOS"
                    ],
                    "name" : "mac"
                  },
                  {
                    "filter" : [
                      "debug"
                    ],
                    "name" : "debug"
                  }
                ],
                "swift" : [
                  "Dexample"
                ]
              },
              "debug" : {
                "swift" : [
                  "Onone"
                ]
              },
              "mac" : {
                "swift" : [
                  "target",
                  "x86_64-apple-macosx10.12"
                ]
              }
            }
            """
        
        XCTAssertEqual(test.json, expected)
        
    }
    
}

