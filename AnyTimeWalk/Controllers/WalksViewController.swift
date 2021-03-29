import UIKit

class WalksViewController: UIViewController {

    @IBAction func addWalk(_ sender: Any) {
        if let controller = tabBarController?.storyboard?.instantiateViewController(identifier: "AddTourController") as? AddTourController{
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
