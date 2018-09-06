//
//  GalleryImageCollectionViewCell.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 25/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import UIKit
import SDWebImage

class GalleryImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func configure(with image: GettyImage) {
        if let size = image.displaySizes.first {
            imageView.sd_setImage(with: URL(string: size.url), placeholderImage: nil)
        }
    }
    
}
