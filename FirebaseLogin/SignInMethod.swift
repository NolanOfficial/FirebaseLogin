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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupForLogin()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailText.text = nil
        passwordText.text = nil
        setupForLogin()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // Login Function
    @IBAction func loginButton(_ sender: Any) {
        incorrectEP.isHidden = true
        activity.isHidden = false
        activity.startAnimating()
        textFieldShouldReturn()
        
        print("Attempting to Log In")
        Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
            if user != nil {
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
    
    // Go back to Home Screen
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
    }
    
    // Closes keyboard after editing
    func textFieldShouldReturn() {
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // Prepares screen for Login
    func setupForLogin() {
        incorrectEP.isHidden = true
        activity.isHidden = true
        activity.startAnimating()
        navigationController?.navigationBar.isHidden = true
    }    
}
