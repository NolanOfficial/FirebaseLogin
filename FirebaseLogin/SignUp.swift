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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accountCreated.isHidden = true
    }
    
    //Signing Up
    @IBAction func createAccount(_ sender: Any) {
        print("Creating Account")
        Auth.auth().createUser(withEmail: emailSignUp.text!, password: passwordSignUp.text!) { (user, error) in
            if let u = user {
                print("Account Created")
                self.accountCreated.isHidden = false
            } else {
                print("Error Creating Account")
        print(error!.localizedDescription)
            }
           
        }
        
    }
    

    
    
    
    
    
    
}
