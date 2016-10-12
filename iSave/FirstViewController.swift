//
//  FirstViewController.swift
//  iSave
//
//  Created by Ghaith Ali on 10/10/2016.
//  Copyright © 2016 Ghaith Ali. All rights reserved.
//

import UIKit
import Firebase

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var spentMoney: UITextField!
    
    @IBOutlet weak var expenseType: UIPickerView!
    
    //initializing the picker data (the wheel button)
    var pickerDataSource = ["Benzin", "Every Day", "Payments", "Others"];


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
        
        //get the current date:
        //make NSDate object with current date.
        let date = NSDate()
        //toString
        let fullDateString = date.description
        // get index of 9 from the fullDateString and substring to get only date without hours.
        let index = fullDateString.index(fullDateString.startIndex, offsetBy: 19)
        let dateString = date.description.substring(to: index)

        
        //add a new child node to firebase database (must be unwrapped by !):
        let currentExpensesNode = expensesRef.child(dateString)
        //add the value to the node:
        currentExpensesNode.setValue(moneySpentValue)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.expenseType.dataSource = self;
        self.expenseType.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    //implemented methods from the UIPickerViewDataSource protocol:
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }


}

