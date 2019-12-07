//
//  HomeViewController.swift
//  Sakura Runner
//
//  Created by Soyoung Choi on 12/4/19.
//  Copyright © 2019 NYU. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class HomeViewController: UIViewController {
    
    private lazy var animationView = SKView()
    
    override func loadView() {
        super.loadView()
        view.addSubview(animationView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard animationView.scene == nil else {
            return
        }
        animationView.allowsTransparency = true
        let scene = makeScene()
        animationView.frame.size = scene.size
        animationView.presentScene(scene)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Sound.playSound()
        //let value = UIInterfaceOrientation.landscapeLeft.rawValue
        //UIDevice.current.setValue(value, forKey: "orientation")
        assignbackground()
        settingButton()
        startButton()
        sakuraAnimate()
    }
    
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    
    override var shouldAutorotate: Bool {
        return true
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
    
    @objc func goToSettings(sender: UIButton!) {
        self.performSegue(withIdentifier: "setting", sender: self)
    }
    
    func settingButton() {
        let button = UIButton(frame: CGRect(x:(self.view.frame.size.width-200)/2, y:(self.view.frame.size.height-40)/2, width: 200, height: 50))
        let image = UIImage(named: "settings") as UIImage?
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(goToSettings), for: .touchUpInside);
        self.view.addSubview(button)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        self.performSegue(withIdentifier: "start", sender: self)
    }
    
    func startButton() {
        let button = UIButton(frame: CGRect(x:(self.view.frame.size.width-200)/2, y:250, width: 200, height: 80))
        let image = UIImage(named: "start") as UIImage?
        button.setImage(image, for: .normal)
      
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside);
        
        self.view.addSubview(button)
    }
    
    func assignbackground() {
        let background = UIImage(named: "background")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func makeScene() -> SKScene {
        let minDimension = min(view.frame.width, view.frame.height)
        let size = CGSize(width: minDimension, height: minDimension)
        let scene = SKScene(size: size)
        scene.backgroundColor = .clear
        var runner = SKSpriteNode()
        var runnerFrames: [SKTexture] = []
        func buildRunner() {
            let runnerAtlas = SKTextureAtlas(named: "Running")
            var runFrames: [SKTexture] = []
            let num = runnerAtlas.textureNames.count
            for i in 0...num-1 {
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
            runner.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)
            scene.addChild(runner)
        }
        buildRunner()
        func animateRunner() {
            runner.run(SKAction.repeatForever(SKAction.animate(with: runnerFrames, timePerFrame: 0.05, resize: true, restore: true)), withKey: "runningRunner")
        }
        animateRunner()
        return scene
    }
}
