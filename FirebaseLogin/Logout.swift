//
//  Logout.swift
//  FirebaseLogin
//
//  Created by Nolan Fuchs on 9/26/18.
//  Copyright © 2018 Nolan Fuchs. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth




class Logout: UIViewController {
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
   
    
    @IBAction func logoutFunction(_ sender: UIButton) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
    }
    
  
    
}
