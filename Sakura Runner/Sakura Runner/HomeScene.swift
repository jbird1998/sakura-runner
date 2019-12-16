//
//  HomeScene.swift
//  Sakura Runner
//
//  Created by Soyoung Choi on 12/9/19.
//  Copyright © 2019 NYU. All rights reserved.
//

import SpriteKit
import GameplayKit

class HomeScene: SKScene {
    
    var runner = SKSpriteNode()
    var runnerFrames: [SKTexture] = []

    override func didMove(to view: SKView) {
        //create background, animations, and buttons
        let background = SKSpriteNode(imageNamed: "background")
       background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
       background.size.width = frame.size.width
       background.size.height = frame.size.height
       background.position = CGPoint(x: frame.midX, y: frame.midY)
       background.zPosition = -2
       addChild(background)
        if Sound.isVolumeOn {
            Sound.playSound()
        }
        let startButton = SKSpriteNode(imageNamed: "start")
        startButton.anchorPoint = CGPoint(x: 0, y: 0)
        startButton.name = "start"
        startButton.size.width = 200
        startButton.size.height = 80
        startButton.position = CGPoint(x:(frame.width-200)/2, y:50)
        startButton.zPosition = 3
        addChild(startButton)
        
        let settingButton = SKSpriteNode(imageNamed: "settings")
        settingButton.anchorPoint = CGPoint(x: 0, y: 0)
        settingButton.name = "setting"
        settingButton.size.width = 200
        settingButton.size.height = 50
        settingButton.position = CGPoint(x: (frame.width-200)/2, y: 150)
        startButton.zPosition = 3
        addChild(settingButton)
        
        let sakuraAnimation = sakuraAnimate()
        sakuraAnimation.name = "sakuraLayer"
        self.view?.layer.addSublayer(sakuraAnimation)
        
        let highScoreLabel = SKLabelNode(fontNamed: "Ninja Naruto")
        let highScore = UserDefaults.standard.object(forKey: "highScore") as? Int ?? 0
        highScoreLabel.text = "High Score: \(highScore)M"
        highScoreLabel.fontSize = 20
        highScoreLabel.fontColor = SKColor.black
        highScoreLabel.zPosition = 5
        highScoreLabel.position = CGPoint(x: frame.midX+frame.size.width/3, y: frame.midY-frame.size.height/3)
        addChild(highScoreLabel)
        
        buildRunner()
        animateRunner()
    
    }
    func buildRunner() {
        //build and display the runner node from an atlas
        let runnerAtlas = SKTextureAtlas(named: "Running")
        var runFrames: [SKTexture] = []
        let num = runnerAtlas.textureNames.count
        for i in 0...num-2 {
            if i < 10 {
                let runnerTexture = "frame_0\(i)_delay-0.03s.png"
                runFrames.append(runnerAtlas.textureNamed(runnerTexture))
            } else {
                let runnerTexture = "frame_\(i)_delay-0.03s.png"
                runFrames.append(runnerAtlas.textureNamed(runnerTexture))
            }
        }
        runnerFrames = runFrames
        let firstFrame = runnerFrames[0]
        runner = SKSpriteNode(texture: firstFrame)
        runner.position = CGPoint(x: 140, y: 190)
        addChild(runner)
    }
    
    func animateRunner() {
        //animate the runner
        runner.run(SKAction.repeatForever(SKAction.animate(with: runnerFrames, timePerFrame: 0.05, resize: true, restore: true)), withKey: "runningRunner")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //determine whether the player is trying to start the game, access settings, or neither
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {
            if name == "start" {
                for layer in (self.view?.layer.sublayers!)! {
                    if layer.name == "sakuraLayer" {
                        layer.removeFromSuperlayer()
                    }
                }
                let gameScene = GameScene(fileNamed: "GameScene")
                self.view?.presentScene(gameScene)
            }
            if name == "setting" {
                for layer in (self.view?.layer.sublayers!)! {
                    if layer.name == "sakuraLayer" {
                        layer.removeFromSuperlayer()
                    }
                }
                let settingScene = SettingsScene(size: frame.size)
                self.view?.presentScene(settingScene)
            }
        }
        
    }
    
    func sakuraAnimate() -> CAEmitterLayer {
        // create a sakura falling sprites layer
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
        sakuraLayer.emitterPosition = CGPoint(x: frame.width/2, y: 50)
        sakuraLayer.emitterSize = CGSize(width: frame.width, height: 2)
        sakuraLayer.emitterCells = [sakuraCell]
        return sakuraLayer
        
    }
    
    
    
}
