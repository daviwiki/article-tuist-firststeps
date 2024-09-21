import Foundation
import ProjectDescription

func createRouteIfNotExists(_ route: String) -> String {
    let fm = FileManager.default
    
    let currentDirectory = fm.currentDirectoryPath
    let fullPath = NSString(string: currentDirectory).appendingPathComponent(route)
    
    if !fm.fileExists(atPath: fullPath) {
        try? fm.createDirectory(atPath: fullPath, withIntermediateDirectories: true)
        
        let emptyFilePath = NSString(string: fullPath).appendingPathComponent("Dummy.swift")
        fm.createFile(atPath: emptyFilePath, contents: nil, attributes: nil)
    }
    
    return route
}

let project = Project(
    name: "ILoveTuist",
    targets: [
        // Core
        .target(
            name: .InternalAlias.core,
            destinations: .iOS,
            product: .framework,
            bundleId: "com.atenea.core",
            sources: [
                "\(createRouteIfNotExists("\(String.InternalAlias.core)/Sources"))/**",
            ],
            resources: [
                "\(createRouteIfNotExists("\(String.InternalAlias.core)/Resources"))/**",
            ],
            dependencies: [
                .external(name: .ExternalAlias.alamofire, condition: nil),
                .external(name: .ExternalAlias.factory, condition: nil)
            ]
        ),
        // App
        .target(
            name: .InternalAlias.app,
            destinations: .iOS,
            product: .app,
            bundleId: "com.atenea.ILoveTuist",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: [
                "ILoveTuist/Sources/**"
            ],
            resources: [
                "ILoveTuist/Resources/**"
            ],
            dependencies: [
                .sdk(name: .InternalAlias.core, type: .framework, status: .required, condition: nil),
                .external(name: .ExternalAlias.lottie, condition: nil),
            ]
        ),
        // Core Tests
        .target(
            name: "TuistCoreTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.ILoveTuistTests",
            infoPlist: .default,
            sources: [
                "ILoveTuist/Tests/**"
            ],
            resources: [],
            dependencies: [
                .target(name: .InternalAlias.core),
            ]
        ),
    ]
)

extension String {
    
    struct InternalAlias {
        private init() { }
        static let app: String = "ILoveTuist"
        static let core: String = "TuistCore"
    }
    
    struct ExternalAlias {
        private init() { }
        static let alamofire: String = "Alamofire"
        static let factory: String = "Factory"
        static let lottie: String = "Lottie"
    }
}


