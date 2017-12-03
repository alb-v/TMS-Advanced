//
//  ObjectsExtension.swift
//  TMS
//
//  Created by Alberto Volpe on 10/09/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import SpriteKit

extension Objects where Self: Parallax {
    
    func background(visual: Resource) {
        addToScene(Background(visual: visual))
    }
    
    func draggableElement(visual: Resource,
                          nextSceneID: String?,
                        scaleBy s: CGFloat,
                        hintOnSuccess hs: Text,
                        hintOnFailure hf: Text,
                        originalQuadrant oQ: Quadrant,
                        destinationQuadrant dQ: Quadrant) {
    
        addToScene(DraggableElement(visual: visual,
                                    nextSceneID: nextSceneID,
                                    hintOnSuccess: hs,
                                    hintOnFailure: hf,
                                    scaleBy: s,
                                    originalQuadrant: oQ,
                                    destinationQuadrant: dQ))
    }
    
    func interactionableElement(visual: Resource,
                                nextSceneID: String?,
                                scaleBy s: CGFloat,
                                hint h: Text,
                                associateSound aS: Resource,
                                quadrant q: Quadrant) {
        
        addToScene(InteractionableElement(visual: visual,
                                          nextSceneID: nextSceneID,
                                          hint: h,
                                          scaleBy: s,
                                          associateSound: aS,
                                          quadrant: q))
    }
    
    func element(visual: Resource,
                 scaleBy s: CGFloat,
                 associateSound aS: Resource,
                 quadrant q: Quadrant) {
        
        addToScene(Element(visual: visual,
                           scaleBy: s,
                           associateSound: aS,
                           quadrant: q))
    }
    
    func basicElement(visual: Resource,
                      scaleBy s: CGFloat,
                      quadrant q: Quadrant) {
        
        addToScene(BasicElement(visual: visual,
                                scaleBy: s,
                                quadrant: q))
    }
}
