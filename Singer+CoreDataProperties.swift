//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Amit Shrivastava on 19/12/21.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    
    var wrappedFirstName: String {
        return firstName ?? "No First Name"
    }
    
    var wrappedLastName: String {
        return lastName ?? "No Last Name"
    }

}

extension Singer : Identifiable {

}
