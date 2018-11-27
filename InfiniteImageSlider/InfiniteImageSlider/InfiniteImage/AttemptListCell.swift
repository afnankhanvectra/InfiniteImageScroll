//
//  AttemptListCell.swift
//  ChalengeAppResearch
//
//  Created by Sheeraz Ahmed Memon on 06/10/2018.
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
        attemptorImageView.makeRounded(cornerWithRadius: attemptorImageView.frame.size.height)
    }
    
    func configCell(withimage image : UIImage){
        attemptorImageView.image = image
    }
    
    
    func configCell(withURL imageURL : String){
        attemptorImageView.sd_setImage(with: URL(string : imageURL), completed: nil)
    }
    
}


extension UIView {
    
    func makeRounded(cornerWithRadius radius : CGFloat) {
        layer.cornerRadius = (radius * SCREEN_WIDTH_RATIO) / 2
        layer.masksToBounds = true
        layer.borderWidth = 0
    }
}
