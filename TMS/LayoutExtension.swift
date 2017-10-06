//
//  LayoutExtension.swift
//  TMS
//
//  Created by Alberto Volpe on 06/09/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import SpriteKit


// N.B. La documentazione relativa ai metodi pubblici è stata definita nel file ___Protocols.swift .


extension Layout where Self: SKSpriteNode {
    
    /* https://stackoverflow.com/questions/33464925/draw-a-grid-with-spritekit */
    internal static func gridTexture(blockSize: CGSize, rows:Int, cols:Int) -> SKTexture? {
        // Add 1 to the height and width to ensure the borders are within the sprite
        let size = CGSize(width: CGFloat(cols) * blockSize.width,
                          height: CGFloat(rows) * blockSize.height)
        
        UIGraphicsBeginImageContext(size)
        guard let context = UIGraphicsGetCurrentContext() else {
            print("GridSystem Extension Error -> \(#function): guard context error \n")
            return nil
        }
        
        let bezierPath = UIBezierPath()
        let offset:CGFloat = 0.5
        
        // Draw vertical lines
        for i in 1..<cols {
            let x = CGFloat(i)*blockSize.width + offset
            bezierPath.move(to: CGPoint(x: x, y: 0))
            bezierPath.addLine(to: CGPoint(x: x, y: size.height))
        }
        
        // Draw horizontal lines
        for i in 1..<rows {
            let y = CGFloat(i)*blockSize.height + offset
            bezierPath.move(to: CGPoint(x: 0, y: y))
            bezierPath.addLine(to: CGPoint(x: size.width, y: y))
        }
        
        SKColor.white.setStroke()
        bezierPath.lineWidth = 1.0
        bezierPath.stroke()
        context.addPath(bezierPath.cgPath)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return SKTexture(image: image!)
    }
    
}
