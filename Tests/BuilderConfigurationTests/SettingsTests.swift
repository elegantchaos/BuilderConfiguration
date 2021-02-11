
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Created by Sam Deane, 14/03/2018.
// All code (c) 2018 - present day, Elegant Chaos Limited.
// For licensing terms, see http://elegantchaos.com/license/liberal/.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import XCTest
@testable import BuilderConfiguration


class SettingsTests: XCTestCase {

    func testSettings() throws {
//        let test = Settings(specs: [
//            .base(
//                values: [.setting("D", "example")],
//                inherits: [
//                    .spec(name: "mac", filter: ["macOS"]),
//                    .spec(name: "debug", filter: ["debug"])
//                ]
//            ),
//            .spec(
//                name: "mac",
//                swift: ["target", "x86_64-apple-macosx10.12"]
//            ),
//            .spec(
//                name: "debug",
//                swift: ["Onone"]
//            )
//            ]
//        )
//
//        let expected = """
//            {
//              "«base»" : {
//                "inherits" : [
//                  {
//                    "filter" : [
//                      "macOS"
//                    ],
//                    "name" : "mac"
//                  },
//                  {
//                    "filter" : [
//                      "debug"
//                    ],
//                    "name" : "debug"
//                  }
//                ],
//                "swift" : [
//                  "Dexample"
//                ]
//              },
//              "debug" : {
//                "swift" : [
//                  "Onone"
//                ]
//              },
//              "mac" : {
//                "swift" : [
//                  "target",
//                  "x86_64-apple-macosx10.12"
//                ]
//              }
//            }
//            """
//
//        XCTAssertEqual(test.testJSON, expected)

    }

    static var allTests = [
        ("testSettings", testSettings),
    ]

}
