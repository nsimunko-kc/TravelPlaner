//
//  PlanGalleryCell.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 23/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import UIKit

class PlanGalleryCell: UITableViewCell {

    @IBOutlet weak var galleryCollectionView: UICollectionView!
    
    fileprivate var _imagePaths = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure() {
        
    }

}

extension PlanGalleryCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _imagePaths.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
