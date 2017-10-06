//
//  LayoutOfLayer.swift
//  TMS
//
//  Created by Alberto Volpe on 06/09/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import SpriteKit

/** Realizza il layout di un singolo layer e disegna i quadranti.
    - Important: Medoto da utilizzare solo durante il testing del parallax. Per ridurre il consumo di memoria la griglia non viene realizzata, è astratta. Inoltre, quando viene disegnata la griglia, gli elementi sui layer sottostanti al primo non sono interagibili.
    - Author: Volpe Alberto
    - Version: 1.0 */
class LayoutOfLayer: SKSpriteNode, Layout {
    
    var rows: Int = 0
    var cols: Int = 0
    var blockSize: CGSize = CGSize(width: 0, height: 0)
    
    convenience init(type t: Layer){
        
        if let texture = LayoutOfLayer.gridTexture(blockSize: t.blockSize!, rows: t.rows, cols: t.columns){
            self.init(texture: texture, color:SKColor.clear, size: texture.size())
        }else {
            self.init(color: SKColor.clear, size: t.blockSize!)
        }
        
        blockSize = t.blockSize!
        rows = t.rows
        cols = t.columns
    }
}
