//
//  ProfileViewController.swift
//  AnyTimeWalk
//
//  Created by Egor Dadugin on 26.03.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImage.layer.cornerRadius = 60
    }

}
