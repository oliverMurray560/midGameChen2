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
    
    var tester2 = 0
    var test = 0
    
    var car: SKSpriteNode!
    var car2: SKSpriteNode!
    var car3: SKSpriteNode!
    var car4: SKSpriteNode!
    var car5: SKSpriteNode!
    var car6: SKSpriteNode!
    var car7: SKSpriteNode!
    var car8: SKSpriteNode!
    let cam = SKCameraNode()
    var gameOver = false
    var winLoseOutlet: SKLabelNode!
    var timeLabel: SKLabelNode!
    var gameTimer = 0
    var timer = Timer()
    var debugTeleport = 0.0


    var invisFollower: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        startTimer()
        timeLabel = (self.childNode(withName: "timeLabel") as! SKLabelNode)
        timeLabel.fontSize = 30
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
        
        
        // adjust sizes to fit each type later
        
        enumerateChildNodes(withName: "car") { [self]
                         (node, _) in
            car = node as? SKSpriteNode
            car.texture = SKTexture(imageNamed: "car")
            car.size.width = 80
            car.size.height = 60
            car.physicsBody?.mass = 100000

        }

        enumerateChildNodes(withName: "car2") { [self]
                         (node, _) in
            car2 = node as? SKSpriteNode
            car2.texture = SKTexture(imageNamed: "car2")
            car2.size.width = 80
            car2.size.height = 60
            car2.physicsBody?.mass = 100000

        }
        
        enumerateChildNodes(withName: "car3") { [self]
                         (node, _) in
            car3 = node as? SKSpriteNode
            car3.texture = SKTexture(imageNamed: "car3")
            car3.size.width = 141.008
            car3.size.height = 90.07
            car3.physicsBody?.mass = 100000

        }
        
        enumerateChildNodes(withName: "car4") { [self]
                         (node, _) in
            car4 = node as? SKSpriteNode
            car4.texture = SKTexture(imageNamed: "car4")
            car4.size.width = 175.001
            car4.size.height = 100.119
            car4.physicsBody?.mass = 100000

        }
        
        enumerateChildNodes(withName: "car5") { [self]
                         (node, _) in
            car5 = node as? SKSpriteNode
            car5.texture = SKTexture(imageNamed: "car5")
            car5.size.width = 113.976
            car5.size.height = 60.289
            car5.physicsBody?.mass = 100000

        }
        
        //6 is gonna be the special one
        enumerateChildNodes(withName: "car6") { [self]
                         (node, _) in
            car6 = node as? SKSpriteNode
            car6.texture = SKTexture(imageNamed: "car6")
            car6.size.width = 80
            car6.size.height = 60
            car6.physicsBody?.mass = 100000

        }
        
        enumerateChildNodes(withName: "car7") { [self]
                         (node, _) in
            car7 = node as? SKSpriteNode
            car7.texture = SKTexture(imageNamed: "car7")
            car7.size.width = 305.364
            car7.size.height = 185.43
            car7.physicsBody?.mass = 100000

        }
        
        enumerateChildNodes(withName: "car8") { [self]
                         (node, _) in
            car8 = node as? SKSpriteNode
            car8.texture = SKTexture(imageNamed: "car8")
            car8.size.width = 800
            car8.size.height = 127.072
            car8.physicsBody?.mass = 100000

        }
        
        
    }
        
    override func update(_ currentTime: TimeInterval) {
        timeLabel.text = "Time: \(gameTimer)"
        timeLabel.position.y = cam.position.y + 550
        timeLabel.position.x = cam.position.x + 200
        cam.position.x = invisFollower.position.x
        cam.position.y = invisFollower.position.y + 500
        winLoseOutlet.position.y = cam.position.y
        
        if (player.position.y >= invisFollower.position.y + 600){
            let moveFollower = SKAction.moveTo(y: player.position.y, duration: 1)
            invisFollower.run(moveFollower)

        }
        
        //these cars go left

        enumerateChildNodes(withName: "car") { [self]
                         (node, _) in
            car = node as? SKSpriteNode
            car.physicsBody?.velocity.dx = -350
            car.physicsBody?.velocity.dy = 0
            
            if car.position.x < -480{
                car.position.x = 480
            }

        }
        
        enumerateChildNodes(withName: "car5") { [self]
                         (node, _) in
            car5 = node as? SKSpriteNode
            car5.physicsBody?.velocity.dx = -500
            car5.physicsBody?.velocity.dy = 0
            
            if car5.position.x < -480{
                car5.position.x = 480
            }

        }
        
        enumerateChildNodes(withName: "car7") { [self]
                         (node, _) in
            car7 = node as? SKSpriteNode
            car7.physicsBody?.velocity.dx = -800
            car7.physicsBody?.velocity.dy = 0
            
            if car7.position.x < -900{
                car7.position.x = 900
            }

        }

        
        
        
        //going right cars go below
        
        enumerateChildNodes(withName: "car2") { [self]
                         (node, _) in
            car2 = node as? SKSpriteNode
            car2.physicsBody?.velocity.dx = 350
            car2.physicsBody?.velocity.dy = 0
            
            
            if car2.position.x > 480{
                car2.position.x = -480
            }

        }
        
        enumerateChildNodes(withName: "car3") { [self]
                         (node, _) in
            car3 = node as? SKSpriteNode
            car3.physicsBody?.velocity.dx = 400
            car3.physicsBody?.velocity.dy = 0
            
            
            if car3.position.x > 480{
                car3.position.x = -480
            }

        }
        
        enumerateChildNodes(withName: "car4") { [self]
                         (node, _) in
            car4 = node as? SKSpriteNode
            car4.physicsBody?.velocity.dx = 450
            car4.physicsBody?.velocity.dy = 0
            
            
            if car4.position.x > 480{
                car4.position.x = -480
            }

        }
        
        enumerateChildNodes(withName: "car6") { [self]
                         (node, _) in
            car6 = node as? SKSpriteNode
            car6.physicsBody?.velocity.dx = 1000
            car6.physicsBody?.velocity.dy = 0
            
            //optional for 6, special features needed
            if car6.position.x > 480{
                car6.position.x = -480
            }

        }
        
        enumerateChildNodes(withName: "car8") { [self]
                         (node, _) in
            car8 = node as? SKSpriteNode
            car8.physicsBody?.velocity.dx = 300
            car8.physicsBody?.velocity.dy = 0
            
            if car8.position.x > 1000{
                car8.position.x = -1000
            }

        }
        
        



        
        
        
    }
    
    func crash(){
        winLoseOutlet.text = "You Died"
        player.physicsBody?.allowsRotation = true
        player.physicsBody?.friction = 0.5
        player.removeAllActions()
        gameOver = true
        GameOver()
    }

    func didBegin(_ contact: SKPhysicsContact) {
        
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "car") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "car"){
            
            crash()
            
            }
        
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "car2") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "car2"){
            
            crash()
            
            }
        
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "car3") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "car3"){
            
            crash()
            
            }
        
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "car4") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "car4"){
            
            crash()
            
            }
        
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "car5") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "car5"){
            
            crash()
            
            }
        
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "car6") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "car6"){
            
            //special feature later
            
            }
            
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "car7") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "car7"){
            
            crash()
            
            }
        
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "car8") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "car8"){
            
            crash()
            
            }
        
        

        
        
        
    }
    
    
    
    
    func startTimer()  {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        gameTimer += 1
    }
    func jump(){
        if gameOver == false{
            let jumpAction = SKAction.moveBy(x: 0, y: 100, duration: 0.3)
            player.run(jumpAction)
        }
    }
    func GameOver(){
        player.physicsBody?.velocity.dy = 0

    
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
        player.position.y = -795.332
        player.position.x = 1.456
        invisFollower.position.y = player.position.y
        player.removeAllActions()
        let rotateAction = SKAction.rotate(toAngle: 0, duration: 0)
        player.run(rotateAction)
        invisFollower.removeAllActions()
        gameTimer = 0
    }
    
    func debugTeleportation(){
        
        player.physicsBody?.velocity.dx = 0
        player.physicsBody?.velocity.dy = 0
        gameOver = false
        winLoseOutlet.text = ""
        player.physicsBody?.friction = 0
        player.zPosition = 0
        player.zRotation = 0
        player.physicsBody?.allowsRotation = false
        player.position.y = debugTeleport
        player.position.x = 1.456
        invisFollower.position.y = player.position.y
        player.removeAllActions()
        let rotateAction = SKAction.rotate(toAngle: 0, duration: 0)
        player.run(rotateAction)
        invisFollower.removeAllActions()
        gameTimer = 0
    }

    
    
}
