
import UIKit

class SignUp: UIView {
    
//    чтобы можно было обновлять viewController
    var control1: ViewController!
    
//    для привязки к .xib
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "SignUp", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    @IBOutlet weak var log: UITextField!
    @IBOutlet weak var pass1: UITextField!
    @IBOutlet weak var pass2: UITextField!

//    алгоритм регистрации
    @IBAction func signUp(_ sender: Any) {
        if(pass1 != nil){
            if(pass1.text == pass2.text){
            users[log.text!] = pass1.text!

            } else {
                print("Пароли не совпадают")
            }
        }
        
    }
    
//    переходим на окно логина
    @IBAction func signIn(_ sender: Any) {
        ViewController.login = true
        control1?.refresh()
    }
}
