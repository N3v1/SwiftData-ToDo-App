//
//  TodosApp.swift
//  Todos
//
//  Created by Nevio Hirani on 03.07.23.
//

import SwiftUI
import SwiftData

@main
struct TodosApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
//            .modelContainer(for: ToDoItem.self)
        }
        .modelContainer(for: Item.self)
    }
}
