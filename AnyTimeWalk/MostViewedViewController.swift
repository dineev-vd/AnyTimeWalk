//
//  MostViewedViewController.swift
//  AnyTimeWalk
//
//  Created by Egor Dadugin on 25.03.2021.
//

import UIKit

class MostViewedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, WalkCollectionCellDelegate {
    
    func didLikeButtonPressed(cell: WalkViewCell) {
        if let indexPath = collectionView.indexPath(for: cell) {
            walks[indexPath.row].isLiked = walks[indexPath.row].isLiked ? false : true
            cell.isLiked = walks[indexPath.row].isLiked
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! WalkViewCell
        cell.nameLabel.text = walks[indexPath.row].name
        cell.walkImage.image = walks[indexPath.row].featuredImage
        cell.descriptionLabel.text = walks[indexPath.row].description
        cell.isLiked = walks[indexPath.row].isLiked
        cell.delegate = self
        cell.layer.cornerRadius = 4.0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let controller = tabBarController?.storyboard?.instantiateViewController(identifier: "InfoViewController") as? InfoViewController{
            controller.currentWalk = walks[indexPath.row]
            tabBarController?.present(controller, animated: true)
        }
    }
    
    //Аутлет для CollectionView
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .clear
        //collectionView.dataSource = walks as! UICollectionViewDataSource
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return walks.count
    }

    //Массив для прогулок
    private var walks = [Walk(walkId: "1", name: "test", description: "", featuredImage: UIImage(named: "rome.jpg")!, isLiked: false),Walk(walkId: "2", name: "test", description: "", featuredImage: UIImage(named: "rome.jpg")!, isLiked: false)]
}
