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
        let expensesRef = rootRef.child("expenses")
        print(rootRef.key)   // prints: ""
        print(childRef.key)  // prints: "grocery-items"
        print(itemsRef.key)  // prints: "grocery-items"
        print(milkRef.key)   // prints: "milk"
        
        //saving data to firebase database:
        //get the text field value.
        let moneySpentValue = spentMoney.text
        //add a new child node to firebase database (must be unwrapped by !):
        let currentExpensesNode = expensesRef.child(moneySpentValue!)
        //add the value to the node:
        currentExpensesNode.setValue(moneySpentValue)
        
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

