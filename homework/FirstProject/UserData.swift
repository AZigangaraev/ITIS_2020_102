//
//  UserData.swift
//  FirstProject
//
//  Created by Svetlana Safonova on 20.09.2020.
//  Copyright © 2020 Svetlana Safonova. All rights reserved.
//

import Foundation

 

   

class Users {
    
       let defaults = UserDefaults.standard
      var users: [String:String] = ["admin" : "password"]
      
    
    func create() {
        defaults.set(users, forKey: "users")
    }
    
    func getUsers() -> [String:String]? {
        defaults.object(forKey: "users") as? [String:String]
    }
    
    
    func addUser(username: String, password: String)
    {
        var dict: [String:String] = defaults.object(forKey: "users") as? [String: String]  ?? [:]
        dict[username] = password
        defaults.set(dict, forKey: "users")
        
    }
    
    func doesExist(username: String, password: String) -> Bool
    {
        var exist: Bool = false
        let dictionary = defaults.object(forKey: "users") as? [String:String]
        for user in dictionary!.keys {
            if username == user {
                if dictionary![username] == password {
                    exist = true
                }
            }
        }
        return exist
    }
}
