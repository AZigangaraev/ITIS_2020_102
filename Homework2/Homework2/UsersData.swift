//
//  UsersData.swift
//  Homework2
//
//  Created by Ruslan Khanov on 18.09.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import Foundation

class UsersData {
    static var users = UserDefaults.standard.object(forKey: "Users") as? [String : String] ?? [String : String]()
    static var usersArray = [String : String]()
    
    static func addUser(login: String, password: String) {
        usersArray[login] = password
        UserDefaults.standard.set(usersArray, forKey: "Users")
        users = UserDefaults.standard.object(forKey: "Users") as? [String : String] ?? [String : String]()
    }
    
    static func isUserExist(login: String, password: String) -> Bool {
        if let userPassword = users[login], userPassword == password {
            return true
        }
        return false
    }
}
