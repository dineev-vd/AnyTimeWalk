//
//  Tour+CoreDataProperties.swift
//  
//
//  Created by Влад Динеев on 27.03.2021.
//
//

import Foundation
import CoreData


extension Tour {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Tour> {
        return NSFetchRequest<Tour>(entityName: "Tour")
    }

    @NSManaged public var desc: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var rating: Double
    @NSManaged public var owner: User?
    @NSManaged public var usersDone: NSSet?

}

// MARK: Generated accessors for usersDone
extension Tour {

    @objc(addUsersDoneObject:)
    @NSManaged public func addToUsersDone(_ value: User)

    @objc(removeUsersDoneObject:)
    @NSManaged public func removeFromUsersDone(_ value: User)

    @objc(addUsersDone:)
    @NSManaged public func addToUsersDone(_ values: NSSet)

    @objc(removeUsersDone:)
    @NSManaged public func removeFromUsersDone(_ values: NSSet)

}
