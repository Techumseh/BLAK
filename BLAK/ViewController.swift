//
//  ViewController.swift
//  BLAK
//
//  Created by Jeff Bond on 4/21/21.
//

import UIKit
import Parse

class ViewController: UIViewController {

   
    @IBOutlet weak var usernameTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    @IBAction func loginClicked(_ sender: Any) {
        if usernameTxt.text != "" && passwordTxt.text != ""
        {
            PFUser.logInWithUsername(inBackground: usernameTxt.text!, password: passwordTxt.text!) { (user, error) in 
                if error != nil{
                    self.presentAlert(title: "Login Error", message:error!.localizedDescription)
                    print("Login error")                }
                self.performSegue(withIdentifier: "toLocationVC", sender: nil)            }
        }
        else {
            presentAlert(title: "Both Username and Password are required", message: "Both Username and Password are required")        }
    }
     
    @IBAction func signUpClicked(_ sender: Any) {
    if usernameTxt.text != "" && passwordTxt.text != ""
        {
            let user = PFUser()
            user.username = usernameTxt.text!
            user.password = passwordTxt.text!
            user.email = usernameTxt.text!
            
            user.signUpInBackground{ (success, error) in
                if error != nil{
                    self.presentAlert(title: "SignUp Error", message:error!.localizedDescription)
                    print("signup error")
                }
                else
                {
                    print("User Signup")
                    self.performSegue(withIdentifier: "toLocationVC", sender: nil)                 }
            }
        }
            else {
                presentAlert(title: "Both Username and Password are required", message: "Both Username and Password are required")
        }
    }
    func presentAlert(title:String,message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okBTN = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okBTN)
        self.present(alert,animated: true,completion: nil)
    }
    
}

