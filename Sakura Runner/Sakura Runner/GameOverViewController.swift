//
//  GameOverViewController.swift
//  Sakura Runner
//
//  Created by Soyoung Choi on 12/5/19.
//  Copyright © 2019 NYU. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameOverViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        sakuraAnimate()
        returnHomeButton()
    }
    
    @objc func segueBack(sender: UIButton!) {
       self.performSegue(withIdentifier: "backHome2", sender: self)
   }
   
   func returnHomeButton() {
       let button = UIButton(frame: CGRect(x:(self.view.frame.size.width-200)/2, y: 300, width: 200, height: 80))
       let image = UIImage(named: "returnHome") as UIImage?
       button.setImage(image, for: .normal)
       button.addTarget(self, action: #selector(segueBack), for: .touchUpInside);
       self.view.addSubview(button)
   }
    
    func assignbackground() {
           let background = UIImage(named: "gameOver")
           var imageView : UIImageView!
           imageView = UIImageView(frame: view.bounds)
           imageView.contentMode = UIView.ContentMode.scaleAspectFill
           imageView.clipsToBounds = true
           imageView.image = background
           imageView.center = view.center
           view.addSubview(imageView)
           self.view.sendSubviewToBack(imageView)
       }
    
    func sakuraAnimate() {
           let sakuraCell = CAEmitterCell()
           sakuraCell.contents = UIImage(named: "flower")?.cgImage
           sakuraCell.lifetime = 7
           sakuraCell.scale = 0.4
           sakuraCell.birthRate = 1
           sakuraCell.velocity = CGFloat(25)
           sakuraCell.emissionLongitude = 180*(.pi/180)
           sakuraCell.spin = -0.5
           let sakuraLayer = CAEmitterLayer()
           sakuraLayer.emitterShape = CAEmitterLayerEmitterShape.line
           sakuraLayer.emitterPosition = CGPoint(x: view.frame.width/2, y: 50)
           sakuraLayer.emitterSize = CGSize(width: view.frame.width, height: 2)
           sakuraLayer.emitterCells = [sakuraCell]
           view.layer.addSublayer(sakuraLayer)
       }
}

