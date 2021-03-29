import UIKit
import CoreData

class FavouritesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, WalkCollectionCellDelegate1{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func didFavsLikeButtonPressed(cell: WalkViewCell) {
        if let indexPath = collectionView.indexPath(for: cell) {
            favs[indexPath.row].isLiked = favs[indexPath.row].isLiked ? false : true
            cell.favsIsLiked = favs[indexPath.row].isLiked
            walks[indexPath.row].isLiked = false
            favs.remove(at: indexPath.row)
            collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! WalkViewCell
        cell.favsName.text = favs[indexPath.row].name
        cell.favsImage.image = favs[indexPath.row].featuredImage
        cell.favsDescription.text = favs[indexPath.row].shortDescription
        cell.favsIsLiked = favs[indexPath.row].isLiked
        cell.delegate2 = self
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
}
