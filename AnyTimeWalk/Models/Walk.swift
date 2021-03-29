import Foundation
import UIKit

struct Walk: Equatable{
    var walkId = ""
    var name = ""
    var shortDescription = ""
    var fullDescription = ""
    var featuredImage: UIImage!
    var isLiked = false
    init(walkId: String, name: String, description: String,fullDescription: String, featuredImage: UIImage, isLiked: Bool){
        self.walkId = walkId;
        self.name = name
        self.shortDescription = description
        self.fullDescription = fullDescription
        self.featuredImage = featuredImage
        self.isLiked = isLiked
    }
    
    static func ==(lhs: Walk, rhs: Walk) -> Bool {
        return lhs.walkId == rhs.walkId
    }
}

var favs: [Walk] = []

var walks = [Walk(walkId: "1", name: "Москва. Гостинный двор", description: "Прогулка по гостинному двору", fullDescription: "Каменный Гостиный двор построили в 1640-х годах по указу Михаила Фёдоровича. Он был разделён на четыре двора: Старый, Новый, Соляной и Рыбный. В первых двух находились ряды с лавками и амбарами, в последних — лавки, шалаши и шалашные места. В 1661—1665 годах под руководством купца и думного дьяка Аверкия Кириллова двор расширили в сторону Варварки, построив новое здание на месте ранее размещавшихся лавок. Постройка занимала целый квартал между Ильинкой и Варваркой. Комплекс окружали высокие побелённые стены с воротами, над которыми стояла восьмиугольная башня. Её венчал медный, весом более 20 пудов, позолоченный орёл, а по бокам располагались маленькие шатрики. После перестройки Гостиный двор обрёл и дипломатическую функцию: в нём размещался Посольский приказ, в который приезжали послы зарубежных стран и иностранные купцы.", featuredImage: UIImage(named: "gd.jpg")!, isLiked: false),Walk(walkId: "2", name: "Лунган. Стадион Женьшень", description: "Спортивный центр в городе Лунган", fullDescription: "", featuredImage: UIImage(named: "sc.jpg")!, isLiked: false), Walk(walkId: "3", name: "Париж. Лувр", description: "Прогуляйтесь по одному из самых известных музеев мира", fullDescription: "", featuredImage: UIImage(named: "lv.jpg")!, isLiked: false)]
