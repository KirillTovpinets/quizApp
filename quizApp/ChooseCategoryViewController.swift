//
//  ChooseCategoryViewController.swift
//  quizApp
//
//  Created by Кірыла on 03.01.17.
//  Copyright © 2017 Кірыла. All rights reserved.
//

import UIKit
import CoreData

class ChooseCategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var categories = [Categories]()
    var choosenCategory: Int = 0
    
    @IBOutlet weak var CategoryList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let context = CoreDataManager.instance.persistentContainer.viewContext
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Categories")
        
        do{
            let results = try context.fetch(fetch)
            
            for result in results as! [Categories]{
                categories.append(result)
            }
        }catch{
            print(error)
        }
        
    }
    
    
    //DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = categories[indexPath.row].category
        return cell
    }
    
    //dataDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenCategory = indexPath.row
        performSegue(withIdentifier: "Start", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Start"{
            let practiceVC = segue.destination as! PracticeViewController
            let indexOfCategory = IndexPath(row: choosenCategory, section: 0)
            
            practiceVC.category = (CategoryList.cellForRow(at: indexOfCategory)?.textLabel?.text)!
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
