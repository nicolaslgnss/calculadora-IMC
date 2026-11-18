//
//  ViewController.swift
//  calculadora-IMC
//
//  Created by Turno Mananas on 16/11/2026.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDescripciónLabel: UILabel!
    
    var height = 160.0
    var weight = 70.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightChanged(_ sender: UISlider) {
        height = Double(sender.value).rounded()
        heightLabel.text = "\(Int(height))"
    }
    
    @IBAction func weightChanged(_ sender: UIStepper) {
        weight = sender.value
        weightLabel.text = "\(Int(weight))"
    }
    
    @IBAction func calculateBMI(_ sender: Any){
        let heightInMeters = height / 100
        let result = weight / pow(heightInMeters, 2)
        resultLabel.text = String(format: "%.2f", result)
        
        switch result {
        case 0..<18.5:
            resultDescripciónLabel.text = "Bajo peso"
            resultDescripciónLabel.textColor = UIColor.bmiUnderweight
            resultLabel.textColor = UIColor.bmiUnderweight
        case 18.5..<25.0:
            resultDescripciónLabel.text = "Peso normal"
            resultDescripciónLabel.textColor = UIColor.bmiNormal
            resultLabel.textColor = UIColor.bmiNormal
        case 25.0..<30.5:
            resultDescripciónLabel.text = "Sobrepeso"
            resultDescripciónLabel.textColor = UIColor.bmiOverweight
            resultLabel.textColor = UIColor.bmiOverweight
        case 30.0..<35.0:
            resultDescripciónLabel.text = "Obesidad"
            resultDescripciónLabel.textColor = UIColor.bmiObesity
            resultLabel.textColor = UIColor.bmiObesity
        default:
            resultDescripciónLabel.text = " Obesidad extrema"
            resultDescripciónLabel.textColor = UIColor.bmiExtremeObesity
            resultLabel.textColor = UIColor.bmiExtremeObesity
        }
    }
}
