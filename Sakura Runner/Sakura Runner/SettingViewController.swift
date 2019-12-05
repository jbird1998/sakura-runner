//
//  SettingViewController.swift
//  Sakura Runner
//
//  Created by Soyoung Choi on 12/4/19.
//  Copyright © 2019 NYU. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class SettingViewController: UIViewController {
    var isOn = true
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        returnHomeButton()
        musicToggle()
    }
    
    func assignbackground() {
        let background = UIImage(named: "settingBackground")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    @objc func segueBack(sender: UIButton!) {
        self.performSegue(withIdentifier: "backHome", sender: self)
    }
    
    func returnHomeButton() {
        let button = UIButton(frame: CGRect(x:(self.view.frame.size.width-200)/2, y: 250, width: 200, height: 80))
        let image = UIImage(named: "returnHome") as UIImage?
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(segueBack), for: .touchUpInside);
        self.view.addSubview(button)
    }
    
    
    @objc func toggle(sender: UIButton) {
        if (isOn) {
            isOn = false;
            let image = UIImage(named: "off") as UIImage?
            sender.setImage(image, for: .normal)
            Sound.stopSound()
        } else {
            isOn = true;
            let image = UIImage(named: "on") as UIImage?
            sender.setImage(image, for: .normal)
            Sound.playSound()
        }
    }
    
    func musicToggle() {
        let button = UIButton(frame: CGRect(x:(self.view.frame.size.width+250)/2, y: (self.view.frame.size.height-80)/2, width: 100, height: 50))
        let image = UIImage(named: "on") as UIImage?
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(toggle), for: .touchUpInside);
        self.view.addSubview(button)
    }
    
}

