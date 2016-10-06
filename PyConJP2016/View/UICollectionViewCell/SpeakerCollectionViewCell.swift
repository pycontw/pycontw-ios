//
//  SpeakerCollectionViewCell.swift
//  PyConJP2016
//
//  Created by Yutaro Muta on 9/8/16.
//  Copyright © 2016 PyCon JP. All rights reserved.
//

import UIKit
import AlamofireImage

class SpeakerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var twitterLabel: UILabel!
    
    override func prepareForReuse() {
        iconImageView.image = UIImage(named: "Speaker")
        nameLabel.text = nil
        twitterLabel.text = nil
    }
    
    func fill(speaker: Speaker) {
        if let imageURL = speaker.imageURL, let url = URL(string: PCJConfig.hostURL + imageURL) {
            iconImageView.af_setImage(withURL: url)
        }
        nameLabel.text = speaker.name
        twitterLabel.text = (speaker.twitterName != nil ? "@\(speaker.twitterName!)" : nil)
    }
    
}
