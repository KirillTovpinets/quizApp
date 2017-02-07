//
//  User.swift
//  quizApp
//
//  Created by Кірыла on 03.01.17.
//  Copyright © 2017 Кірыла. All rights reserved.
//

import Foundation

class User{
    var firstname: String
    var secondname: String
    var patername: String
    var birthday: NSDate
    
    init(fname: String, sname: String, pname: String, birthday: NSDate){
        self.firstname = fname
        self.secondname = sname
        self.patername = pname
        self.birthday = birthday
    }
}
