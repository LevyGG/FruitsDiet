//
//  HomeControlMenu_VC.swift
//  FruitsDiet
//
//  Created by Levy on 2017/4/19.
//  Copyright © 2017年 Ravi Shankar. All rights reserved.
//

import UIKit

class HomeControlMenu_VC: UIViewController {

    let identifier = "HomeMenuControlCell_ReuseID"
    let headerViewIdentifier = "HomeMenuControll_HeaderView_ReuseID"
    
    @IBOutlet weak var collectionView: UICollectionView!
    let dataSource = DataSource("HomeConrtollMenu")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "HomeMenuControlCell", bundle: Bundle.main), forCellWithReuseIdentifier: "HomeMenuControlCell_ReuseID")
    
    }

    func setupFloatWithSize(size:CGSize){

    }
    

}


extension HomeControlMenu_VC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let length = (self.view.bounds.size.width-15)/6
        return CGSize(width: length,height: length+40);
    }
}

extension HomeControlMenu_VC:UICollectionViewDataSource,UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.groups.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.numbeOfRowsInEachGroup(section)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as!HomeMenuControlCell
        
        let fruits: [Fruit] = dataSource.fruitsInGroup(indexPath.section)
        let fruit = fruits[indexPath.row]
        
        let name = fruit.name!
        
        cell.MainImageView.image = UIImage(named: name.lowercased())
        cell.Title_Label.text = name.capitalized
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView: MenuHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerViewIdentifier, for: indexPath) as! MenuHeaderView
        
        headerView.HeaderTitle_label.text = dataSource.gettGroupLabelAtIndex(indexPath.section)
        
        return headerView
    }
    
}
