//
//  imagePickerController.swift
//  snapChatProject
//
//  Created by Akilesh Bapu on 2/27/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

// This class should remind you of lab 3. That's probably because it's exactly the same!
class ImagePickerController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var imageCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollectionView.collectionViewLayout = ImageFlowLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
            guard let sectionViewController = segue.destination as? SectionChoiceController else {
                return
            }
            guard let img = sender as? UIImage else {
                return
            }
            sectionViewController.img = img
            //sentView.sentImage.image = img
        }
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) {
        guard let sectionViewController = segue.source as? SectionChoiceController else {
            return
        }
        //let dest = segue.destination as! CollectionOfSentController
        if sectionViewController.tag == -1 {
            return
        }
        else if sectionViewController.tag == 0 {
            sectionViewController.section.text = ""
        }
        else if sectionViewController.tag == 1 {
            sectionViewController.section.text = ""
        }
        else if sectionViewController.tag == 2 {
            sectionViewController.section.text = ""
        }
    }
    
    func selectImage(_ image: UIImage) {
        performSegue(withIdentifier: "choices", sender: image)
    }
    
    
    
    //DON'T MODIFY CODE HERE AND BELOW!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pickImageCell", for: indexPath) as? ImageCollectionViewCell else {
            print("error dequeuing cell at index path \(indexPath)")
            return UICollectionViewCell()
        }
        cell.image.image = allImages[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedCell = collectionView.cellForItem(at: indexPath) as? ImageCollectionViewCell {
            selectImage(selectedCell.image.image!)
        }
        
    }
}
