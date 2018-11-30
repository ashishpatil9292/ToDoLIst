//
//  NextViewController.swift
//  sqlt_new
//
//  Created by Studenrrt-006 on 11/10/18.
//  Copyright © 2018 mahesh. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
   var empId:String!
   var empName:String!
    override func viewDidLoad()
    {
        super.viewDidLoad()
      print("empIdn= \(empId) and empNanme = \(empName)")
      eid.text = empId
      ename.text = empName
      

     
    }
   @IBOutlet weak var eid: UITextField!
   
  
   @IBAction func deleteData(_ sender: Any)
   {
    let deleteQuery = "delete from demo1 where empId = '\(eid.text!)'";
     let success = dbwrapper.shareObj.execute_querty(query: deleteQuery)
      if(success)
      {
         print("delete:Success")
        self.navigationController?.popViewController(animated: true)
      }
      else

         {
            print("delete:failed")
         }
   }
   
   @IBAction func Update(_ sender: Any)
   {
      let updateQuery = "update demo1 set  empName = '\(ename.text!)' where empId = '\(eid.text!)'"
      let success = dbwrapper.shareObj.execute_querty(query: updateQuery)
      
      if(success)
      {
         print("update:success")
        self.navigationController?.popViewController(animated: true)
      }
      else
      {
         print("update:faild")
      }
      
      
   }
   @IBOutlet weak var ename: UITextField!
   override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
