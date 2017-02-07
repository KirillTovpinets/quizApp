//
//  Questions+CoreDataProperties.swift
//  quizApp
//
//  Created by Кірыла on 03.01.17.
//  Copyright © 2017 Кірыла. All rights reserved.
//

import Foundation
import CoreData


extension Questions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Questions> {
        return NSFetchRequest<Questions>(entityName: "Questions");
    }

    @NSManaged public var category: String?
    @NSManaged public var content: String?
    @NSManaged public var firstAnswer: String?
    @NSManaged public var secondAnswer: String?
    @NSManaged public var thirdAnswer: String?
    @NSManaged public var categories: Categories?

}
