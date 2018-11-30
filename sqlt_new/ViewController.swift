//
//  ViewController.swift
//  sqlt_new
//
//  Created by Student016 on 08/10/18.
//  Copyright © 2018 mahesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    fileprivate var nameArray = [String]()
   fileprivate var idArray = [String]()
   
    @IBAction func add(_ sender: UIBarButtonItem)
    {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "insertDataViewController") as! insertDataViewController
        self.navigationController?.pushViewController(next, animated: true)

    }

    @IBOutlet weak var table_view: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        
        dbwrapper.shareObj.create_table()
        let selectQuery = "select empId , empName from demo1"
      let result = dbwrapper.shareObj.alltaskQuery(query: selectQuery)
      
        idArray = result.0
        
      nameArray = result.1
      
        
        
        
    }
    override func viewWillAppear(_ animated: Bool)
    {
        let selectQuery = "select empId , empName from demo1"
       let result = dbwrapper.shareObj.alltaskQuery(query: selectQuery)
      idArray = result.0
      nameArray = result.1
      
        table_view.reloadData()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.textLabel?.text = idArray[indexPath.row]
      cell.detailTextLabel?.text = nameArray[indexPath.row]
        return cell
    }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
   {
         let next = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
     let cell = tableView.cellForRow(at: indexPath)
      next.empId = cell?.textLabel?.text
      next.empName = cell?.detailTextLabel?.text
      
         self.navigationController?.pushViewController(next, animated: true)
      
   }


}

