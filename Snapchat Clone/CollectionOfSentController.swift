//
//  CollectionOfSentController.swift
//  Snapchat Clone
//
//  Created by Neha Kunjal on 10/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class CollectionOfSentController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var tableViewWhole: UITableView!
    var items = itemsCollections
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewWhole.dataSource = self
        tableViewWhole.delegate = self
        items = itemsCollections
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        items = itemsCollections
        tableViewWhole.reloadData()
    }
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].name
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].objectValues.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let alertController = UIAlertController(title: "Hint", message: "You have selected row \(indexPath.row).", preferredStyle: .alert)
        
        //let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        //alertController.addAction(alertAction)
        
        //present(alertController, animated: true, completion: nil)
        let cell = tableViewWhole.cellForRow(at: indexPath) as! SnapchatHistoryTableViewCell
        itemsCollections[indexPath.section].tags[indexPath.item] = 1
        if (cell.seen == -1) {
            performSegue(withIdentifier: "getImage", sender: cell.im)

        }
        cell.sentImage.image = #imageLiteral(resourceName: "read")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "getImage") {
        guard let sentView = segue.destination as? SentViewController else {
            return
        }
        sentView.selectedImage = sender as! UIImage
        }
    }
    @IBAction func unwindToVC2WithSegue(segue:UIStoryboardSegue) {
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! SnapchatHistoryTableViewCell
        let text = items[indexPath.section].objectValues[indexPath.item]
        let tag = items[indexPath.section].tags[indexPath.item]
        cell.seen = tag
        if (tag == -1) {
            cell.sentImage.image = #imageLiteral(resourceName: "unread")
        }
        else {
            cell.sentImage.image = #imageLiteral(resourceName: "read")

        }
        cell.snap.text = text
        cell.im = items[indexPath.section].objectImage[indexPath.item]
        let timeInt = Int(-1*items[indexPath.section].time[indexPath.item].timeIntervalSinceNow)
        if (timeInt < 60) {
            cell.time.text = String(timeInt) + " seconds ago"
        }
        else if (timeInt < 3600) {
            cell.time.text = String(timeInt/60) + " minutes ago"
        }
        else {
            cell.time.text = String(timeInt/216000) + " hours ago"
        }
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    func insertRows(at indexPaths: [IndexPath],
                    with animation: UITableViewRowAnimation) {
        let cell = tableViewWhole.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! SnapchatHistoryTableViewCell
        //cell.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
