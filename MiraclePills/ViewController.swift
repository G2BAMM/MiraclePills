//
//  ViewController.swift
//  MiraclePills
//
//  Created by Brian McAulay on 13/03/2017.
//  Copyright © 2017 Brian McAulay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pkrState: UIPickerView!
    @IBOutlet weak var btnState: UIButton!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var lblPostcode: UILabel!
    @IBOutlet weak var txtPostcode: UITextField!
    
    let stateList = ["", "Strathclyde", "Edinburgh City", "Glasgow City", "North Lanarkshire", "South Lanarkshire"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pkrState.isHidden = true
        pkrState.dataSource = self
        pkrState.delegate = self
        txtCountry.clearsOnBeginEditing = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stateList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stateList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if stateList[row] != ""{
            btnState.setTitle(stateList[row], for: UIControlState.normal)
            pkrState.isHidden = true
            txtCountry.isHidden = false
            txtPostcode.isHidden = false
            lblCountry.isHidden = false
            lblPostcode.isHidden = false
            
        }
    }
    
    @IBAction func btnStateClick(_ sender: Any) {
        pkrState.isHidden = false
        txtCountry.isHidden = true
        txtPostcode.isHidden = true
        lblCountry.isHidden = true
        lblPostcode.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        if !pkrState.isHidden{
            pkrState.isHidden = true
            txtCountry.isHidden = false
            txtPostcode.isHidden = false
            lblCountry.isHidden = false
            lblPostcode.isHidden = false
        }
        
    }
    
}

