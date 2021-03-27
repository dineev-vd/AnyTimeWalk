//
//  AddTourController.swift
//  AnyTimeWalk
//
//  Created by Влад Динеев on 27.03.2021.
//

import UIKit


// Создание экскурсии
class AddTourController: UIViewController {
    @IBOutlet var tourName:UITextInput!
    @IBOutlet var tourDescription:UITextInput!
    @IBOutlet var tourMarkers:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onMarkersAdd() {
        performSegue(withIdentifier: "addMarkers", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
