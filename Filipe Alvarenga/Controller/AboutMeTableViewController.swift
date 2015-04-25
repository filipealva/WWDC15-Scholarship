//
//  AboutMeTableViewController.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 25/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import UIKit

class AboutMeTableViewController: UITableViewController {
    
    lazy var projects: [Project] = {
        let pathToAboutMe = NSBundle.mainBundle().pathForResource("AboutMe", ofType: "plist")!
        let aboutMe = NSDictionary(contentsOfFile: pathToAboutMe) as! [String: AnyObject]
        let projects = aboutMe["projects"] as! [[String: AnyObject]]
        
        return map(projects, {Project(dict: $0)})
    }()
    
    let projectCellIdentifier = "projectCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    // MARK: - Custom Configurations
    
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
    
        let projectNib = UINib(nibName: "ProjectCell", bundle: NSBundle.mainBundle())
        tableView.registerNib(projectNib, forCellReuseIdentifier: projectCellIdentifier)
    }
    
    // MARK: - Actions
    
    @IBAction func closeAboutMe(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

extension AboutMeTableViewController: UITableViewDataSource {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let projectCell = tableView.dequeueReusableCellWithIdentifier(projectCellIdentifier, forIndexPath: indexPath) as! ProjectTableViewCell
        projectCell.project = projects[indexPath.row]
        
        return projectCell
    }
    
}