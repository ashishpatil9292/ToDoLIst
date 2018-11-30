
//
//  dbwrapper.swift
//  sqlt_new
//
//  Created by Student016 on 08/10/18.
//  Copyright © 2018 mahesh. All rights reserved.
//

import UIKit
import SQLite3
class dbwrapper: NSObject
{
    static let shareObj = dbwrapper()
    
    var db:OpaquePointer? = nil
    var stmt:OpaquePointer? = nil
    
    func filePath () -> String
    {
        let arrayDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = arrayDirectory.first! + "/demo1"
        
        return path
    }
    func execute_querty(query:String) -> Bool
    {
        var success = false
        let path = filePath()
        if(sqlite3_open(path, &db)==SQLITE_OK)
        {
            if(sqlite3_prepare_v2(db, query, -1, &stmt, nil)==SQLITE_OK)
            {
                if(sqlite3_step(stmt)==SQLITE_DONE)
                {
                    success = true
                    sqlite3_close(db)
                    sqlite3_finalize(stmt)
                    
                }
                else
                {
                    print("step error:\(sqlite3_errmsg(db)) ")
                }
            }
            else
            {
                print("prepare v2 error:\(sqlite3_errmsg(db)) ")
            }
        }
        else
        {
            print("open error:\(sqlite3_errmsg(db)) ")
        }
    
        return success
    }
    
    func create_table()
    {
        let create_query = "create table if not exists demo1(empId text primery key,empName text)"
       let ISsuccess = execute_querty(query: create_query)
       if(ISsuccess)
       {
            print("create table successfully")
        
        }
        else
       {
        print("query failed")
        }
    }
    
    func alltaskQuery(query:String) -> ([String],[String])
    {
        var enameArray = [String]()
         var eidArray = [String]()
        
        let path = filePath()
        if(sqlite3_open(path, &db)==SQLITE_OK)
        {
            if(sqlite3_prepare_v2(db, query, -1, &stmt, nil)==SQLITE_OK)
            {
               while(sqlite3_step(stmt)==SQLITE_ROW)
                {
                     let eid = sqlite3_column_text(stmt, 0)
                  let eidstr = String(cString: eid!)
                  eidArray.append(eidstr)
                    
        
                  
                    let ename = sqlite3_column_text(stmt, 1)
                    let nameStr = String(cString: ename!)
                    enameArray.append(nameStr)
                    
                    

                }
               
            }
            else
            {
                print("prepare v2 errot:\(sqlite3_errmsg(db)) ")
            }
        }
        else
        {
            print("open error:\(sqlite3_errmsg(db)) ")
        }
        return (eidArray, enameArray);
    }
    
}
