//
//  ViewController.swift
//  TipPro
//
//  Created by Tassos Lambrou on 10/5/16.
//  Copyright © 2016 SsosSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  @IBOutlet weak var billAmountField: UITextField!
  
  @IBOutlet weak var tipSelector: UISegmentedControl!
  
  @IBOutlet weak var tipAmountField: UITextField!
  
  @IBOutlet weak var totalAmountField: UITextField!
  
  @IBAction func calculateTip(_ sender: AnyObject) {
    calculate()
  }
  
//  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//    calculate()
//    return true
//  }
  
  func calculate() {
    guard let billAmount = Double(billAmountField.text!) else {
      //show error
      billAmountField.text = ""
      tipAmountField.text = ""
      totalAmountField.text = ""
      return
    }
    
    var tipPercentage = 0.0
    
    switch tipSelector.selectedSegmentIndex {
    case 0:
      tipPercentage = 0.15
    case 1:
      tipPercentage = 0.18
    case 2:
      tipPercentage = 0.20
    default:
      break
    }
    
    let roundedBillAmount = round(100*billAmount)/100
    let tipAmount = roundedBillAmount * tipPercentage
    let roundedTipAmount = round(100*tipAmount)/100
    let totalAmount = roundedBillAmount + roundedTipAmount
    
    if (!billAmountField.isEditing) {
      billAmountField.text = String(format: "%.2f", roundedBillAmount)
    }
    tipAmountField.text = "$" + String(format: "%.2f", roundedTipAmount)
    totalAmountField.text = "$" + String(format: "%.2f", totalAmount)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

  }
  
  override func viewDidAppear(_ animated: Bool) {
    UIApplication.shared.statusBarView?.backgroundColor = #colorLiteral(red: 0.09317999333, green: 0.6117136478, blue: 0.8447505832, alpha: 1)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.billAmountField.endEditing(true)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

class BorderedButton: UIButton {
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    layer.cornerRadius = 5.0
    
  }
}

extension UIApplication {
  var statusBarView: UIView? {
    return value(forKey: "statusBar") as? UIView
  }
}

extension UISegmentedControl {
  
  
  
}


