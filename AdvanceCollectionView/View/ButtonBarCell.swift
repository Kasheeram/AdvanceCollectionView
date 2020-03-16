//
//  ButtonBarCell.swift
//  AdvanceCollectionView
//
//  Created by Kashee Kushwaha on 16/03/20.
//  Copyright © 2020 Kashee Kushwaha. All rights reserved.
//

import UIKit

class ButtonBarCell: UICollectionViewCell,UICollectionViewDelegate ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let aboutCellId = "aboutCellId"
//    var tabheaderView: TabHeaderView?
    
    func scrollIndexAt(indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.isPagingEnabled = true
        registerCells()
        
    }
    
    private func registerCells() {
        collectionView.register(LEVSyndicateDetailCell.self, forCellWithReuseIdentifier: aboutCellId)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: aboutCellId, for: indexPath) as! LEVSyndicateDetailCell
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.orange : UIColor.purple
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}
