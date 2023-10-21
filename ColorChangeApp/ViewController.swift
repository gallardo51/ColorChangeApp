//
//  ViewController.swift
//  ColorChangeApp
//
//  Created by Александр Соболев on 21.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorChangeView: UIView!
    
    @IBOutlet weak var redCountLabel: UILabel!
    @IBOutlet weak var greenCountLabel: UILabel!
    @IBOutlet weak var blueCountLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorChangeView.backgroundColor = viewColor
        
        setColor()
        setValue(for: redCountLabel, greenCountLabel, blueCountLabel)
    }
    
    @IBAction func changeColorSliderAction(_ sender: UISlider) {
        
        switch sender {
        case redSlider: setValue(for: redCountLabel)
        case greenSlider: setValue(for: greenCountLabel)
        default: setValue(for: blueCountLabel)
        }
        
        setColor()
    }
    
}
extension ViewController {
    
    private func setColor () {
        colorChangeView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue (for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redCountLabel: label.text = string (from: redSlider)
            case greenCountLabel: label.text = string(from: greenSlider)
            default: label.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

// setSliders()
// private func setSliders () {
// let ciColor = CIColor(color: viewColor)
//
// redSlider.value = Float(ciColor.red)
// greenSlider.value = Float(ciColor.green)
// blueSlider.value = Float(ciColor.blue)
// }
