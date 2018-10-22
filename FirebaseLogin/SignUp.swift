//
//  SignUp.swift
//  FirebaseLogin
//
//  Created by Nolan Fuchs on 9/24/18.
//  Copyright © 2018 Nolan Fuchs. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class SignUp: UIViewController {

    // Username and Password TextFields
    @IBOutlet weak var emailSignUp: UITextField!
    @IBOutlet weak var passwordSignUp: UITextField!
    @IBOutlet weak var accountCreated: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accountCreated.isHidden = true
        activity.isHidden = true
    navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    //Signing Up
    @IBAction func createAccount(_ sender: Any) {
        activity.isHidden = false
        activity.startAnimating()
        accountCreated.isHidden = true
        print("Creating Account")
        Auth.auth().createUser(withEmail: emailSignUp.text!, password: passwordSignUp.text!) { (user, error) in
            if let u = user {
                self.activity.stopAnimating()
                self.activity.isHidden = true
                print("Account Created")
                self.accountCreated.isHidden = false
            } else {
                self.activity.stopAnimating()
                self.activity.isHidden = true
                print("Error Creating Account")
                self.accountCreated.isHidden = false
                self.accountCreated.text = "\(error!.localizedDescription)"
                self.accountCreated.textColor = .red
        print(error!.localizedDescription)
            }
           
        }
        
    }
    

    
    
    
    
    
    
}
