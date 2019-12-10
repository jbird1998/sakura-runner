//
//  SettingsScene.swift
//  Sakura Runner
//
//  Created by Justin Angelastro on 12/9/19.
//  Copyright © 2019 NYU. All rights reserved.
//

import SpriteKit

class SettingsScene: SKScene {
    
    var musicButton = SKSpriteNode()
           
    let background = SKSpriteNode(imageNamed: "settingBackground")
    
    override func didMove(to view: SKView) {
       
       background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
       background.size.height = frame.size.height
       background.size.width = frame.size.width
       background.position = CGPoint(x: frame.midX, y: frame.midY)
       background.zPosition = -2
       addChild(background)
        
        let returnButton = SKSpriteNode(imageNamed:"returnHome")
        returnButton.anchorPoint = CGPoint(x: 0, y:0)
        returnButton.name = "returnHome"
        returnButton.size.width = 200
        returnButton.size.height = 80
        returnButton.position = CGPoint(x:(frame.width-200)/2, y: 50)
        returnButton.zPosition = 3
        addChild(returnButton)
    
        
        if Sound.isVolumeOn {
            musicButton.texture = SKTexture(imageNamed:"on")
           
        } else {
            musicButton.texture = SKTexture(imageNamed: "off")
            
        }
        musicButton.name = "musicBtn"
       musicButton.anchorPoint = CGPoint(x: 0, y: 0)
       musicButton.size.width = 100
       musicButton.size.height = 50
       musicButton.position = CGPoint(x:(frame.width+250)/2, y: (frame.height-30)/2)
        addChild(musicButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {
            if name == "returnHome" {
                let homeScene = HomeScene(size: frame.size)
                
                self.view?.presentScene(homeScene)
            }
            else if name == "musicBtn" {
                if Sound.isVolumeOn {
                    Sound.stopSound()
                    musicButton.texture = SKTexture(imageNamed: "off")
                    Sound.isVolumeOn = false
                    
                } else {
                    Sound.playSound()
                    musicButton.texture = SKTexture(imageNamed: "on")
                    Sound.isVolumeOn = true
                    
                }
            }
        }
 
    }
    

}
