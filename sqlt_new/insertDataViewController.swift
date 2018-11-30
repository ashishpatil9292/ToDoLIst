//
//  insertDataViewController.swift
//  sqlt_new
//
//  Created by Student016 on 08/10/18.
//  Copyright © 2018 mahesh. All rights reserved.
//

import UIKit

class insertDataViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var empid: UITextField!
    
    @IBAction func ok(_ sender: Any)
    {
  

        let insertQuery = "insert into demo1(empId,empName) values ('\(empid.text!)','\(empName.text!)')"
        print(insertQuery)
        let success = dbwrapper.shareObj.execute_querty(query: insertQuery)
        if(success)
        {
          print("insert:success")
            self.navigationController?.popViewController(animated: true)
            
        }
         
        else
        {
            print("insert:unsuccess")
        }
    }
    @IBOutlet weak var empName: UITextField!
    
 

}
