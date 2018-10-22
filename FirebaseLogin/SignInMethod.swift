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
    @IBOutlet weak var incorrectEP: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var littedGif: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incorrectEP.isHidden = true
        activity.isHidden = true
        navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        incorrectEP.isHidden = true
        activity.isHidden = false
        activity.startAnimating()
        
        print("Attempting to Log In")
        Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
            if let u = user {
            self.performSegue(withIdentifier: "goToHome", sender: self)
                print("Logged In")
                self.activity.stopAnimating()
                 self.activity.isHidden = true
            } else {
                self.incorrectEP.isHidden = false
               self.activity.stopAnimating()
                self.activity.isHidden = true
                print("Incorrect Email or Password")
                print(error!.localizedDescription)
            }
        }
    }
    
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
    }
    

    
    
    
}
