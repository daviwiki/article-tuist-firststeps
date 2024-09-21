import SwiftUI
import TuistCore
import Factory

@main
struct ILoveTuistApp: App {
    
    @Injected(\.employeeViewModel) private var employeeVM
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(employeeVM)
        }
    }
}
