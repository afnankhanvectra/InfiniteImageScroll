//
//  KNAttempterListView.swift
//  ChalengeAppResearch
//
//  Created by Afnan khanon 06/10/2018.
//  Copyright © 2018 SamSoft. All rights reserved.
//

import UIKit

@IBDesignable
open class KNAttempterListView: UIView {
    //MARK: inspectable
    
    @IBInspectable
    public var userImages : [UIImage]?{
        didSet {
            view.userImages = userImages
        }
    }
    
    @IBInspectable
    public var userURLs : [String]?{
        didSet {
            view.userURLs = userURLs
        }
    }
    
    @IBInspectable
    public var shouldScrollimagesAutomatic : Bool = true{
        didSet {
            view.shouldScrollimagesAutomatic = shouldScrollimagesAutomatic
        }
    }
    
    @IBInspectable
    public var shouldCircleImage : Bool = true{
        didSet {
            view.shouldCircleImage = shouldCircleImage
        }
    }
    
    @IBInspectable
    public var TIME_GAP : Double = 2.0{
        didSet {
            view.TIME_GAP = TIME_GAP
        }
    }
    
    
    
    //MARK: IBOutlet
    
    var view: AttemptListXibView!
    
    //MARK: life cycle
    //---------------------------------------------------------------------------------------------------
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    func setUpView(){
        xibSetup()
    }
    
    /// /---------------------------------------------------------------------------------------------------
    
    //MARK: Set up
    func xibSetup() {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        addSubview(view)
    }
    
    func loadViewFromNib() -> AttemptListXibView {
        view =  Bundle.main.loadNibNamed("AttemptListXibView", owner: nil, options: nil)![0] as! AttemptListXibView
        return view
        
    }
    
    
    
}
