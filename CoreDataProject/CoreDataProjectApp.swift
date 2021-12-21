//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Amit Shrivastava on 18/12/21.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            CoreDataProject()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
