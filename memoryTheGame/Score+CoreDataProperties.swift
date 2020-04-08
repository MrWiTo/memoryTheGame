//
//  Score+CoreDataProperties.swift
//  memoryTheGame
//
//  Created by ViTo on 02/04/2020.
//  Copyright © 2020 ViTo. All rights reserved.
//
//

import Foundation
import CoreData


extension Score {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Score> {
        return NSFetchRequest<Score>(entityName: "Score")
    }

    @NSManaged public var score: String
    @NSManaged public var personRel: Person

}
