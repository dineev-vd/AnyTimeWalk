//
//  Walk.swift
//  AnyTimeWalk
//
//  Created by Egor Dadugin on 25.03.2021.
//

import Foundation
import UIKit

struct Walk: Equatable{
    var walkId = ""
    var name = ""
    var description = ""
    var featuredImage: UIImage!
    var isLiked = false
    init(walkId: String, name: String, description: String, featuredImage: UIImage, isLiked: Bool){
        self.walkId = walkId;
        self.name = name
        self.description = description
        self.featuredImage = featuredImage
        self.isLiked = isLiked
    }
    
    static func ==(lhs: Walk, rhs: Walk) -> Bool {
        return lhs.walkId == rhs.walkId
    }
}

var favs: [Walk] = []
