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
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            settingButton()
        }
    }

    @objc func goToSettings(sender: UIButton!) {
          self.performSegue(withIdentifier: "gameover", sender: self)
      }
      
      func settingButton() {
          let button = UIButton(frame: CGRect(x:(self.view.frame.size.width-200)/2, y:(self.view.frame.size.height-40)/2, width: 200, height: 50))
          let image = UIImage(named: "settings") as UIImage?
          button.setImage(image, for: .normal)
          button.addTarget(self, action: #selector(goToSettings), for: .touchUpInside);
          self.view.addSubview(button)
      }
    override var shouldAutorotate: Bool {
        return true
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
