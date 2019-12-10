//
//  GameViewController.swift
//  Sakura Runner
//
//  Created by Justin Angelastro on 11/18/19.
//  Copyright © 2019 NYU. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = HomeScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = false
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if let view = self.view as? SKView {
            view.presentScene(nil)
        }
    }
    
   override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
   }
   
   override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
   }
    override var shouldAutorotate: Bool {
        return true
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
