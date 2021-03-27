//
//  AddTourController.swift
//  AnyTimeWalk
//
//  Created by Влад Динеев on 27.03.2021.
//

import UIKit
import CoreData

// Создание экскурсии
class AddTourController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tourName:UITextInput!
    @IBOutlet var tourDescription:UITextInput!
    var tourMarkers: [Marker] = []
    @IBOutlet var markersTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onMarkersAdd() {
        performSegue(withIdentifier: "addMarkers", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addMarkers") {
            if let addTourController = segue.destination as? AddMarkersViewController {
                addTourController.markers = tourMarkers
                addTourController.tourTable = markersTable
                addTourController.addTourViewController = self
            }
        }
    }
    
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection
                                section: Int) -> Int {
        
        print(tourMarkers.count)
        return tourMarkers.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath:
                                IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Marker", for:
                                                    indexPath)
        let tour = tourMarkers[indexPath.row]
        cell.textLabel!.text = String(tour.longtitude)
        cell.detailTextLabel!.text = String(tour.latitude)
        return cell
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "AnyTimeWalk")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
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
