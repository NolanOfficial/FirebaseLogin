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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Signing Up
    @IBAction func createAccount(_ sender: Any) {
        print("Creating Account")
        Auth.auth().createUser(withEmail: emailSignUp.text!, password: passwordSignUp.text!) { (authResult, error) in
            print("Account Created")
            guard let user = authResult?.user else { return }
        }
        
    }
    

    
    
    
    
    
    
}
