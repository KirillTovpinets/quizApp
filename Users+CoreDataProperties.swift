//
//  Users+CoreDataProperties.swift
//  quizApp
//
//  Created by Кірыла on 01.01.17.
//  Copyright © 2017 Кірыла. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users");
    }

    @NSManaged public var firstname: String?
    @NSManaged public var name: String?
    @NSManaged public var patername: String?
    @NSManaged public var birthday: NSDate?
    @NSManaged public var progress: NSSet?

}

// MARK: Generated accessors for progress
extension Users {

    @objc(addProgressObject:)
    @NSManaged public func addToProgress(_ value: Progress)

    @objc(removeProgressObject:)
    @NSManaged public func removeFromProgress(_ value: Progress)

    @objc(addProgress:)
    @NSManaged public func addToProgress(_ values: NSSet)

    @objc(removeProgress:)
    @NSManaged public func removeFromProgress(_ values: NSSet)

}
