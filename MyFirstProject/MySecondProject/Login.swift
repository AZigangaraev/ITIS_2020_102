

import UIKit

class Login: UIView {

    //    чтобы можно было обновлять viewController
    var control1 : ViewController!
    
    //    для привязки к .xib
     static func instanceFromNib() -> UIView {
        return UINib(nibName: "Login", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    
    @IBOutlet weak var log: UITextField!
    @IBOutlet weak var pass: UITextField!
    
   
//    алгоритм логина
    @IBAction func logIn(_ sender: Any) {
        if(log.text != nil) && (users[log.text!] != nil)&&(users[log.text!] == pass.text){
            ViewController.loginStatus = true;
        }
        if(users[log.text!] != pass.text){
            ViewController.loginStatus = false
        }
        control1?.refresh()
        
    }
    
//    меняем вьюшку на регистрацию
    @IBAction func signUp(_ sender: Any) {
        ViewController.login = false
        control1?.refresh()
    }
}
