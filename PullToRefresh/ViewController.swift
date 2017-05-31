//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Harish Yadav on 31/05/17.
//  Copyright © 2017 Harish Yadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let cellIdentifier = "PTRCellIdentifier"
    let favoritrAnimals = ["Cats","Dogs","Birds"]
    let newFavoriteAnimals = ["Elephents","Giraffes","Dinasource","Cats","Dogs"]
    var tableData = [String]()
    let refreshContorller = UIRefreshControl()
    
    
    var tableViewController = UITableViewController(style: .plain)
    override func viewDidLoad() {
        super.viewDidLoad()
        tableData = favoritrAnimals
        let tableView = tableViewController.tableView
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        tableView?.dataSource = self
        tableView?.delegate = self
        tableViewController.refreshControl = self.refreshContorller
        self.refreshContorller.addTarget(self, action: (#selector(ViewController.didRefreshList)), for: UIControlEvents.valueChanged)
        self.refreshContorller.backgroundColor = UIColor.red
        self.refreshContorller.attributedTitle = NSAttributedString(string: "Last Update on \(NSDate())")
        self.view.addSubview(tableView!)
        
        
    }
    func didRefreshList(){
    
        self.tableData = newFavoriteAnimals
        self.tableViewController.tableView.reloadData()
        self.refreshContorller.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        cell?.textLabel?.text = self.tableData[indexPath.row]
        return cell!
    }

}

