//
//  ColorViewController.swift
//  ColorSwitcherApp
//
//  Created by Kirill Syrtsev on 20.10.2023.
//

import UIKit

final class ColorViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let setColorVC = segue.destination as? SetColorViewController else { return }
        setColorVC.color = CIColor(color: view.backgroundColor ?? .white)
        setColorVC.delegate = self
    }
}

extension ColorViewController: SetViewControllerDelegate {
    func getColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
