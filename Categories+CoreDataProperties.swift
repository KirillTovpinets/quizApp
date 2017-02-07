//
//  Categories+CoreDataProperties.swift
//  quizApp
//
//  Created by Кірыла on 03.01.17.
//  Copyright © 2017 Кірыла. All rights reserved.
//

import Foundation
import CoreData


extension Categories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Categories> {
        return NSFetchRequest<Categories>(entityName: "Categories");
    }

    @NSManaged public var category: String?
    @NSManaged public var question: NSSet?

}

// MARK: Generated accessors for question
extension Categories {

    @objc(addQuestionObject:)
    @NSManaged public func addToQuestion(_ value: Questions)

    @objc(removeQuestionObject:)
    @NSManaged public func removeFromQuestion(_ value: Questions)

    @objc(addQuestion:)
    @NSManaged public func addToQuestion(_ values: NSSet)

    @objc(removeQuestion:)
    @NSManaged public func removeFromQuestion(_ values: NSSet)

}
