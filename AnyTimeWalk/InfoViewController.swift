//
//  InfoViewController.swift
//  AnyTimeWalk
//
//  Created by Egor Dadugin on 26.03.2021.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var featuredImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        featuredImage.image = currentWalk.featuredImage
        nameLabel.text = currentWalk.name
        infoLabel.text = currentWalk.description
    }
    
    var currentWalk: Walk!
}
