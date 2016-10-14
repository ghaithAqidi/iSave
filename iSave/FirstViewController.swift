//
//  FirstViewController.swift
//  iSave
//
//  Created by Ghaith Ali on 10/10/2016.
//  Copyright © 2016 Ghaith Ali. All rights reserved.
//

import UIKit
import Firebase

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var spentMoney: UITextField!
    
    @IBOutlet weak var expenseType: UIPickerView!
    
    //initializing the picker data (the wheel button)
    var pickerDataSource = ["Others", "Benzin", "Groceries", "Bills", "Entertainments"];
    var selectedExpenseValue:String = "Others"


    @IBAction func addToExpenses(_ sender: AnyObject) {
        let rootRef = FIRDatabase.database().reference()
        //testing that the database works:
//        let childRef = FIRDatabase.database().reference(withPath: "grocery-items")
//        let itemsRef = rootRef.child("grocery-items")
//        let milkRef = itemsRef.child("milk")
//        let expensesRef = rootRef.child("expenses")
//        print(rootRef.key)   // prints: ""
//        print(childRef.key)  // prints: "grocery-items"
//        print(itemsRef.key)  // prints: "grocery-items"
//        print(milkRef.key)   // prints: "milk"
        
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

        
        //add a new child node to firebase database root with name from the wheel:
        let selectedExpenseValueRef = rootRef.child(selectedExpenseValue)
        //add a new child to the selectedExpenseValueRef with current time as name
        let currentExpensesNode = selectedExpenseValueRef.child(dateString)
        
        //let expense = currentExpensesNode.child(selectedExpenseValue)
        //add the value to the node:

        currentExpensesNode.setValue(moneySpentValue)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.expenseType.dataSource = self;
        self.expenseType.delegate = self;
        //added spentMoney to delegate so that i can use the textFieldShouldReturn function
        //this function is used to remove the keyboard if i press enter.
        self.spentMoney.delegate = self;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
    
    //the listener to when changing the picker button.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row == 0)
        {
            self.view.backgroundColor = UIColor.white;
            //extract the current selected Value.
            selectedExpenseValue = pickerDataSource[pickerView.selectedRow(inComponent: 0)]
        }
        else if(row == 1)
        {
            selectedExpenseValue = pickerDataSource[pickerView.selectedRow(inComponent: 0)]
        }
        else if(row == 2)
        {
            selectedExpenseValue = pickerDataSource[pickerView.selectedRow(inComponent: 0)]
        }
        else
        {
            selectedExpenseValue = pickerDataSource[pickerView.selectedRow(inComponent: 0)]
        }
    }


}

