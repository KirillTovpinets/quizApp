//
//  AddQuestions.swift
//  quizApp
//
//  Created by Кірыла on 04.01.17.
//  Copyright © 2017 Кірыла. All rights reserved.
//

import CoreData
import Foundation

class AddQuestions{
    static func Add(content: String, first: String, second: String, third: String, category: String) -> Void{
        let context = CoreDataManager.instance.persistentContainer.viewContext
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Questions", in: context)
        
        let question = Questions(entity: entityDescription!, insertInto: context)
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Categories")
        var alreadyExist = false
        
        do{
            let results = try context.fetch(fetch)
            for result in results as! [Categories]{
                if result.category == category{
                    alreadyExist = true
                    break
                }
            }
            if !alreadyExist{
                let newCategory = Categories(entity: entityDescription!, insertInto: context)
                newCategory.category = category
                CoreDataManager.instance.saveContext()
            }
        }catch{
            print(error)
        }
        question.content = content
        question.firstAnswer = first
        question.secondAnswer = second
        question.thirdAnswer = third
        question.category = category
        
        CoreDataManager.instance.saveContext()
        
    }
}
