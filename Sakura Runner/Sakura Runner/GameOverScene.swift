//
//  GameOverScene.swift
//  Sakura Runner
//
//  Created by Justin Angelastro on 12/9/19.
//  Copyright © 2019 NYU. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        assignbackground()
        sakuraAnimate()
        returnHomeButton()
    }
    
    func returnHomeButton() {
        let buttonNode = SKSpriteNode(imageNamed: "returnHome")
        buttonNode.name = "returnHome"
        buttonNode.size = CGSize(width: 200, height: 80)
        buttonNode.position = CGPoint(x:(self.view!.frame.size.width-200)/2, y: 300)
        addChild(buttonNode)
    }
    
    func assignbackground() {
        let background = SKSpriteNode(imageNamed: "gameOver")
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.size.height = frame.size.height
        background.size.width = frame.size.width
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = -2
        addChild(background)
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
        sakuraLayer.emitterPosition = CGPoint(x: view!.frame.width/2, y: 50)
        sakuraLayer.emitterSize = CGSize(width: view!.frame.width, height: 2)
        sakuraLayer.emitterCells = [sakuraCell]
        view!.layer.addSublayer(sakuraLayer)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)

        let nodeName = touchedNode.name
        
        if nodeName == "returnHome" {
            let backHome = HomeScene(fileNamed: "HomeScene")
            self.view?.presentScene(backHome!)
        }
    }
}
