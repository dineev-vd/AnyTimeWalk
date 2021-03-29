import UIKit

protocol WalkCollectionCellDelegate : class {
    func didLikeButtonPressed(cell: WalkViewCell)
}

protocol WalkCollectionCellDelegate1 : class {
    func didFavsLikeButtonPressed(cell: WalkViewCell)
}


class WalkViewCell: UICollectionViewCell {
    var delegate1:WalkCollectionCellDelegate?
    var delegate2:WalkCollectionCellDelegate1?
    
    @IBOutlet weak var walkImage: UIImageView!
    @IBOutlet weak var favsImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var favsName: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var favsDescription: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var favsLike: UIButton!
    @IBOutlet weak var likeButtonTapped: UIButton!
    @IBOutlet weak var favsButtonTapped: UIButton!
    @IBAction func likeButtonPressed(_ sender: Any) {
        delegate1?.didLikeButtonPressed(cell: self)
    }
    @IBAction func favsButtonPressed(_ sender: Any) {
        delegate2?.didFavsLikeButtonPressed(cell: self)
    }
    
    var isLiked = false{
        didSet{
            if isLiked{
                likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }
            else{
                likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
    }
    
    var favsIsLiked = false{
        didSet{
            if favsIsLiked{
                favsLike.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }
            else{
                favsLike.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
    }
}
