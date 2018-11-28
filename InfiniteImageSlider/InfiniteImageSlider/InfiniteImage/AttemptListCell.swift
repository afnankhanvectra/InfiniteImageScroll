//
//  AttemptListCell.swift
//  ChalengeAppResearch
//
//  Created by Afnan khan on 06/10/2018.
//  Copyright © 2018 SamSoft. All rights reserved.
//

import UIKit
import SDWebImage
let SCREEN_WIDTH_RATIO = UIScreen.main.bounds.size.width / 414

class AttemptListCell: UICollectionViewCell {
    
    @IBOutlet weak var attemptorImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {[weak self] in
        //            self?.attemptorImageView.makeCornerRadiusView(withRaduius: Int(((self?.attemptorImageView.frame.size.height)!/2)))
        //
        //        }
    }
    
    func configCell(withimage image : UIImage , isCircleImage _isCircleImage : Bool){
        attemptorImageView.image = image
        if _isCircleImage ==  true {
            DispatchQueue.main.async {[weak self] in
                self?.attemptorImageView.makeRounded(cornerWithRadius: (self?.attemptorImageView.frame.size.width)!)
            }
        }
        
        
    }
    
    
    func configCell(withURL imageURL : String , isCircleImage _isCircleImage : Bool){
        attemptorImageView.sd_setImage(with: URL(string : imageURL), completed: nil)
        if _isCircleImage ==  true {
            DispatchQueue.main.async {[weak self] in
                self?.attemptorImageView.makeRounded(cornerWithRadius: (self?.attemptorImageView.frame.size.width)!)
            }
        }
    }
    
}


extension UIView {
    
    func makeRounded(cornerWithRadius radius : CGFloat) {
        layer.cornerRadius = (radius * SCREEN_WIDTH_RATIO) / 2
        layer.masksToBounds = true
        layer.borderWidth = 0
    }
    
    func  makeCornerRadiusView(withRaduius radius: Int) {
        layer.cornerRadius = (CGFloat )( radius)
        layer.masksToBounds = true
        layer.borderWidth = 0
    }
}
