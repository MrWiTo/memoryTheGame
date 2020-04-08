//
//  Person+CoreDataProperties.swift
//  memoryTheGame
//
//  Created by ViTo on 02/04/2020.
//  Copyright © 2020 ViTo. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String
    @NSManaged public var nick: String
    @NSManaged public var age: Int32
    @NSManaged public var scoreRel: NSSet

}

// MARK: Generated accessors for scoreRel
extension Person {

    @objc(addScoreRelObject:)
    @NSManaged public func addToScoreRel(_ value: Score)

    @objc(removeScoreRelObject:)
    @NSManaged public func removeFromScoreRel(_ value: Score)

    @objc(addScoreRel:)
    @NSManaged public func addToScoreRel(_ values: NSSet)

    @objc(removeScoreRel:)
    @NSManaged public func removeFromScoreRel(_ values: NSSet)

}
