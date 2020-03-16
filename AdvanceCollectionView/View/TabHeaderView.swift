//
//  TabHeaderView.swift
//  AdvanceCollectionView
//
//  Created by Kashee Kushwaha on 16/03/20.
//  Copyright © 2020 Kashee Kushwaha. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate: class {
    func toggleSection(header: TabHeaderView, indexPath: IndexPath)
}

class TabHeaderView: UICollectionReusableView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let buttonCell = "buttonCell"
    weak var delegate: HeaderViewDelegate?
    var headerTitleArray = [String]()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 2.0
        layout.minimumInteritemSpacing = 0.0
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        collection.isPagingEnabled = true
        return collection
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        registerCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 46).isActive = true
    }
    
    private func registerCells() {
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.register(ButtonsCell.self, forCellWithReuseIdentifier: buttonCell)
        collectionView.register(UINib(nibName: "ButtonsCell", bundle: .main), forCellWithReuseIdentifier: buttonCell)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: buttonCell, for: indexPath) as! ButtonsCell
//        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.orange : UIColor.blue
        cell.titleLabel.text = headerTitleArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let string = headerTitleArray[indexPath.row]
        let width = widthForLable(text: string, font: UIFont.boldSystemFont(ofSize: 15), height: 46) + 24
        return CGSize(width: width, height: 46)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let row = indexPath.row
        delegate?.toggleSection(header: self, indexPath: indexPath)
    }
    
    func widthForLable(text:String, font:UIFont, height:CGFloat) -> CGFloat {
        // pass string, font, LableWidth
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: height))
        label.numberOfLines = 1
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.width
    }
    
}
