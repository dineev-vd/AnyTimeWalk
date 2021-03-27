//
//  AddMarkersViewController.swift
//  AnyTimeWalk
//
//  Created by Влад Динеев on 27.03.2021.
//

import UIKit
import YandexMapsMobile
import CoreData

class AddMarkersViewController: UIViewController, YMKMapCameraListener {
    @IBOutlet weak var mapView: YMKMapView!
    @IBOutlet weak var selectedObjectLabel: UILabel!
    var tourTable: UITableView!
    var markers: [Marker]!
    var currentPoint: YMKPoint = YMKPoint()
    var addTourViewController: AddTourController!
    
    func onCameraPositionChanged(with map: YMKMap, cameraPosition: YMKCameraPosition, cameraUpdateReason: YMKCameraUpdateReason, finished: Bool) {
        if(finished) {
            selectedObjectLabel.text = String(cameraPosition.target.latitude)
            currentPoint = cameraPosition.target
            navigationItem.rightBarButtonItem!.isEnabled = true
        } else {
            navigationItem.rightBarButtonItem!.isEnabled = false
        }
    }
    
    let TARGET_LOCATION = YMKPoint(latitude: 59.936760, longitude: 30.314673)
        
        override func viewDidLoad() {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(onDone))
            
            super.viewDidLoad()
            
            mapView.mapWindow.map.move(
                with: YMKCameraPosition(target: TARGET_LOCATION, zoom: 17, azimuth: 0, tilt: 0),
                animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 1),
                cameraCallback: nil)
            
            let map = mapView.mapWindow.map as YMKMap
            map.addCameraListener(with: self)
        }
    
    @objc func onDone() -> Void {
        let current = Marker(context: persistentContainer.viewContext)
        current.latitude = currentPoint.latitude
        current.longtitude = currentPoint.longitude
        current.name = ""
        saveContext()
       
        
        addTourViewController.tourMarkers.append(current)
        tourTable.reloadData()
    
        self.navigationController?.popViewController(animated: true)
    }
        
        func onObjectTap(with: YMKGeoObjectTapEvent) -> Bool {
            return false
        }
        
        func onMapTap(with map: YMKMap, point: YMKPoint) {
            mapView.mapWindow.map.deselectGeoObject()
        }
        
        func onMapLongTap(with map: YMKMap, point: YMKPoint) {
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
