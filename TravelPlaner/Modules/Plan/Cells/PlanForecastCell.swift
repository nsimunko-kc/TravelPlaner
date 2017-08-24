//
//  PlanForecastCell.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 23/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import UIKit

class PlanForecastCell: UITableViewCell {

    @IBOutlet weak var forecastCollectionView: UICollectionView!
    
    fileprivate var _items = [DayForecastCellItem]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with item: PlanForecastCellItem) {
        _items = item.forecast
    }

}

extension PlanForecastCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
