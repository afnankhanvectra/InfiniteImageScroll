//
//  AttemptListXibView.swift
//  ChalengeAppResearch
//
//  Created by Sheeraz Ahmed Memon on 06/10/2018.
//  Copyright © 2018 SamSoft. All rights reserved.
//


import UIKit



///User image view change
let MAX_TIME   = 10000


class AttemptListXibView: UIView , UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    var  timer : Repeater?
    
    public var userImages : [UIImage]?{
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    public var userURLs : [String]?{
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    public var attempterListURL : [UIImage]?{
        didSet {
            self.collectionView.reloadData()
        }
    }
    
 
    public var shouldScrollimagesAutomatic : Bool = false{
        didSet {
            if shouldScrollimagesAutomatic ==  true {
                setAutomaticTimer()
            } else {
                removeAutomaticTimer()
            }
         }
    }
    
    public var TIME_GAP : Double = 2.0{
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    
    func setScrollDirectionOfCollectionView(_ isHorizontal : Bool){
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = (isHorizontal == true ) ? .horizontal : .vertical
            collectionView.reloadData()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func setUpView(){
        
        
        collectionView.isUserInteractionEnabled = false
        //   DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {  [weak self ] in
        collectionView.frame = self.bounds
        let nib = UINib(nibName: "AttemptListCell", bundle: nil)
        self.collectionView?.register(nib, forCellWithReuseIdentifier: "AttemptListCell")
        self.collectionView?.delegate =  self
        self.collectionView?.dataSource =  self
        self.collectionView?.reloadData()
        
    }
    
    public func changeFrameOfColectionView(withframe frame : CGRect){
        self.collectionView?.frame = frame
        self.collectionView?.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "AttemptListCell", for: indexPath) as! AttemptListCell
        
        if userImages != nil && userImages!.count > 0 {
         /// Index path is infinite  (10000) for circular .   so use Mod for infinite
        let index = (indexPath.row % userImages!.count)
            cell.configCell(withimage: userImages![index])
        } else if userURLs != nil && userURLs!.count > 0 {
            /// Index path is infinite  (10000) for circular .   so use Mod for infinite
            let index = (indexPath.row % userURLs!.count)
            cell.configCell(withURL: userURLs![index])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if  userImages ==  nil && userURLs == nil  { return 0 }
        if userImages != nil && (userImages?.count)! < 3 { return (userImages?.count)! }
        if userURLs != nil && (userURLs?.count)! < 3 { return (userURLs?.count)! }

         return   MAX_TIME //maximumNumberOfImages
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.height, height: collectionView.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    
    func setAutomaticTimer(){
        
        removeAutomaticTimer()
        NotificationCenter.default.removeObserver(self)
        
        
        
        
        timer =   Repeater(interval: .seconds(TIME_GAP), mode: .infinite) {[weak self] _ in
          //  print("Change controller \(self?.objectId)")
            if self ==  nil || self?.collectionView ==  nil { self?.removeAutomaticTimer()
            } else {
            DispatchQueue.main.async {[weak self] in
                (self?.collectionView.scrollToNextItem(withItemSize : ((self?.collectionView.frame.size.height)! +  0)))!
            }
        }
        }
        timer?.start()
    }
    
    func removeAutomaticTimer(){
        if timer  != nil {
            timer?.removeAllObservers()
            timer = nil
        }
    }
    
    @objc func stopTimer(_ notification  : Notification) {
        
         // Stop timer here
        // Call notification of stop timer
    }
    
    @objc func startTimer(_ notification  : Notification) {
        
        // Start timer here
        // Call notification of Start timer
    }
    
}


extension UICollectionView {
    
    func scrollToBottom (){
        
        let lastSection = self.numberOfSections - 1
        let lastRow = self.numberOfItems(inSection: lastSection)
        let indexPath = IndexPath(row: lastRow - 1, section: lastSection)
        self.scrollToItem(at: indexPath, at: .bottom, animated: false)
    }
    
    func scrollToNextItem(withItemSize  size : CGFloat ) {
        
        let contentOffset = CGFloat(floor((self.contentOffset.x) + size))
        self.moveToFrame(contentOffset: contentOffset)
        
        
    }
    
    func scrollToPreviousItem() {
        let contentOffset = CGFloat(floor(self.contentOffset.x - self.bounds.size.width))
        self.moveToFrame(contentOffset: contentOffset)
    }
    
    func moveToFrame(contentOffset : CGFloat) {
        let frame: CGRect = CGRect(x: contentOffset, y: self.contentOffset.y , width: self.frame.width, height: self.frame.height)
        self.scrollRectToVisible(frame, animated: true)
    }
    
    
    
    
}
