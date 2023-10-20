//
//  ViewController.swift
//  ColorSwitcherApp
//
//  Created by Kirill Syrtsev on 30.09.2023.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = colorView.frame.height / 2
        
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        
        setupColor()
    }
    
    @IBAction func setupColorSliders() {
        let labels = [redLabel: redSlider, greenLabel: greenSlider, blueLabel: blueSlider]
        
        for (key, value) in labels {
            key?.text = String(
                format: "%.2f",
                value?.value ?? ""
            )
        }
        
        setupColor()
        
    }
    
    private func setupColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}
