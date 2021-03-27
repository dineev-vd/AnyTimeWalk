//
//  Marker+CoreDataProperties.swift
//  
//
//  Created by Влад Динеев on 27.03.2021.
//
//

import Foundation
import CoreData


extension Marker {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Marker> {
        return NSFetchRequest<Marker>(entityName: "Marker")
    }

    @NSManaged public var name: String?
    @NSManaged public var longtitude: Double
    @NSManaged public var latitude: Double

}
