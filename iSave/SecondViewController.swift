//
//  SecondViewController.swift
//  iSave
//
//  Created by Ghaith Ali on 10/10/2016.
//  Copyright © 2016 Ghaith Ali. All rights reserved.
//

import UIKit
import Firebase

class SecondViewController: UIViewController {
    


    @IBOutlet weak var expensesTable: UITableView!
    
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
        let rootRef = FIRDatabase.database().reference()

    }


}

