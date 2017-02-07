//
//  PracticeViewController.swift
//  quizApp
//
//  Created by Кірыла on 03.01.17.
//  Copyright © 2017 Кірыла. All rights reserved.
//

import UIKit
import CoreData

class PracticeViewController: UIViewController {
    
    var correctAns: Int = 0
    var AnsweredQuestions: [Int] = []
    
    var questions:[String] = []
    var answers:[[String]] = []
    
    public var category: String = ""
    //Veriables
    var rightAnswerPlace: UInt32 = 0

    //UI
    @IBOutlet weak var question: UITextView!
    @IBAction func answer(_ sender: UIButton) {
        
        if sender.tag == Int(rightAnswerPlace){
            correctAns += 1
        }
        
        if AnsweredQuestions.count != questions.count{
            newQuestion()
        }else{
            for i in 0..<AnsweredQuestions.count{
                AnsweredQuestions[i] = -1
            }
            let context = CoreDataManager.instance.persistentContainer.viewContext
            let entityDescription = NSEntityDescription.entity(forEntityName: "Progress", in: context)
            
            let progress = Progress(entity: entityDescription!, insertInto: context)
            
            progress.category = category
            progress.correctAns = Int32(correctAns)
            progress.date = NSDate()
            progress.totalQuest = Int32(questions.count)
            
            CoreDataManager.instance.saveContext()
            
            performSegue(withIdentifier: "ShowScore", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowScore"{
            let destination = segue.destination as! SecondViewController
            destination.numberOfQuestions = questions.count
            destination.numberOfCorrectAns = correctAns
            if correctAns < questions.count{
                destination.resultReport = "Faild"
            }else{
                destination.resultReport = "Success"
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        question.text = ""
        var button: UIButton = UIButton()
        
        for i in 1...3{
            button = view.viewWithTag(i) as! UIButton
            button.setTitle("", for: .normal)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let context = CoreDataManager.instance.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Questions")
        
        do{
            let results = try context.fetch(fetchRequest)
            var numQuestions = 0
            var repeated = false
            
            for result in results as! [Questions]{
                
                if result.content == nil{
                    context.delete(result)
                    CoreDataManager.instance.saveContext()
                }
                if result.category != category{
                    continue
                }
                if questions.contains(result.content!){
                    repeated = true
                }
                if repeated{
                    repeated = false
                    continue
                }
                questions.append(result.content!)
                answers.append([])
                answers[numQuestions].append(result.firstAnswer!)
                answers[numQuestions].append(result.secondAnswer!)
                answers[numQuestions].append(result.thirdAnswer!)
                numQuestions += 1
            }
            CoreDataManager.instance.saveContext()
        }catch{
            print(error)
        }
        if questions.count != 0{
            newQuestion()
        }else{
            let alert: UIAlertController = UIAlertController(title: "Внимание", message: "Вопросов по этой категории нет", preferredStyle: .alert)
            
            let okButton: UIAlertAction = UIAlertAction(title: "Ок", style: .default, handler: nil)
            
            alert.addAction(okButton)
            present(alert, animated: true, completion: {
                () -> Void in
                let getCategories = NSFetchRequest<NSFetchRequestResult>(entityName: "Categories")
                
                do{
                    let results = try context.fetch(getCategories)
                    for result in results as! [Categories]{
                        if result.category == self.category{
                            context.delete(result)
                            CoreDataManager.instance.saveContext()
                            break
                        }
                    }
                }catch{
                    print(error)
                }
                
                let backController: ChooseCategoryViewController = ChooseCategoryViewController()
                self.present(backController, animated: true, completion: nil)
            })
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //New Question
    func newQuestion(){
        
        var currentQuestion:UInt32 = arc4random_uniform(UInt32(questions.count))
        
        while AnsweredQuestions.contains(Int(currentQuestion)) {
            currentQuestion = arc4random_uniform(UInt32(questions.count))
        }
        AnsweredQuestions.append(Int(currentQuestion))
        question.text = questions[Int(currentQuestion)]
        rightAnswerPlace = arc4random_uniform(3) + 1
        
        //Create a button
        var button: UIButton = UIButton()
        
        var x = 1
        
        for i in 1...3{
            //Create a button
            button = view.viewWithTag(i) as! UIButton
            
            if i == Int(rightAnswerPlace){
                button.setTitle(answers[Int(currentQuestion)][0], for: .normal)
            }else{
                button.setTitle(answers[Int(currentQuestion)][x], for: .normal)
                x = 2
            }
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
