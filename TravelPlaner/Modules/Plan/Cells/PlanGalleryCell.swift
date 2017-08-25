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
    
    fileprivate var _images = [GettyImage]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        galleryCollectionView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    func configure(with item: PlanGalleryCellItem) {
        _images = item.images
    }

}

extension PlanGalleryCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.ReuseIdentifiers.CollectionViewCells.GalleryImageCollectionViewCell, for: indexPath) as! GalleryImageCollectionViewCell
        cell.configure(with: _images[indexPath.row])
        return cell
    }
    
}
