//
//  ViewController.swift
//  InfiniteImageSlider
//
//  Created by Afnan khan on 22/11/2018.
//  Copyright © 2018 iSystematic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userImagesListView: KNAttempterListView!
    @IBOutlet weak var userURLListView: KNAttempterListView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        userImagesListView.userImages = [ #imageLiteral(resourceName: "image_1") , #imageLiteral(resourceName: "image_2") , #imageLiteral(resourceName: "image_3") , #imageLiteral(resourceName: "image_4") , #imageLiteral(resourceName: "image_5"), #imageLiteral(resourceName: "image_6"), #imageLiteral(resourceName: "image_7")]
        userImagesListView.shouldScrollimagesAutomatic = true
        

        userURLListView.userURLs = ["https://res.cloudinary.com/dlikzl3m2/image/upload/v1542899937/Github/image_2.jpg",
        "https://res.cloudinary.com/dlikzl3m2/image/upload/v1542899937/Github/image_4.jpg",
        "https://res.cloudinary.com/dlikzl3m2/image/upload/v1542899937/Github/image_5.jpg",
        "https://res.cloudinary.com/dlikzl3m2/image/upload/v1542899937/Github/image_7.jpg",
        "https://res.cloudinary.com/dlikzl3m2/image/upload/v1542899937/Github/image_1.jpg",
        "https://res.cloudinary.com/dlikzl3m2/image/upload/v1542899937/Github/image_3.jpg",
        "https://res.cloudinary.com/dlikzl3m2/image/upload/v1542899937/Github/image_6.jpg"]
        userURLListView.TIME_GAP = 3.1
        userURLListView.shouldScrollimagesAutomatic = true
        userURLListView.shouldCircleImage = false

    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

