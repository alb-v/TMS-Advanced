//
//  Player.swift
//  TMS
//
//  Created by Alberto Volpe on 06/09/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import AVFoundation

/** Gestice la riproduzione di una traccia sonora.
    - Important: Per ridurre l'utilizzo di memoria il player è di tipo AVAudioPlayer al posto di SKAction.playSoundFileNamed e SKAudioNode.
    - Author: Volpe Alberto
    - Version: 1.0 */
open class Player{
    
    /** Player */
    internal var player: AVAudioPlayer?
    
    /**
     Inizializza il player e il volume.
     - Parameters:
        - resourceName: il nome del file da riprodurre.
        - volume: il livello sonoro a cui riprodurre la traccia sonora.
     - Author: Volpe Alberto
     - Version: 1.0
     */
    public init(_ sound: Resource, withVolume volume: Float?) {
        
        do {
            player = try AVAudioPlayer(sound)
            guard let p = player else { return }
            
            p.prepareToPlay()
            
            if volume != nil {
                p.volume = volume!
            }else {
                print("Player Class Error -> \(#function):\nLivello volume = 0.\n")
                p.volume = 0
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
