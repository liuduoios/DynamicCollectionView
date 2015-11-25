//
//  DynamicCollectionView.swift
//  DynamicCollectionView
//
//  Created by 刘铎 on 15/11/24.
//  Copyright © 2015年 liuduoios. All rights reserved.
//

import UIKit

public class DynamicCollectionView<T>: UIView {
    
    // -----------------
    // MARK: - Constants
    // -----------------
    
    let CellIdentifier = "Cell"
    
    // ------------------
    // MARK: - Properties
    // ------------------
    
    private var collectionView: UICollectionView!
    public var collectionViewLayout: UICollectionViewFlowLayout { return collectionView.collectionViewLayout as! UICollectionViewFlowLayout }
    private lazy var dataSource = DynamicCollectionViewDataSource<T>()
    
    // -----------------
    // MARK: - Lifecycle
    // -----------------
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.whiteColor()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        
        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        addSubview(collectionView)
        
        dataSource.collectionView = collectionView
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // --------------
    // MARK: - Public
    // --------------
    
    public func setBgColor(color: UIColor) {
        collectionView.backgroundColor = color
    }
    
    public func reloadData() {
        collectionView.reloadData()
    }
    
    public func registerCollectionViewCellClass(cellClass: DynamicCollectionViewCell<T>.Type) {
        collectionView.registerClass(cellClass, forCellWithReuseIdentifier: CellIdentifier)
    }

    public func addItem(item: T) {
        dataSource.addData(item)
    }
    
    public func removeLastItem() {
        dataSource.removeLastData()
    }
    
    public func removeAllItems() {
        dataSource.removeAllDatas()
    }

}
