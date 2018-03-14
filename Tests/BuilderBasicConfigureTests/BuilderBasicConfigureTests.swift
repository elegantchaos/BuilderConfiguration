
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Created by Sam Deane, 14/03/2018.
// All code (c) 2018 - present day, Elegant Chaos Limited.
// For licensing terms, see http://elegantchaos.com/license/liberal/.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import XCTest
@testable import BuilderBasicConfigure


class BuilderTests: XCTestCase {
    
    func testSettings() throws {
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
        
        XCTAssertEqual(test.testJSON, expected)
        
    }
 
    func testConfiguration() throws {
        let test = Configuration(
            settings: Settings(schemes: []),
            schemes: [
                .scheme(
                    name: "build", phases: [
                        .phase(name:"prepare", tool: "protobuf", arguments: ["Source/*.proto"]),
                        .phase(name:"build", tool: "build", arguments: ["myProduct"]),
                        .phase(name:"package", tool: "package", arguments: ["myProduct.app"])
                    ]),
                .scheme(
                    name: "test", phases: [
                        .phase(name:"testing", tool: "test", arguments: ["myProduct"]),
                        ]
                ),
                ]
        )
        
        let expected = """
                {
                  "build" : {
                    "name" : "build",
                    "phases" : [
                      {
                        "arguments" : [
                          "Source\\/*.proto"
                        ],
                        "name" : "prepare",
                        "tool" : "protobuf"
                      },
                      {
                        "arguments" : [
                          "myProduct"
                        ],
                        "name" : "build",
                        "tool" : "build"
                      },
                      {
                        "arguments" : [
                          "myProduct.app"
                        ],
                        "name" : "package",
                        "tool" : "package"
                      }
                    ]
                  },
                  "test" : {
                    "name" : "test",
                    "phases" : [
                      {
                        "arguments" : [
                          "myProduct"
                        ],
                        "name" : "testing",
                        "tool" : "test"
                      }
                    ]
                  }
                }
                """
        
        XCTAssertEqual(test.testJSON, expected)
        
    }

}

