//
//  GameScene.swift
//  Sakura Runner
//
//  Created by Justin Angelastro on 11/18/19.
//  Copyright © 2019 NYU. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    let background = SKSpriteNode(imageNamed: "Background Screen.png")
    let ground = SKSpriteNode(imageNamed: "Ground.png")
    let player = SKSpriteNode(imageNamed: "Running0.png")
    var shurikenValsY = [Double]()
    
    struct PhysicsCategory {
        static let none      : UInt32 = 0
        static let all       : UInt32 = UInt32.max
        static let platform   : UInt32 = 0b1
        static let pointy: UInt32 = 0b10 //spikes and shuriken
        static let player_shuriken: UInt32 = 0b100
        static let player: UInt32 = 0b1000
    }

    override func didMove(to view: SKView) {
        
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -1)
        physicsWorld.contactDelegate = self
        
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.size.height = size.height
        background.size.width = size.width
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = -2
        addChild(background)
        
        ground.size = CGSize(width: size.width, height: 5*size.height/32)
        ground.position = CGPoint(x: 0, y: -7*size.height/16)
        ground.zPosition = -1
        ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
        ground.physicsBody?.isDynamic = false
        ground.physicsBody?.categoryBitMask = PhysicsCategory.platform
        ground.physicsBody?.collisionBitMask = PhysicsCategory.player
        addChild(ground)
        
        player.size = CGSize(width: size.width/4, height: size.height/2)
        player.position = CGPoint(x: player.size.width-size.width/2, y: ground.position.y+ground.size.height+player.size.height/16)
        player.zPosition = 0
        player.physicsBody = SKPhysicsBody(texture: SKTexture.init(imageNamed: "Running0.png"), size: player.size)
        player.physicsBody?.isDynamic = false
        player.physicsBody?.categoryBitMask = PhysicsCategory.player
        player.physicsBody?.collisionBitMask = PhysicsCategory.platform
        player.physicsBody?.contactTestBitMask = PhysicsCategory.pointy
        addChild(player)
        
        let numPoints = 5
        let doubleH = Double(size.height)
        let fixed1 = Double(numPoints)
        let fixed2 = doubleH/fixed1
        for index in -numPoints/2+1...numPoints/2 {
            if index != 0 {
                shurikenValsY.append(Double(index)*fixed2)
            }
        }
        
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(spawnShuriken),
                SKAction.wait(forDuration: 3.0),
                SKAction.run(spawnPlatform),
                SKAction.wait(forDuration: 2.0)
            ])
        ))
    }
    
    func randomSpikes() -> Int {
        return Int.random(in: 0...3)
        //Key: 0 -> no spikes, 1 -> top spikes, 2 -> bottom spikes, 3 -> both spikes
    }
    
    func randomShurikenY() -> CGFloat {
        return CGFloat(shurikenValsY[Int.random(in: 0..<shurikenValsY.count)])
    }
    
    func spawnShuriken() {
        let shur = SKSpriteNode(imageNamed: "Shuriken.png")
        
        shur.size = CGSize(width: size.height/20, height: size.height/20)
        
        let posY = randomShurikenY()
        shur.position = CGPoint(x: size.width + shur.size.width/2, y: posY)
        
        shur.zPosition = 0
        
        shur.physicsBody = SKPhysicsBody(rectangleOf: shur.size)
        shur.physicsBody?.isDynamic = false
        shur.physicsBody?.categoryBitMask = PhysicsCategory.pointy
        shur.physicsBody?.contactTestBitMask = PhysicsCategory.player
        
        addChild(shur)
        
        let duration = CGFloat(5.0)
        
        let spin = SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(2*Double.pi), duration: 1.0))
        shur.run(spin)
        
        let move = SKAction.move(to: CGPoint(x: -shur.size.width/2-size.width/2, y: posY),
                                       duration: TimeInterval(duration))
        let remove = SKAction.removeFromParent()
        shur.run(SKAction.sequence([move, remove]))
        
    }
    
    func spawnPlatform() {
        let plat = SKSpriteNode(imageNamed: "Small Platform.png")
        
        plat.size = CGSize(width: size.width/8, height: size.height/20)
        
        plat.position = CGPoint(x: size.width + plat.size.width/2, y: 0)
        
        plat.zPosition = 1
        
        plat.physicsBody = SKPhysicsBody(rectangleOf: plat.size)
        plat.physicsBody?.isDynamic = false
        plat.physicsBody?.categoryBitMask = PhysicsCategory.platform
        plat.physicsBody?.collisionBitMask = PhysicsCategory.player
        
        addChild(plat)
        
        let duration = CGFloat(6.0)
        
        let move = SKAction.move(to: CGPoint(x: -plat.size.width/2-size.width/2, y: 0),
                                 duration: TimeInterval(duration))
        let remove = SKAction.removeFromParent()
        plat.run(SKAction.sequence([move, remove]))
        
        let spikeNum = randomSpikes()
        
        if (spikeNum == 1 || spikeNum == 3) {
            let topSpike = SKSpriteNode(imageNamed: "Free Spikes.png")
            topSpike.size = CGSize(width: plat.size.width, height: plat.size.height*1.5)
            topSpike.position = CGPoint(x: plat.position.x, y: plat.position.y+topSpike.size.height/2)
            topSpike.zPosition = 0
            topSpike.physicsBody = SKPhysicsBody(rectangleOf: topSpike.size)
            topSpike.physicsBody?.isDynamic = false
            topSpike.physicsBody?.categoryBitMask = PhysicsCategory.pointy
            topSpike.physicsBody?.contactTestBitMask = PhysicsCategory.player
            addChild(topSpike)
            
            let topMove = SKAction.move(to: CGPoint(x: -topSpike.size.width/2-size.width/2, y: topSpike.position.y), duration: TimeInterval(duration))
            topSpike.run(SKAction.sequence([topMove, remove]))
        }
        if (spikeNum == 2 || spikeNum == 3) {
            let bottomSpike = SKSpriteNode(imageNamed: "Free Spikes.png")
            bottomSpike.size = CGSize(width: plat.size.width, height: plat.size.height*1.5)
            bottomSpike.position = CGPoint(x: plat.position.x, y: plat.position.y-bottomSpike.size.height/2)
            bottomSpike.zPosition = 0
            bottomSpike.zRotation = CGFloat(Double.pi)
            bottomSpike.physicsBody = SKPhysicsBody(rectangleOf: bottomSpike.size)
            bottomSpike.physicsBody?.isDynamic = false
            bottomSpike.physicsBody?.categoryBitMask = PhysicsCategory.pointy
            bottomSpike.physicsBody?.contactTestBitMask = PhysicsCategory.player
            addChild(bottomSpike)
            
            let bottomMove = SKAction.move(to: CGPoint(x: -bottomSpike.size.width/2-size.width/2, y: bottomSpike.position.y), duration: TimeInterval(duration))
            bottomSpike.run(SKAction.sequence([bottomMove, remove]))
        }
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

extension GameScene: SKPhysicsContactDelegate {}
