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
    static var jumpAudioPlayer = AVAudioPlayer()
    static var slideAudioPlayer = AVAudioPlayer()
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
    static func playJumpSound() {
        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Jump", ofType: "mp3")!)
        jumpAudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        jumpAudioPlayer.prepareToPlay()
        jumpAudioPlayer.numberOfLoops = 0
        jumpAudioPlayer.play()
    }
    static func playSlideSound() {
        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Slide", ofType: "mp3")!)
        slideAudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        slideAudioPlayer.prepareToPlay()
        slideAudioPlayer.numberOfLoops = 0
        slideAudioPlayer.play()
    }
}
