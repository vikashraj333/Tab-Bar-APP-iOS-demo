//
//  GridViewController.swift
//  SecondProjectUI
//
//  Created by IOS Training 4 on 17/07/22.
//

import UIKit

class GridViewController: UIViewController {
    
    let sb = UIStoryboard(name: "Main", bundle: nil)

    var imageNameForGrid: String?
    var tap: Bool?
    var tapped: Bool = false
    var index: IndexPath?
    @IBOutlet weak var imageGrid: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configeCell()
    }
    func configeCell() {
        let layout = UICollectionViewFlowLayout()
         imageGrid.collectionViewLayout = layout
        imageGrid.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
         imageGrid.register(ImageCollectionViewCell.nib(), forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        imageGrid.delegate = self
        imageGrid.dataSource = self
        
    }
}

extension GridViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let nav = sb.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController{
            let ImageName =  "\((indexPath.item % 4) + 1)"
        nav.ImageCenter.image = UIImage(named: imageNameForGrid ?? ImageName)
            self.navigationController?.pushViewController(nav, animated: true)}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell

        
        let Images = (indexPath.row) + 1
        let ImageName = "\(Images)"

        cell.ImageView.image = UIImage(named: imageNameForGrid ?? ImageName)
        self.imageGrid.reloadData()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:80, height:90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
