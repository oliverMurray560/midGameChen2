//
//  GameScene.swift
//  midGameChen
//
//  Created by ALVIN CHEN on 3/5/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var hi = 0
    var player: SKSpriteNode!
    var car: SKSpriteNode!
    let cam = SKCameraNode()
    var gameOver = false
    var restriction = false
    var winLoseOutlet: SKLabelNode!


    var invisFollower: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        winLoseOutlet = (self.childNode(withName: "statusLabel") as! SKLabelNode)
        winLoseOutlet.fontSize = 100
        winLoseOutlet.text = ""
        player = (self.childNode(withName: "player") as! SKSpriteNode)
        invisFollower = (self.childNode(withName: "follower") as! SKSpriteNode)
        self.camera = cam
        self.physicsWorld.contactDelegate = self
        invisFollower.position.x = player.position.x
        invisFollower.position.y = player.position.y
        winLoseOutlet.position.x = player.position.x
        enumerateChildNodes(withName: "car") { [self]
                         (node, _) in
            car = node as? SKSpriteNode
            car.texture = SKTexture(imageNamed: "car")
            car.size.width = 80
            car.size.height = 60
            car.physicsBody?.mass = 100000

        }

        
    }
        
    override func update(_ currentTime: TimeInterval) {
        
        cam.position.x = invisFollower.position.x
        cam.position.y = invisFollower.position.y + 500
        winLoseOutlet.position.y = cam.position.y
        
        if (player.position.y >= invisFollower.position.y + 600){
            let moveFollower = SKAction.moveTo(y: player.position.y, duration: 1)
            invisFollower.run(moveFollower)

        }

        enumerateChildNodes(withName: "car") { [self]
                         (node, _) in
            car = node as? SKSpriteNode
            car.physicsBody?.velocity.dx = -350
            car.physicsBody?.velocity.dy = 0
            if car.position.x < -480{
                car.position.x = 480
            }

        }

        
        
        
    }
    

    func didBegin(_ contact: SKPhysicsContact) {
        
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "car") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "car"){
            winLoseOutlet.text = "You Died"
            player.physicsBody?.allowsRotation = true
            player.physicsBody?.friction = 0.5
            player.removeAllActions()
            gameOver = true
            GameOver()
            
            
            }
            
        
        

        
        
        
    }
    
    
    
    
    
    
    func jump(){
        if gameOver == false{
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
    
    func restart(){
        player.physicsBody?.velocity.dx = 0
        player.physicsBody?.velocity.dy = 0
        gameOver = false
        winLoseOutlet.text = ""
        player.physicsBody?.friction = 0
        player.zPosition = 0
        player.zRotation = 0
        player.physicsBody?.allowsRotation = false
        player.position.y = -652
        player.position.x = 0
        invisFollower.position.y = player.position.y
        player.removeAllActions()
        invisFollower.removeAllActions()
    }

    
    
}
