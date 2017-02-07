//
//  AddNewQuestionViewController.swift
//  quizApp
//
//  Created by Кірыла on 04.01.17.
//  Copyright © 2017 Кірыла. All rights reserved.
//

import UIKit
class AddNewQuestionViewController: UIViewController {
    @IBOutlet weak var newQuestion: UITextField!

    @IBOutlet weak var category: UITextField!
    @IBOutlet weak var thirdAns: UITextField!
    @IBOutlet weak var secondAns: UITextField!
    @IBOutlet weak var firstAns: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func displayAlert(massage: String){
        let alert: UIAlertController = UIAlertController(title: "Сообщение", message: massage, preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "Ок", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    func clearTextfield(){
        newQuestion.text = ""
        firstAns.text = ""
        secondAns.text = ""
        thirdAns.text = ""
        category.text = ""
    }
    @IBAction func AddNewQuestion(_ sender: UIButton) {
        if let question = newQuestion.text{
            if let ansOne = firstAns.text{
                if let ansTwo = secondAns.text{
                    if let ansThree = thirdAns.text{
                        if let categ = category.text{
                            AddQuestions.Add(content: question, first: ansOne, second: ansTwo, third: ansThree, category: categ)
                            displayAlert(massage: "Новый вопрос добавлен")
                            clearTextfield()
                        }else{
                            displayAlert(massage: "Вы не ввели категорию")
                        }
                    }else{
                        displayAlert(massage: "Вы не ввели третий вариант ответа")
                    }
                }else{
                    displayAlert(massage: "Вы не ввели второй вариант ответа")
                }
            }else{
                displayAlert(massage: "Вы не ввели правильный вариант ответа")
            }
        }else{
            displayAlert(massage: "Вы не ввели вопрос")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
