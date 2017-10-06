//
//  TestScene.swift
//  TMS
//
//  Created by Alberto Volpe on 17/09/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import SpriteKit
import CoreMotion

/**
 - Important: Se vuoi utilizzare questa classe, crea un file SpriteKit Scene nel progetto e nel custom class inspector indica i seguenti parametri:
 
 CustomClass: TestScene (Il nome di questa classe)
 Module: TMS (il nome del framework)
 */
open class TestScene: SKScene, Parallax, Objects {

        
    /* Parallax vars */
    internal var distantLayer: SKSpriteNode?
    internal var intermediateLayer: SKSpriteNode?
    internal var nearestLayer: SKSpriteNode?
    static internal let motionManager = CMMotionManager()
    
    override open func didMove(to view: SKView) {
        
//        distantLayer = LayoutOfLayer(type: .distant)
//        intermediateLayer = LayoutOfLayer(type: .intermediate)
//        nearestLayer = LayoutOfLayer(type: .nearest)
        
        distantLayer = SKSpriteNode(color: SKColor.white,
                                    size: Layer.distant.blockSize!)
        intermediateLayer =  SKSpriteNode(color: SKColor.white,
                                          size: Layer.intermediate.blockSize!)
        nearestLayer =  SKSpriteNode(color: SKColor.white,
                                     size: Layer.nearest.blockSize!)
        
        setSceneWithParallax()
        
        addChild(distantLayer!)
        addChild(intermediateLayer!)
        addChild(nearestLayer!)
    }
    
    open func testBackground() {
        background(visual: Resource(location: .project, nameOrURL: "Background"))
    }
    
    open func testBasicElement() {
        basicElement(visual: Resource(location: .project, nameOrURL: "Lion"),
                     scaleBy: 1.5,
                     quadrant: Quadrant(row: 2, col:3))
    }
    
    open func testElement() {
        element(visual: Resource(location: .remote, nameOrURL: "http://petprojects.altervista.org/assets/images/scene1/Flatwoods_monster.png"),
                scaleBy: 1.0,
                associateSound: Resource(location: .remote, nameOrURL: "http://petprojects.altervista.org/assets/leone.mp3"),
                quadrant: Quadrant(row: 3, col:3))
    }
    
    open func testInteractionableElement() {
        
        var h = Text()
        h.value["EN"] = "Hint EN"
        h.value["IT"] = "Hint IT"

        interactionableElement(visual: Resource(location: .remote, nameOrURL: "http://petprojects.altervista.org/assets/images/scene1/Flatwoods_monster.png"),
                               scaleBy: 1.0,
                               hint: h,
                               associateSound: Resource(location: .remote, nameOrURL: "http://petprojects.altervista.org/assets/leone.mp3"),
                               quadrant: Quadrant(row: 1, col:3))
    }
    
    open func testDraggableElement() {
        
        var h = Text()
        h.value["EN"] = "hintOnSuccess EN"
        h.value["IT"] = "hintOnSuccess IT"
        
        var h2 = Text()
        h2.value["EN"] = "hintOnFailure EN"
        h2.value["IT"] = "hintOnFailure IT"
        
        draggableElement(visual: Resource(location: .remote, nameOrURL: "http://petprojects.altervista.org/assets/images/scene1/Flatwoods_monster.png"),
                         scaleBy: 1.0,
                         hintOnSuccess: h,
                         hintOnFailure: h2,
                         originalQuadrant: Quadrant(row: 2, col:2),
                         destinationQuadrant: Quadrant(row: 2, col:2))
    }

    deinit {
        print("La scena \(type(of:self)) è stata rimossa dalla memoria (DEINIT)")
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesBegan(touches, with: event)
        for t in touches {
            let location = t.location(in: self)
            let node = self.atPoint(location)
            
            switch node {
            case is InteractionableElement:
                (node as! Interactionable).interactionBegan()
                (node as! AssociativeSound).play()
            case is DraggableElement:
                (node as! Interactionable).interactionBegan()
                (node as! DraggableSound).playDrag()
            case is Element:
                (node as! AssociativeSound).play()
            default:
                break
            }
        }
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesEnded(touches, with: event)
        for t in touches {
            let location = t.location(in: self)
            let node = self.atPoint(location)
            
            switch node {
            case is DraggableElement:
                (node as! Interactionable).interactionEnd()
                (node as! DraggableSound).playDrop()
                (node as! Draggable).checkPosition()
            case is InteractionableElement:
                (node as! Interactionable).interactionEnd()
            default:
                break
            }
        }
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesMoved(touches, with: event)
        for t in touches {
            let location = t.location(in: self)
            let node = self.atPoint(location)
            
            switch node {
            case is DraggableElement:
                (node as! Draggable).move(atPosition: location)
            default:
                break
            }
        }
    }
    
    override open func update(_ currentTime: CFTimeInterval) {}
}
