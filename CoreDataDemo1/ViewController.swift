//
//  ViewController.swift
//  CoreDataDemo1
//
//  Created by Shinkangsan on 12/29/16.
//  Copyright © 2016 Sheldon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        CoreDataManager.storeObj(name: "image001", by: "sheldon", year: "2010")
//        CoreDataManager.storeObj(name: "image002", by: "xiaodan", year: "2011")
//        CoreDataManager.storeObj(name: "image003", by: "wang", year: "2012")
//        CoreDataManager.storeObj(name: "image004", by: "god", year: "2013")
//        CoreDataManager.storeObj(name: "image005", by: "what", year: "2014")
        
        
        CoreDataManager.fetchObj()
        CoreDataManager.cleanCoreData()
        CoreDataManager.fetchObj()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

