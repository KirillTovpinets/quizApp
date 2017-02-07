//
//  Progress+CoreDataProperties.swift
//  quizApp
//
//  Created by Кірыла on 01.01.17.
//  Copyright © 2017 Кірыла. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Progress {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Progress> {
        return NSFetchRequest<Progress>(entityName: "Progress");
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var correctAns: Int32
    @NSManaged public var totalQuest: Int32
    @NSManaged public var user: Users?

}
