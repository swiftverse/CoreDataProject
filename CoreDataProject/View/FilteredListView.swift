//
//  FilteredListView.swift
//  CoreDataProject
//
//  Created by Amit Shrivastava on 19/12/21.
//

//import SwiftUI
//
//struct FilteredListView: View {
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest var fetchRequest: FetchedResults<Singer>
//
//    init(filter: String) {
//        _fetchRequest = FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
//    }
//    var body: some View {
//        List(fetchRequest, id: \.self) { singer in
//            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//        }
//    }
//}
//


import SwiftUI
import CoreData

struct FilteredListView<T: NSManagedObject, Content: View>: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    let condition: String
    init(filterKey: String, filterValue: String, condition: String, sortDescriptors: [ NSSortDescriptor],  @ViewBuilder content: @escaping  (T) -> Content) {
        self.condition = condition
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(condition) %@", filterKey, filterValue))
        self.content = content
    }
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
          //  Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            self.content(singer)
           
        }
    }
}

