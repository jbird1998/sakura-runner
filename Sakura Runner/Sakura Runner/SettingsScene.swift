//
//  SettingsScene.swift
//  Sakura Runner
//
//  Created by Justin Angelastro on 12/9/19.
//  Copyright © 2019 NYU. All rights reserved.
//

import SpriteKit

class SettingsScene: SKScene {
    var isOn = true
    override func sceneDidLoad() {
        super.sceneDidLoad()
        assignbackground()
        returnHomeButton()
        musicToggle()
    }
    
    func assignbackground() {
        let background = SKSpriteNode(imageNamed: "settingBackground")
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.size.height = frame.size.height
        background.size.width = frame.size.width
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = -2
        addChild(background)
    }
    
    func returnHomeButton() {
        let buttonNode = SKSpriteNode(imageNamed: "returnHome")
        buttonNode.name = "returnHome"
        buttonNode.size = CGSize(width: 200, height: 80)
        buttonNode.position = CGPoint(x:(self.view!.frame.size.width-200)/2, y: 250)
        addChild(buttonNode)
    }
    
    
    @objc func toggle(sender: UIButton) {
        for child in self.children {
            if (child.name != "soundButton") { return }
            let node = child as? SKSpriteNode
            if (isOn) {
                isOn = false;
                node!.texture = SKTexture(imageNamed: "off")
                Sound.stopSound()
            } else {
                isOn = true;
                node!.texture = SKTexture(imageNamed: "on")
                Sound.playSound()
            }
        }
    }
    
    func musicToggle() {
        let buttonNode = SKSpriteNode(imageNamed: "on")
        buttonNode.name = "soundButton"
        buttonNode.size = CGSize(width: 100, height: 50)
        buttonNode.position = CGPoint(x:(self.view!.frame.size.width+250)/2, y: (self.view!.frame.size.height-80)/2)
        addChild(buttonNode)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        let nodeName = touchedNode.name
        
        if nodeName == "returnHome" {
            let backHome = HomeScene(fileNamed: "HomeScene")
            self.view?.presentScene(backHome!)
        } else if nodeName == "soundButton" {
            
        }
    }
}
