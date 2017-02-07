//
//  ChooseUserViewController.swift
//  quizApp
//
//  Created by Кірыла on 03.01.17.
//  Copyright © 2017 Кірыла. All rights reserved.
//

import UIKit
import CoreData

class ChooseUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var UserObjects: [User] = []
    
    @IBOutlet weak var UserList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let context = CoreDataManager.instance.persistentContainer.viewContext
        
        let readFromCD = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do{
            let results = try context.fetch(readFromCD)
            
            for result in results as! [Users]{
                UserObjects.append(User(fname: result.firstname!, sname: result.name!, pname: result.patername!, birthday: result.birthday!))
            }
        }catch{
            print(error)
        }

        title = "\"List of Users\""
        UserList.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "Start", sender: self)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserObjects.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel!.text = UserObjects[indexPath.row].firstname + " " + UserObjects[indexPath.row].secondname
        
        return cell
    }
    
    @IBAction func AddUser(_ sender: UIButton) {
        let alert = UIAlertController(title: "Новый пользователь", message: "Введите данные нового пользователя", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Сохранить", style: .default){
            (action: UIAlertAction!) -> Void in
            let firstname = alert.textFields![0]
            let secondname = alert.textFields![1]
            let patername = alert.textFields![2]
            self.UserObjects.append(User(fname: firstname.text!, sname: secondname.text!, pname: patername.text!, birthday: NSDate()))
            
            let context = CoreDataManager.instance.persistentContainer.viewContext
            
            let entityDescription = NSEntityDescription.entity(forEntityName: "Users", in: context)
            
            let CDUsers = Users(entity: entityDescription!, insertInto: context)
            
            CDUsers.firstname = firstname.text!
            CDUsers.name = secondname.text!
            CDUsers.patername = patername.text!
            CDUsers.birthday = NSDate()
            
            CoreDataManager.instance.saveContext()
            self.UserList.reloadData()
            
            self.performSegue(withIdentifier: "Start", sender: self)
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addTextField(configurationHandler: {(textField: UITextField) -> Void in textField.placeholder = "Фамилия"})
        alert.addTextField(configurationHandler: {(textField: UITextField) -> Void in textField.placeholder = "Имя"})
        alert.addTextField(configurationHandler: {(textField: UITextField) -> Void in textField.placeholder = "Отчество"})
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
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
