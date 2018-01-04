//
//  ViewController.swift
//  RomItems
//
//  Created by John on 1/4/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    var romItems : [Rom] = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    
    }

    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
        
            romItems = try context.fetch(Rom.fetchRequest())
        } catch {
            
        }
    }
    
}
