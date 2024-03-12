//
//  GameScene.swift
//  midGameChen
//
//  Created by ALVIN CHEN on 3/5/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var player: SKSpriteNode!
    var car: SKSpriteNode!
    let cam = SKCameraNode()
    var gameOver = false
    var restriction = false


    var invisFollower: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        player = (self.childNode(withName: "player") as! SKSpriteNode)
        invisFollower = (self.childNode(withName: "follower") as! SKSpriteNode)
        self.camera = cam
        self.physicsWorld.contactDelegate = self
        invisFollower.position.x = player.position.x
        invisFollower.position.y = player.position.y
        

        
    }
        
    override func update(_ currentTime: TimeInterval) {
        
        cam.position.x = invisFollower.position.x
        cam.position.y = invisFollower.position.y + 500
        
        if (player.position.y >= invisFollower.position.y + 600){
            print("moving")
            let moveFollower = SKAction.moveTo(y: player.position.y, duration: 1)
            invisFollower.run(moveFollower)

        }

        enumerateChildNodes(withName: "car") { [self]
                         (node, _) in
            car = node as? SKSpriteNode
            car.physicsBody?.velocity.dx = -400
            if car.position.x < -480{
                car.position.x = 480
            }

        }

        
        
        
    }
    

    func didBegin(_ contact: SKPhysicsContact) {
        
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "car") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "car"){
            player.physicsBody?.allowsRotation = true
            player.physicsBody?.friction = 0.5
            gameOver = true
            GameOver()
            
            
            }
            
        
        

        
        
        
    }
    
    
    
    
    
    
    func jump(){
        if gameOver == false{
            player.physicsBody?.allowsRotation = false
            player.physicsBody?.friction = 0
            let jumpAction = SKAction.moveBy(x: 0, y: 100, duration: 0.3)
            player.run(jumpAction)
        }
    }
    func GameOver(){
        player.physicsBody?.velocity.dy = 0
        restriction = true
    
    }
    func drive(){
        car.physicsBody?.velocity.dx = -500
        if car.position.x < -480{
            car.position.x = 480
        }
    }

    
    
}
