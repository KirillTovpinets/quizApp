//
//  SecondViewController.swift
//  quizApp
//
//  Created by Кірыла on 29.12.16.
//  Copyright © 2016 Кірыла. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{

    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var Result: UILabel!
    
    @IBOutlet weak var imageResult: UIImageView!
    
    public var numberOfQuestions: Int = 0
    public var numberOfCorrectAns: Int = 0
    public var resultReport: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLbl.text = "Ваш результат: \(numberOfCorrectAns) правильных ответов из \(numberOfQuestions)"
        Result.text = resultReport!
        
        if Result.text == "Success"{
            Result.textColor = UIColor.green
            imageResult.image = #imageLiteral(resourceName: "Success")
        }else{
            Result.textColor = UIColor.red
            imageResult.image = #imageLiteral(resourceName: "Fail")
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
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
