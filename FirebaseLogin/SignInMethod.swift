//
//  SignInMethod.swift
//  FirebaseLogin
//
//  Created by Nolan Fuchs on 9/24/18.
//  Copyright © 2018 Nolan Fuchs. All rights reserved.
//

import Foundation
import UIKit
import Firebase



class SingInMethod: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
            print("Attempting to Sign In...")
        }
    }
    
    
  
    

    
    
    
}
