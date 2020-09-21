

import UIKit

var users = [
    "admin": "admin"
]

class ViewController: UIViewController {

//    все вьюшки
    let loginView = Login.instanceFromNib() as! Login
    let signUp = SignUp.instanceFromNib() as! SignUp
    let status = Status.instanceFromNib() as! Status
    
//    bool для определения статусов для views
    static var login:Bool = true
    static var loginStatus: Bool?
    
    
    override func viewDidLoad() {
        loginView.control1 = self
        signUp.control1 = self
        ViewController.loginStatus = nil
        
        refresh()
        
        super.viewDidLoad()
        
    }
    

//    обновить вьюшки
    func refresh(){
         if(ViewController.login){
             if(ViewController.loginStatus == nil){
                 status.backgroundColor = UIColor.gray
                 status.text.text = "Need to sign in to continue"
             } else {
                 if(ViewController.loginStatus!){
                     status.backgroundColor = UIColor.green
                     status.text.text = "Sign in successful"
                 } else {
                     status.backgroundColor = UIColor.red
                     status.text.text = "Sign in failed"
                 }
             }
             self.view.addSubview(loginView)
             self.view.addSubview(status)
             
             
         } else {
             self.view.addSubview(signUp)
         }
    }


    
}

