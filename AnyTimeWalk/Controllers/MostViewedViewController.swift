import UIKit
import CoreData

class MostViewedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, WalkCollectionCellDelegate {
    
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
        cell.descriptionLabel.text = walks[indexPath.row].shortDescription
        cell.isLiked = walks[indexPath.row].isLiked
        cell.delegate1 = self
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return walks.count
    }
}
