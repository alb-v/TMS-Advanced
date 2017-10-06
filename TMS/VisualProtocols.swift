//
//  VisualProtocols.swift
//  TMS
//
//  Created by Alberto Volpe on 01/08/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

/** Definizione delle proprietà e dei metodi utili al ridimensionamento di una immagine.
 - Author: Volpe Alberto
 - Version: 1.0 */
protocol Scalable {
    
    /**
     Modifica la size dell'immagine.
     - Parameters:
        - size: La size attuale.
        - by: Lo scalare (x2, x3).
     - returns: La nuova size
     - Author: Volpe Alberto
     - Version: 1.0 */
    func getScaled(size: CGSize, by: CGFloat) -> CGSize
}
