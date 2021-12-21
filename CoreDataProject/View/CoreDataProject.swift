//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Amit Shrivastava on 18/12/21.
//

import SwiftUI


enum SingerPredicate: String, Equatable, CaseIterable {
    case beginsWith  = "BEGINSWITH"
    case endsWith = "ENDSWITH"
    case contains  = "CONTAINS"
    case caseInsesitiveContains = "CONTAINS[c]"

}


struct CoreDataProject: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    @FetchRequest(sortDescriptors: []) var singers: FetchedResults<Singer>
  //  @State var condition: String = "BEGINSWITH"
    @State var condition: SingerPredicate = .beginsWith
    var conditionPicker1 = ["BEGINSWITH", "ENDSWITH", "CONTAINS", "CONTAINS[c]"]
    let sortDescriptors = [NSSortDescriptor(keyPath: \Singer.lastName, ascending: true)]
    @State var sortData = true
    @State var sortLabel = "Sort Reverse"
    var body: some View {
        VStack {

            // list of matching singers
       //    FilteredListView(filter: lastNameFilter)
            FilteredListView(filterKey: "lastName", filterValue: lastNameFilter, condition: condition.rawValue, sortDescriptors: [NSSortDescriptor(keyPath: \Singer.lastName, ascending: sortData)]) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }

            Picker("Type of NSPREDICATE", selection: $condition) {

//                ForEach(conditionPicker1, id: \.self) {
//                    value in
//                    Text(value)
//
//                }
                ForEach(SingerPredicate.allCases, id: \.self) { value in
                    Text("\(value.rawValue)")
                                        
                }
            }
            .pickerStyle(.segmented)
   
            
        //    Text("\(condition.rawValue)")
            
            Button("\(sortLabel)") {
                self.sortData.toggle()
                if(self.sortData == true) {
                    self.sortLabel = "Sort Reverse"
                }
                else {
                    self.sortLabel = "Original"
                }
                
            }
            
            
            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"

                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"

                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"

                try? moc.save()
            }
            

            Button("Show A") {
                lastNameFilter = "A"
            }
            

            Button("Show S") {
                lastNameFilter = "S"
            }
            
        }
//
//        VStack {
//            List {
//                ForEach(countries, id: \.self) { country in
//                    Section(country.wrappedFullName) {
//                        ForEach(country.candyArray, id: \.self) { candy in
//                            Text(candy.wrappedName)
//                        }
//                    }
//                }
//            }
//
//            Button("Add") {
//                let candy1 = Candy(context: moc)
//                candy1.name = "Mars"
//                candy1.origin = Country(context: moc)
//                candy1.origin?.shortName = "UK"
//                candy1.origin?.fullName = "United Kingdom"
//
//                let candy2 = Candy(context: moc)
//                candy2.name = "KitKat"
//                candy2.origin = Country(context: moc)
//                candy2.origin?.shortName = "UK"
//                candy2.origin?.fullName = "United Kingdom"
//
//                let candy3 = Candy(context: moc)
//                candy3.name = "Twix"
//                candy3.origin = Country(context: moc)
//                candy3.origin?.shortName = "UK"
//                candy3.origin?.fullName = "United Kingdom"
//
//                let candy4 = Candy(context: moc)
//                candy4.name = "Toblerone"
//                candy4.origin = Country(context: moc)
//                candy4.origin?.shortName = "CH"
//                candy4.origin?.fullName = "Switzerland"
//
//                try? moc.save()
//            }
//        }
    }
}


struct CoreDataProject_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataProject()
    }
}
