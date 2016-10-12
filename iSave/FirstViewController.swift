//
//  FirstViewController.swift
//  iSave
//
//  Created by Ghaith Ali on 10/10/2016.
//  Copyright © 2016 Ghaith Ali. All rights reserved.
//

import UIKit
import Firebase

class FirstViewController: UIViewController {

    @IBOutlet weak var spentMoney: UITextField!
    
    @IBAction func addToExpenses(_ sender: AnyObject) {
        let rootRef = FIRDatabase.database().reference()
        //testing that the database works:
        let childRef = FIRDatabase.database().reference(withPath: "grocery-items")
        let itemsRef = rootRef.child("grocery-items")
        let milkRef = itemsRef.child("milk")
        print(rootRef.key)   // prints: ""
        print(childRef.key)  // prints: "grocery-items"
        print(itemsRef.key)  // prints: "grocery-items"
        print(milkRef.key)   // prints: "milk"
        
        //saving data to firebase database:
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }


}

