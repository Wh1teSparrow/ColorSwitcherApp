//
//  ViewController.swift
//  ColorSwitcherApp
//
//  Created by Kirill Syrtsev on 30.09.2023.
//

import UIKit

protocol SetViewControllerDelegate: AnyObject {
    func getColor(_ color: UIColor)
}

final class SetColorViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var color: CIColor!
    
    weak var delegate: SetViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = colorView.frame.height / 2
        
        setColorSlider()
        setupColor()
        
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    @IBAction func setupColorSliders() {
        let labels = [
            redLabel: redSlider,
            greenLabel: greenSlider,
            blueLabel: blueSlider
        ]
        
        for (key, value) in labels {
            key?.text = String(
                format: "%.2f",
                value?.value ?? ""
            )
        }
        
        setupColor()
        
    }

    @IBAction func doneButtonPressed() {
        delegate.getColor(colorView.backgroundColor ?? .white)
        
        dismiss(animated: true)
    }
}

extension SetColorViewController {
    private func setColorSlider() {
        redSlider.value = Float(color.red)
        greenSlider.value = Float(color.green)
        blueSlider.value = Float(color.blue)
        
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

