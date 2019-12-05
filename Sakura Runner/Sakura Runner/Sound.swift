//
//  Sound.swift
//  Sakura Runner
//
//  Created by Soyoung Choi on 12/5/19.
//  Copyright © 2019 NYU. All rights reserved.
//
import AVFoundation
struct Sound {
    static var isVolumeOn = true
    static var AudioPlayer = AVAudioPlayer()
    static func playSound() {
        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "music", ofType: "mp3")!)
        AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        AudioPlayer.prepareToPlay()
        AudioPlayer.numberOfLoops = -1
        AudioPlayer.play()
    }
    static func stopSound() {
        AudioPlayer.stop()
    }
}
