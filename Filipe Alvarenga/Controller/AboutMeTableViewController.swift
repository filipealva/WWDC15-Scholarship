//
//  AboutMeTableViewController.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 25/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import UIKit
import MessageUI

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
    let projectWithGitHubCellIdentifier = "projectWithGitHubCell"
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
        
        let projectWithGitHubNib = UINib(nibName: "ProjectWithGitHubCell", bundle: NSBundle.mainBundle())
        tableView.registerNib(projectWithGitHubNib, forCellReuseIdentifier: projectWithGitHubCellIdentifier)
        
        let educationItemNib = UINib(nibName: "EducationItemCell", bundle: NSBundle.mainBundle())
        tableView.registerNib(educationItemNib, forCellReuseIdentifier: educationItemCellIdentifier)
    }
    
    // MARK: - Actions
    
    @IBAction func emailMe(sender: UIBarButtonItem) {
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients(["ofilipealvarenga@gmail.com"])
        mailComposer.setSubject("WWDC 15 Scolarship Contact")
        
        presentViewController(mailComposer, animated: true, completion: nil)
    }
    
    func goToGitHub(sender: UIButton) {
        let project = projects[sender.tag]
        
        if let gitHub = project.gitHub {
            UIApplication.sharedApplication().openURL(NSURL(string: gitHub)!)
        } else {
            let noGitHubURLAlert = UIAlertController(title: "Oops!", message: "Sorry, we can't get GitHub URL.", preferredStyle: .Alert)
            
            let confirmAction = UIAlertAction(title: "Ok, I still love you.", style: .Default, handler: nil)
            noGitHubURLAlert.addAction(confirmAction)
            
            presentViewController(noGitHubURLAlert, animated: true, completion: nil)
        }
        
    }
    
    func goToAppStore(sender: UIButton) {
        let project = projects[sender.tag]
        
        if let appStore = project.appStore {
            UIApplication.sharedApplication().openURL(NSURL(string: appStore)!)
        } else {
            let noAppStoreURLAlert = UIAlertController(title: "Oops!", message: "Sorry, we can't get App Store URL.", preferredStyle: .Alert)
            
            let confirmAction = UIAlertAction(title: "Ok, I still love you.", style: .Default, handler: nil)
            noAppStoreURLAlert.addAction(confirmAction)
            
            presentViewController(noAppStoreURLAlert, animated: true, completion: nil)
        }
    }
    
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
            let project = projects[indexPath.row]
            
            if let gitHub = project.gitHub {
                let projectWithGitHubCell = tableView.dequeueReusableCellWithIdentifier(projectWithGitHubCellIdentifier, forIndexPath: indexPath) as! ProjectWithGitHubTableViewCell
                projectWithGitHubCell.project = project
                projectWithGitHubCell.gitHubButton.tag = indexPath.row
                projectWithGitHubCell.appStoreButton.tag = indexPath.row
                projectWithGitHubCell.gitHubButton.addTarget(self, action: "goToGitHub:", forControlEvents: .TouchUpInside)
                projectWithGitHubCell.appStoreButton.addTarget(self, action: "goToAppStore:", forControlEvents: .TouchUpInside)
                
                return projectWithGitHubCell
            }
            
            let projectCell = tableView.dequeueReusableCellWithIdentifier(projectCellIdentifier, forIndexPath: indexPath) as! ProjectTableViewCell
            projectCell.project = project
            projectCell.appStoreButton.tag = indexPath.row
            projectCell.appStoreButton.addTarget(self, action: "goToAppStore:", forControlEvents: .TouchUpInside)
            
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

extension AboutMeTableViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        let emailFeedback = UIAlertController(title: nil, message: nil, preferredStyle: .Alert)
    
        if let err = error {
            emailFeedback.title = "Oops!"
            emailFeedback.message = "Any problem has occured, your e-mail has not been sent."
            
            let confirmAction = UIAlertAction(title: "No problem, I'll try again.", style: .Default, handler: nil)
            emailFeedback.addAction(confirmAction)
        } else {
            switch result.value {
            case MFMailComposeResultSent.value:
                emailFeedback.title = "Congrats!"
                emailFeedback.message = "Your e-mail has been sent. I'll give you a respose as soon as possible."
            default:
                emailFeedback.title = "Oops!"
                emailFeedback.message = "I hope you decide to send me this e-mail soon."
            }
            
            let confirmAction = UIAlertAction(title: "Ok.", style: .Default, handler: nil)
            emailFeedback.addAction(confirmAction)
        }
        
        self.dismissViewControllerAnimated(true, completion: { [unowned self] () -> Void in
            self.presentViewController(emailFeedback, animated: true, completion: nil)
        })
    }
    
}