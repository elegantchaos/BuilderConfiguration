
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Created by Sam Deane, 14/03/2018.
// All code (c) 2018 - present day, Elegant Chaos Limited.
// For licensing terms, see http://elegantchaos.com/license/liberal/.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import XCTest
@testable import BuilderConfiguration

class ConfigurationTests: XCTestCase {
    func testConfiguration() throws {
        let test = Configuration(
            settings: Settings(schemes: []),
            actions: [
                .action(
                    name: "build", phases: [
                        .phase(name:"prepare", tool: "protobuf", arguments: ["Source/*.proto"]),
                        .phase(name:"build", tool: "build", arguments: ["myProduct"]),
                        .phase(name:"package", tool: "package", arguments: ["myProduct.app"])
                    ]),
                .action(
                    name: "test", phases: [
                        .phase(name:"testing", tool: "test", arguments: ["myProduct"]),
                        ]
                ),
                ]
        )

        let expected = """
                    {
                      "actions" : {
                        "build" : [
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
                        ],
                        "test" : [
                          {
                            "arguments" : [
                              "myProduct"
                            ],
                            "name" : "testing",
                            "tool" : "test"
                          }
                        ]
                      },
                      "settings" : {

                      }
                    }
                    """

        XCTAssertEqual(test.testJSON, expected)

    }

    static var allTests = [
        ("testConfiguration", testConfiguration),
    ]

}
