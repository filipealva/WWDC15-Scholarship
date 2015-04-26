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
    
    lazy var educationItems: [EducationItem] = {
        let pathToAboutMe = NSBundle.mainBundle().pathForResource("AboutMe", ofType: "plist")!
        let aboutMe = NSDictionary(contentsOfFile: pathToAboutMe) as! [String: AnyObject]
        let educationItems = aboutMe["educationItems"] as! [[String: AnyObject]]
        
        return map(educationItems, {EducationItem(dict: $0)})
    }()
    
    let projectCellIdentifier = "projectCell"
    let educationItemCellIdentifier = "educationItemCell"

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
        
        let educationItemNib = UINib(nibName: "EducationItemCell", bundle: NSBundle.mainBundle())
        tableView.registerNib(educationItemNib, forCellReuseIdentifier: educationItemCellIdentifier)
    }
    
    // MARK: - Actions
    
    @IBAction func closeAboutMe(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

extension AboutMeTableViewController: UITableViewDataSource {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return projects.count
        } else {
            return educationItems.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let projectCell = tableView.dequeueReusableCellWithIdentifier(projectCellIdentifier, forIndexPath: indexPath) as! ProjectTableViewCell
            projectCell.project = projects[indexPath.row]
            
            return projectCell
        } else {
            let educationItemCell = tableView.dequeueReusableCellWithIdentifier(educationItemCellIdentifier, forIndexPath: indexPath) as! EducationItemTableViewCell
            educationItemCell.educationItem = educationItems[indexPath.row]
            
            return educationItemCell
        }
    }
    
}

extension AboutMeTableViewController: UITableViewDelegate {
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = NSBundle.mainBundle().loadNibNamed("AboutMeSectionHeader", owner: self, options: nil)[0] as! UIView
        let sectionTitle = sectionHeader.viewWithTag(100) as! UILabel
        
        if section == 0 {
            sectionTitle.text = "Projects"
        } else {
            sectionTitle.text = "Education"
        }
        
        return sectionHeader
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: view.bounds.width, height: 1.0))
        footerView.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
        return footerView
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
}