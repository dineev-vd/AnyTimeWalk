import UIKit
import CoreData

class AddTourController: UIViewController{
    
    @IBOutlet weak var walkName: UITextField!
    @IBOutlet weak var descriptionWalk: UITextField!
    @IBOutlet weak var fullDescription: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBAction func saveWalk(_ sender: Any) {
        walks.append(Walk(walkId: (String)(walks.count+1), name: walkName.text!, description: descriptionWalk.text!, fullDescription: fullDescription.text!, featuredImage: UIImage(named: "default.jpg")!, isLiked: false))
        navigationController?.popViewController(animated: true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullDescription.borderStyle = UITextField.BorderStyle.roundedRect;
        saveButton.layer.cornerRadius = saveButton.frame.height/2
        
    }
    
}
