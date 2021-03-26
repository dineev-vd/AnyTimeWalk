//
//  WalkViewCell.swift
//  AnyTimeWalk
//
//  Created by Egor Dadugin on 25.03.2021.
//

import UIKit

protocol WalkCollectionCellDelegate : class {
    func didLikeButtonPressed(cell: WalkViewCell)
}


class WalkViewCell: UICollectionViewCell {
    var delegate:WalkCollectionCellDelegate?
    
    @IBOutlet weak var walkImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeButtonTapped: UIButton!
    @IBAction func likeButtonPressed(_ sender: Any) {
        delegate?.didLikeButtonPressed(cell: self)
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
}
