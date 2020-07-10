//
//  StroopData+CoreDataProperties.swift
//  StroopHello
//
//  Created by Richard Sprague on 7/9/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//
//

import Foundation
import CoreData


extension StroopData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StroopData> {
        return NSFetchRequest<StroopData>(entityName: "StroopData")
    }

    @NSManaged public var comment: String?
    @NSManaged public var date: Date?
    @NSManaged public var duration: Double
    @NSManaged public var playMode: Int16
    @NSManaged public var score: Int32

}
