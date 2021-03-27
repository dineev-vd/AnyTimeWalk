//
//  MostViewedViewController.swift
//  AnyTimeWalk
//
//  Created by Egor Dadugin on 25.03.2021.
//

import UIKit
import CoreData

class MostViewedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, WalkCollectionCellDelegate {
    var container:NSPersistentContainer!
    var tours: [Tour] = []
    
    func didLikeButtonPressed(cell: WalkViewCell) {
        if let indexPath = collectionView.indexPath(for: cell) {
            walks[indexPath.row].isLiked = walks[indexPath.row].isLiked ? false : true
            cell.isLiked = walks[indexPath.row].isLiked
            if(walks[indexPath.row].isLiked){
                favs.append(walks[indexPath.row])
            } else {
                if let index = favs.firstIndex(of: walks[indexPath.row]){
                    print(index)
                    favs.remove(at: index)
                }
            }
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
        container = NSPersistentContainer(name: "AnyTimeWalk")
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
    
    func loadSavedData() {
        let request = Tour.createFetchRequest()
        let sort = NSSortDescriptor(key: "name", ascending: false)
        request.sortDescriptors = [sort]
        do {
            tours = try container.viewContext.fetch(request)
            print("Got \(tours.count) commits")
            collectionView.reloadData()
        } catch {
            print("Fetch failed")
        }
    }

    //Массив для прогулок
    private var walks = [Walk(walkId: "1", name: "test", description: "This is description for test", featuredImage: UIImage(named: "rome.jpg")!, isLiked: false),Walk(walkId: "2", name: "test2", description: "This is description for test2", featuredImage: UIImage(named: "rome.jpg")!, isLiked: false)]
}
