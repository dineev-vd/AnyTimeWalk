//
//  FavouritesViewController.swift
//  AnyTimeWalk
//
//  Created by Egor Dadugin on 26.03.2021.
//

import UIKit
import CoreData

class FavouritesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, WalkCollectionCellDelegate {
    var container:NSPersistentContainer!
    var tours: [Tour] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func didLikeButtonPressed(cell: WalkViewCell) {
        if let indexPath = collectionView.indexPath(for: cell) {
            favs[indexPath.row].isLiked = favs[indexPath.row].isLiked ? false : true
            cell.isLiked = favs[indexPath.row].isLiked
            favs.remove(at: indexPath.row)
            //Остается лайк в walks
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! WalkViewCell
        cell.favsName.text = favs[indexPath.row].name
        cell.favsImage.image = favs[indexPath.row].featuredImage
        cell.favsDescription.text = favs[indexPath.row].description
        cell.favsIsLiked = favs[indexPath.row].isLiked
        cell.delegate = self
        cell.layer.cornerRadius = 4.0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let controller = tabBarController?.storyboard?.instantiateViewController(identifier: "InfoViewController") as? InfoViewController{
            controller.currentWalk = favs[indexPath.row]
            tabBarController?.present(controller, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        container = NSPersistentContainer(name: "AnyTimeWalk")
        super.viewDidLoad()
        collectionView.backgroundColor = .clear
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favs.count
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
}
