//
//  ScoreBoardViewController.swift
//  memoryTheGame
//
//  Created by ViTo on 02/04/2020.
//  Copyright © 2020 ViTo. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ScoreBoardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var managedObjectContext: NSManagedObjectContext!
    var score = [NSManagedObject]()
    var stats: [(String, Int64)] = []
    @IBOutlet weak var tableViewScore: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewScore.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewScore")
        if let myDelegate = UIApplication.shared.delegate as? AppDelegate {
           stats = myDelegate.getScores()
        }
        
        tableViewScore.dataSource = self
        tableViewScore.delegate = self
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewScore", for: indexPath)
        
        cell.textLabel?.text = "Name: " + stats[indexPath.row].0 + ", Score: " + String(stats[indexPath.row].1)
        
        return cell
    }
}
