//
//  SectionChoiceController.swift
//  Snapchat Clone
//
//  Created by Neha Kunjal on 10/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class SectionChoiceController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var img : UIImage!;
    @IBOutlet weak var section: UILabel!
    @IBOutlet weak var choices: UITableView!
    var tag = -1;
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = choices.dequeueReusableCell(withIdentifier: "choiceCell", for: indexPath) as! MyTableViewCell
        cell.name.text = threadNames[indexPath.item]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        section.text = threadNames[indexPath.item]
        tag = indexPath.item
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        choices.delegate = self
        choices.dataSource = self
        choices.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func goBackToOneButtonTapped(_ sender: Any) {
        if self.tag == -1 {
            return
        }
        itemsCollections[self.tag].objectValues.append("Neha")
        itemsCollections[self.tag].objectImage.append(img)
        itemsCollections[self.tag].tags.append(-1)
        itemsCollections[self.tag].time.append(NSDate())

        _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
        let alert = UIAlertController(title: "", message: "Sent to " + threadNames[self.tag], preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        // change to desired number of seconds (in this case 5 seconds)
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            alert.dismiss(animated: true, completion: nil)
        }
//        timeToMoveOn()
    }
    @objc func timeToMoveOn() {
        performSegue(withIdentifier: "unwindSegueToVC1", sender: img)
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
