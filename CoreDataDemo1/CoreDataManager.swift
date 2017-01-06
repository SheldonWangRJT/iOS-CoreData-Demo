//
//  CoreDataManager.swift
//  CoreDataDemo1
//
//  Created by Shinkangsan on 12/29/16.
//  Copyright © 2016 Sheldon. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    ///store obj into core data
    class func storeObj(name:String,by:String,year:String) {
        let context = getContext()
        
        let entity = NSEntityDescription.entity(forEntityName: "ImageEntity", in: context)
        
        let managedObj = NSManagedObject(entity: entity!, insertInto: context)
        
        managedObj.setValue(name, forKey: "name")
        managedObj.setValue(by, forKey: "by")
        managedObj.setValue(year, forKey: "year")
        
        do {
            try context.save()
            print("saved!")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    ///fetch all the objects from core data
    class func fetchObj() -> [imageItem]{
        var aray = [imageItem]()
        
        let fetchRequest:NSFetchRequest<ImageEntity> = ImageEntity.fetchRequest()
        
//        var predicate = NSPredicate(format: "name contains[c] %@", "001")
//        predicate = NSPredicate(format: "by == %@" , "wang")
//        predicate = NSPredicate(format: "year > %@", "2012")
//        
//        fetchRequest.predicate = predicate
        
        do {
            let fetchResult = try getContext().fetch(fetchRequest)
            
            for item in fetchResult {
                let img = imageItem(name: item.name!, year: item.year!, by: item.by!)
                aray.append(img)
                print("image name:"+img.imageName!+"\nimage year:"+img.imageYear!+"\nimage by:"+img.imageBy!+"\n")
            }
        }catch {
            print(error.localizedDescription)
        }
        
        return aray
    }

    ///delete all the data in core data
    class func cleanCoreData() {
        
        let fetchRequest:NSFetchRequest<ImageEntity> = ImageEntity.fetchRequest()
        
        var predicate = NSPredicate(format: "name contains[c] %@", "001")
        fetchRequest.predicate = predicate
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
        
        do {
            print("deleting all contents")
            try getContext().execute(deleteRequest)
        }catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    
}

struct imageItem {
    var imageName:String?
    var imageYear:String?
    var imageBy:String?
    
    init() {
        imageName = ""
        imageYear = ""
        imageBy = ""
    }
    
    init(name:String,year:String,by:String) {
        self.imageName = name
        self.imageYear = year
        self.imageBy = by
    }
    
}

