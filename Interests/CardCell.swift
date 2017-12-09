//
//  CardCell.swift
//  Interests
//
//  Created by Scott Richards on 12/7/17.
//  Copyright © 2017 BitWyze. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func populateCell(data: CardData) {
        headlineLabel.text = data.headline
        abstractLabel.text = data.abstract
        imageView.image = data.featuredImage
    }
}
