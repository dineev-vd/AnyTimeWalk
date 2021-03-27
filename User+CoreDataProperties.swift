//
//  User+CoreDataProperties.swift
//  
//
//  Created by Влад Динеев on 27.03.2021.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdTours: NSSet?
    @NSManaged public var doneTours: Tour?

}

// MARK: Generated accessors for createdTours
extension User {

    @objc(addCreatedToursObject:)
    @NSManaged public func addToCreatedTours(_ value: Tour)

    @objc(removeCreatedToursObject:)
    @NSManaged public func removeFromCreatedTours(_ value: Tour)

    @objc(addCreatedTours:)
    @NSManaged public func addToCreatedTours(_ values: NSSet)

    @objc(removeCreatedTours:)
    @NSManaged public func removeFromCreatedTours(_ values: NSSet)

}
