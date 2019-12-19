# Sakura Runner
Sakura Runner final iOS Project Documentation

## Authors: Justin Angelastro and So-Young Choi

## Project Title: Sakura Runner

## Overview of the iPhone App 

Sakura Runner is an endless runner-style game where the player can run, dodge, or slice through obstacles to reach a high score or the longest distance run. Once the runner comes in contact with an obstacle, the game is over. The game involves two simple actions: swiping down and swiping up. The player can swipe down to dodge and swipe up to jump. The default action is running. The player runs against a beautiful Japanese Sakura backdrop in a Naruto run pose.

The game involves many features including calming Japanese anime background music, and settings to turn the sound played for each player action or interaction on or off. The user can tap the “Start” button on the home screen to start the game. During the game, there will be score label that shows the distance being run at the top of the screen. When the player comes in contact with an obstacle, the game is over, and the game over scene will be shown with the final distance.

## User Instructions 

The main purpose of the game is to reach the highest distance run shown by the high score. The default action of the player is running. The player can swipe up to jump, and swipe down to dodge, and these actions can be called to avoid obstacles. If the player runs into a sakura flower, the player gets sakura power, and runs twice as fast without coming in contact with any obstacles. When the player runs into any other object, the game is over, and the user can press a button to go back to the home screen. 

## Compilation and Installation Instructions 

Press the play button on XCode to run simulator

## APIs Called / Technical Specification 
* Collision Detections
    - SKPhysicsBody, SKPhysicsContactDelegate, CategoryBitMask
* User Interaction 
    - UISwipeGestureRecognizer
* High Score 
    - UserDefaults 
* Sound 
    - AVAudioPlayer
* Animation 
    - SKSpriteNode, SKTextureAtlas, SKAction for player animations 
    - Falling sakura animation - CAEmitterLayer, CAEmitterCell 
    - Graphics - Pivot, Pixelmator 
    
## App Logo
![App Logo](https://github.com/jbird1998/sakura-runner/blob/master/Sakura%20Runner/appLogoSakuraRunner.png){:height="50%" width="50%"}

## Overall Logic and High-Level Flowchart 

### Landing Scene 
![Landing Page](https://github.com/jbird1998/sakura-runner/blob/master/Sakura%20Runner/landingpage.png){:height="50%" width="50%"}
    
This is the scene that appears when the game launches.
The user can view their highest score. 
When the user clicks on the Settings button, he/she is led to the settings scene. 
    
### Settings Scene 
![Setting Scene](/https://github.com/jbird1998/sakura-runner/blob/master/Sakura%20Runner/settings.png){:height="50%" width="50%"}

Here the user can toggle the background music on and off. The user can click on the return home button to go back to the landing scene. 

### Game Scene 
![Game Scene](https://github.com/jbird1998/sakura-runner/blob/master/Sakura%20Runner/gamescene.png){:height="50%" width="50%"}

The player can swipe up to jump and swipe down to slide in order to avoid obstacles.
The default action for the player is running. 

When the player encounters a sakura plower, he gets sakura power. 

![Sakura Scene](https://github.com/jbird1998/sakura-runner/blob/master/Sakura%20Runner/sakurapage.png){:height="50%" width="50%"}

The player with sakura power runs twice as fast and can run past obstacles. 

When the player comes in contact with an obstacle, the game is over. 

### Game Over Scene 
![Game Over Scene](https://github.com/jbird1998/sakura-runner/blob/master/Sakura%20Runner/gameover.png){:height="50%" width="50%"}

The player can view their score, and go back to the home screen to restart game.

### High-Level Flowchart 
![Flowchart](https://github.com/jbird1998/sakura-runner/blob/master/Sakura%20Runner/flowchart.png){:height="50%" width="50%"}

## Responsibilities and Roles

### Justin Angelastro: 
    - Game Scene
    - Graphics of the game player
    - App logo
    
### So-Young Choi: 
    - Landing Scene, Settings Scene, Game Over Scene 
    - Poster 
    - Powerpoint Presentation 
    
## Future of the App and Additional Features to be Implemented in the Coming Months

### Future of the App 
* Posted on Github public repository
* Deploy to App Store with further changes 

### Additional Features to be Implemented 
* Function for the player to temporarily pause or restart the game during the game
* Japanese words put on the screen as animated and dynamic effects following each player action 
* A personalization setting for the player, where the game user can create his/her player to his/her liking, including features such as gender, facial characteristics, clothing, and different weapons. 
* 3-dimensional animation in game using tools such as Unity or Blender

## Sources of existing code / images / assets

* Images: 
    - Sakura Flower https://www.pngkit.com/view/u2t4t4e6o0a9e6r5_flower-pink-pixel-tumblr-fundo-tumblrgirl-cherry-blossom/
    - Start Button https://www.pikpng.com/pngvi/Twmxmw_start-button-for-game-parallel-hd-png-download/
    - Game Over Text  https://pngimage.net/gameover-png-3/
    - Sakura Trees https://www.pngguru.com/free-transparent-background-png-clipart-kgvnd/download

* Sound: 
    - Inuyasha OST 3 - Hutari No Kimochi (Two Hearts) https://www.youtube.com/watch?v=Xce2aLq1shM

* Code References / Guidance / Tutorials 
    - Sakura Falling Animation - https://www.hackingwithswift.com/example-code/calayer/how-to-emit-particles-using-caemitterlayer
    - Using SKTextureAtlas to animate player - https://www.raywenderlich.com/144-spritekit-animations-and-texture-atlases-in-swift 
    - Using TouchesBegan to make SpriteNodes act as Buttons - https://stackoverflow.com/questions/38192205/create-button-in-spritekit-swift
    - Creating SKScoreLabels - https://sweettutos.com/2017/03/09/build-your-own-flappy-bird-game-with-swift-3-and-spritekit/
