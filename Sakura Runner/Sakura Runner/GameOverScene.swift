//
//  GameOverScene.swift
//  Sakura Runner
//
//  Created by Justin Angelastro on 12/9/19.
//  Copyright © 2019 NYU. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    var score = Int(0)
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "gameOver")
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.size.height = frame.size.height
        background.size.width = frame.size.width
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = -2
        addChild(background)
        
        let buttonNode = SKSpriteNode(imageNamed: "returnHome")
        buttonNode.anchorPoint = CGPoint(x:0, y:0)
        buttonNode.name = "return"
        buttonNode.size = CGSize(width: 200, height: 80)
        buttonNode.position = CGPoint(x:(frame.width-200)/2, y: 50)
        buttonNode.zPosition = 1
        addChild(buttonNode)
        
        let scoreLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        scoreLabel.text = "\(score)"
        scoreLabel.fontSize = 40
        scoreLabel.fontColor = SKColor.black
        scoreLabel.zPosition = 3
        scoreLabel.position = CGPoint(x: frame.midX+100, y: frame.midY-50)
        addChild(scoreLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)

        if let name = touchedNode.name {
            if name == "return" {
                let backHome = HomeScene(size: frame.size)
                self.view?.presentScene(backHome)
                
            }
        }
    }
}
