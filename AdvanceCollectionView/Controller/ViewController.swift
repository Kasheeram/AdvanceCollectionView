//
//  ViewController.swift
//  AdvanceCollectionView
//
//  Created by Kashee Kushwaha on 16/03/20.
//  Copyright © 2020 Kashee Kushwaha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, HeaderViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellId = "cellId"
    let buttonBarCellId = "buttonBarCellId"
    let tabHeaderCellId = "tabHeaderCellId"
    
    let headerTitleArray = ["ONGING DEALS","ABOUT","INV.THESIS","DEALS", "EXITS","DEALS LED","DEALS PARTICIPATED IN","SYNDICATE BACKER","SYNDICATE RULES"]
    
    var cellForButtonBarCell: ButtonBarCell?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title  = "Syndicate"
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCells()
    }
    
    private func registerCells() {
//        collectionView.register(LEVSyndicateDetailCell.self, forCellWithReuseIdentifier: cellId)
//        collectionView.register(ButtonBarCell.self, forCellWithReuseIdentifier: buttonBarCellId)
        collectionView.register(TabHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: tabHeaderCellId)
        
//        collectionView.register(UINib(nibName: "LEVSyndicateDetailCell", bundle: .main), forCellWithReuseIdentifier: cellId)
        collectionView.register(UINib(nibName: "ButtonBarCell", bundle: .main), forCellWithReuseIdentifier: buttonBarCellId)
//        collectionView.register(UINib(nibName: "TabHeaderView", bundle: .main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: tabHeaderCellId)
        
    }


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            cellForButtonBarCell = collectionView.dequeueReusableCell(withReuseIdentifier: buttonBarCellId, for: indexPath) as! ButtonBarCell
            cellForButtonBarCell?.backgroundColor = .purple
        return cellForButtonBarCell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height - 46)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: tabHeaderCellId, for: indexPath) as! TabHeaderView
        header.headerTitleArray = headerTitleArray
        header.delegate = self
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 316)
    }
    
    func toggleSection(header: TabHeaderView, indexPath: IndexPath) {
        cellForButtonBarCell?.scrollIndexAt(indexPath: indexPath)
    }
    
    
}

