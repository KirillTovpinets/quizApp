//
//  ShowRateViewController.swift
//  quizApp
//
//  Created by Кірыла on 07.01.17.
//  Copyright © 2017 Кірыла. All rights reserved.
//

import UIKit
import CoreData
class ShowRateViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let categories = ["Правильные ответы","Дата", "Категория", "Всего вопросов"]
    var ratingStorage: [Progress] = [Progress]()
    @IBOutlet weak var RatingList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let context = CoreDataManager.instance.persistentContainer.viewContext
        
        let getProgress = NSFetchRequest<NSFetchRequestResult>(entityName: "Progress")
        
        do{
            let results = try context.fetch(getProgress)
            
            for result in results as! [Progress]{
                ratingStorage.append(result)
            }
        }catch{
            print(error)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCategoryRating"{
            let vc = segue.destination as! CategoryRateViewController
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "", sender: <#T##Any?#>)
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
