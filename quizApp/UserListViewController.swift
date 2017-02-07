//
//  UserListViewController.swift
//  quizApp
//
//  Created by Кірыла on 03.01.17.
//  Copyright © 2017 Кірыла. All rights reserved.
//

import UIKit
import CoreData

class UserListViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var UserList: UITableView!
    
    var UserListArray = [Users]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let context = CoreDataManager.instance.persistentContainer.viewContext
        
        let UserListCD = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do{
            let results = try context.fetch(UserListCD)
            
            for result in results as! [Users]{
                UserListArray.append(result)
            }
        }catch{
            print(error)
        }
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = UserListArray[indexPath.row].firstname! + " " + UserListArray[indexPath.row].name!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            
            let context = CoreDataManager.instance.persistentContainer.viewContext
            
            context.delete(UserListArray[indexPath.row])
            UserListArray.remove(at: indexPath.row)
            CoreDataManager.instance.saveContext()
            UserList.reloadData()
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
