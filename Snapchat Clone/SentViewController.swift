//
//  SentViewController.swift
//  Snapchat Clone
//
//  Created by Neha Kunjal on 10/17/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class SentViewController: UIViewController {

    @IBOutlet var sentImage: UIImageView!
    var selectedImage: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
        sentImage.image = selectedImage
        // Do any additional setup after loading the view.
    }
    @objc func timeToMoveOn() {
        performSegue(withIdentifier: "unwindSegueToVC2", sender: self)
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
