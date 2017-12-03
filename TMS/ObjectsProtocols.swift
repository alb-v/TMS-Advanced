//
//  ObjectsProtocol.swift
//  TMS
//
//  Created by Alberto Volpe on 10/09/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import SpriteKit

protocol Objects {
    func background(visual: Resource)
    
    func draggableElement(visual: Resource,
                          nextSceneID: String?,
                          scaleBy s: CGFloat,
                          hintOnSuccess hs: Text,
                          hintOnFailure hf: Text,
                          originalQuadrant oQ: Quadrant,
                          destinationQuadrant dQ: Quadrant)
    
    func interactionableElement(visual: Resource,
                                nextSceneID: String?,
                                scaleBy s: CGFloat,
                                hint h: Text,
                                associateSound aS: Resource,
                                quadrant q: Quadrant)
    
    func element(visual: Resource,
                 scaleBy s: CGFloat,
                 associateSound aS: Resource,
                 quadrant q: Quadrant)
    
    func basicElement(visual: Resource,
                      scaleBy s: CGFloat,
                      quadrant q: Quadrant)
}


