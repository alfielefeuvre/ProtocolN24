//
//  ProtocolN24App.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 14/11/2023.
//

import SwiftData
import SwiftUI


@main
struct ProtocolN24App: App {
    @StateObject var appController = AppController()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            UserConfig.self,
            DayData.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
   
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(appController)
        .modelContainer(sharedModelContainer)
    }
}

//
//@main
//struct ProtocolN24App: App {
//    @StateObject var appController = AppController()
//    
//    let modelContainer: ModelContainer
//        
//        init() {
//            do {
//                modelContainer = try ModelContainer(for: UserConfig.self, DayData.self)
//            } catch {
//                fatalError("Could not initialise ModelContainer")
//            }
//        }
//   
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//        .environmentObject(appController)
//        .modelContainer(for: [UserConfig.self, DayData.self])
//    }
//}
//


//@main
//struct ProtocolN24App: App {
//    @StateObject var appController = AppController()
//
////    let container: ModelContainer
////    var userContainer: ModelContainer
////    var dayDataContainer: ModelContainer
//
// //   var container: ModelContainer
//
//        init() {
//            do {
//                let storeUserURL = URL.documentsDirectory.appending(path: "")
//                let storeDayDataURL = URL.documentsDirectory.appending(path: "")
//                
//                let userSchema = Schema([UserConfig.self])
//                let dayDataSchema = Schema([DayData.self])
//
//                let userConfig = ModelConfiguration(schema: userSchema, url: storeUserURL, cloudKitDatabase: .private("userConfig"))
//                let dayDataConfig = ModelConfiguration(schema: dayDataSchema, url: storeDayDataURL, cloudKitDatabase: .private("dayDataConfig"))
//
//                container = try ModelContainer(for: UserConfig.self, DayData.self, configurations: userConfig, dayDataConfig)
//            } catch {
//                fatalError("Failed to configure SwiftData container.")
//            }
//        }
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//        .environmentObject(appController)
//  //      .modelContainer(for: [UserConfig.self, DayData.self])
//        .modelContainer(container)
//    }
//}


//
//init() {
//    do {
//        let userSchema = Schema([UserConfig.self])
//        let dayDataSchema = Schema([DayData.self])
//
//        let userConfig = ModelConfiguration(schema: userSchema, cloudKitDatabase: .private("userConfig"))
//        let dayDataConfig = ModelConfiguration(schema: dayDataSchema, cloudKitDatabase: .private("dayDataConfig"))
//
//        container = try ModelContainer(for: UserConfig.self, DayData.self, configurations: userConfig, dayDataConfig)
//    } catch {
//        fatalError("Failed to configure SwiftData container.")
//    }
//}
//
//var body: some Scene {
//WindowGroup {
//    ContentView()
//}
//.environmentObject(appController)
//.modelContainer(for: [UserConfig.self, DayData.self])
//}
//}
//
//
//
//
//
//
//
//





/*
@main
struct ProtocolN24App: App {
    @StateObject var appController = AppController()
    
    let modelContainer: ModelContainer
        
        init() {
            do {
                modelContainer = try ModelContainer(for: UserConfig.self, DayData.self)
            } catch {
                fatalError("Could not initialise ModelContainer")
            }
        }
   
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(appController)
        .modelContainer(for: [UserConfig.self, DayData.self])
    }
}

*/
