import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var featuredImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        featuredImage.image = currentWalk.featuredImage
        nameLabel.text = currentWalk.name
        infoLabel.text = currentWalk.fullDescription
    }
    
    var currentWalk: Walk!
}
