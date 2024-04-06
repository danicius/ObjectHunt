//
//  GameController.swift
//  ObjectHunt
//
//  Created by Danielle Alvarez on 4/5/24.
//

import Foundation
import UIKit
import ARKit

class GameViewController: UIViewController {
    var promptLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

    func setupUI() {
        // Setup the prompt label
        promptLabel = UILabel(frame: CGRect(x: 20, y: 50, width: view.frame.size.width - 40, height: 50))
        promptLabel.textAlignment = .center
        promptLabel.font = UIFont.systemFont(ofSize: 24)
        promptLabel.textColor = .white
        promptLabel.text = "Find an iPhone!"
        view.addSubview(promptLabel)
    }

    func updatePrompt(withText text: String) {
        promptLabel.text = text
    }

    func objectDetected() {
        // Called when the object is detected
        updatePrompt(withText: "You found it! Tap to continue.")
        // Here, add other UI updates or transitions, such as a button to go to the next challenge
    }
}

