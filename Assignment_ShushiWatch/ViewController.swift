//
//  ViewController.swift
//  Assignment_ShushiWatch
//
//  Created by Nachiketa Nachiketa on 2019-11-03.
//  Copyright © 2019 Nachiketa Nachiketa. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size:self.view.bounds.size)
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        
        // property to show hitboxes
        skView.showsPhysics = true
        
        skView.presentScene(scene)
    }
    
    
}
