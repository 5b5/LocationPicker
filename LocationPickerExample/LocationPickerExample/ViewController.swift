//
//  ViewController.swift
//  LocationPickerExample
//
//  Created by Jerome Tan on 3/29/16.
//  Copyright © 2016 Jerome Tan. All rights reserved.
//

import UIKit
import LocationPicker
import MapKit

class ViewController: UIViewController, LocationPickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func presentLocationPickerButtonDidTap(sender: UIButton) {
        let locationPicker = LocationPicker()
        locationPicker.delegate = self
        
        let navigationController = UINavigationController(rootViewController: locationPicker)
        locationPicker.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(doneButtonDidTap(_:)))
        presentViewController(navigationController, animated: true, completion: nil)
    }
    
    func doneButtonDidTap(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func locationDidSelect(mapItem: MKMapItem) {
        locationPicked(mapItem)
    }
    
    func locationPicked(mapItem: MKMapItem) {
        
    }

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "LocationPicker" {
            let locationPicker = segue.destinationViewController as! LocationPicker
            locationPicker.completion = { selectedMapItem in
                self.locationPicked(selectedMapItem)
            }
        }
    }

}
