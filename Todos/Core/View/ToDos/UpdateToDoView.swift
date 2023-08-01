//
//  UpdateToDoView.swift
//  Todos
//
//  Created by Nevio Hirani on 03.07.23.
//


import SwiftUI
import SwiftData

class OriginalToDo {
    var title: String
    var timestamp: Date
    var isCritical: Bool
    
    init(item: Item) {
        self.title = item.title
        self.timestamp = item.timestamp
        self.isCritical = item.isCritical
    }
}

struct UpdateToDoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Query private var categories: [Category]
    
    @State var selectedCategory: Category?

    @Bindable var item: Item

    var body: some View {
        List {
            
            Section("To do title") {
                TextField("Name", text: $item.title)
            }
            
            Section("General") {
                DatePicker("Choose a date",
                           selection: $item.timestamp)
                Toggle("Important?", isOn: $item.isCritical)
            }
            
            
            
            Section("Select A Category") {
                
                
                if categories.isEmpty {
                    
                    ContentUnavailableView("No Categories",
                                           systemImage: "archivebox")
                    
                } else {
                    
                    Picker("", selection: $selectedCategory) {
                        
                        ForEach(categories) { category in
                            Text(category.title)
                                .tag(category as Category?)
                        }
                        
                        Text("None")
                            .tag(nil as Category?)
                    }
                    .labelsHidden()
                    .pickerStyle(.inline)
                }
                

            }
            
            Section {
                Button("Update") {
                    item.category = selectedCategory
                    dismiss()
                }
                .bold()
            }
        }
        .navigationTitle("Update ToDo")
        .onAppear(perform: {
            selectedCategory = item.category
        })
    }
}

// Xcode 15 Beta 2 has a previews bug so this is why we're commenting this out...
// Ref: https://mastodon.social/@denisdepalatis/110561280521551715
//#Preview {
//    UpdateToDoView(item: Item.dummy)
//        .modelContainer(for: Item.self)
//
//}
