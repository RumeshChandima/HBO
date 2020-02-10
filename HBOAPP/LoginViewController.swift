//
//  LoginViewController.swift
//  HBOAPP
//
//  Created by Geeth Rangana on 2/1/20.
//  Copyright © 2020 link. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnSignIn(_ sender: Any) {
        
        //let alert = AlertDialog();
        
        Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!) { (user, error) in
            if error != nil {
                
                self.showAlert(title: "Error occured", message: "You have error with your mail and password")
            }
            else if user != nil {
                
                self.showAlert(title: "Signed in successfuly", message: "You have been successfully Signed In")
                
                let vc = UIStoryboard(name:"Main",bundle: nil).instantiateViewController(withIdentifier: "Home")
                self.present(vc,animated: true,completion: nil)
                
            }
        }
    }
    func showAlert(title: String, message: String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
        
    }

}
