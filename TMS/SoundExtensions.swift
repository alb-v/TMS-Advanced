//
//  SoundExtensions.swift
//  TMS
//
//  Created by Alberto Volpe on 01/08/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//


// N.B. La documentazione relativa ai metodi pubblici è stata definita nel file ___Protocols.swift .

import AVFoundation

extension Playable {
    
    func play() { audioStream?.player?.play() }
    
    func pause() { audioStream?.player?.pause() }
    
    func stop() { audioStream?.player?.stop() }
}



extension DraggableSound {
    
    func playDrag() { audioStreamDrag.player?.play() }
    
    func playDrop() { audioStreamDrop.player?.play() }
}


extension AVAudioPlayer {
    convenience public init?(_ sound: Resource) throws {
        
        switch sound.location {
        case .remote:
            let data = try Data(contentsOf: URL(string: sound.nameOrURL)!)
            try self.init(data: data)
        case .framework:
            let tmsBundle = Bundle(for: StoryScene.self)
            let url = tmsBundle.url(forResource: sound.nameOrURL, withExtension: "mp3")!
            try self.init(contentsOf: url)
        case .project:
            print(sound.nameOrURL)
            let url = Bundle.main.url(forResource: sound.nameOrURL, withExtension: "mp3")!
            try self.init(contentsOf: url)
        }
    }
}

