//
//  LocationViewController.swift
//  BLAK
//
//  Created by Jeff Bond on 4/22/21.
//

import UIKit
import Parse

class LocationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Cell"
        
        return cell 
        }
    
    @IBAction func logOutBTN(_ sender: Any) {
        PFUser.logOutInBackground{ (error) in
            if error != nil{
                self.presentAlert(title:"LogIn Error", message: error!.localizedDescription)
                print("error in login")
            }
            else {
                
            }
        }
    }
    func presentAlert(title:String,message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okBTN = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okBTN)
        self.present(alert,animated: true,completion: nil)
    }
    
    
    
    @IBAction func addBTN(_ sender: Any) {
    }
}
