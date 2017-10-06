//
//  VisualExtensions.swift
//  TMS
//
//  Created by Alberto Volpe on 01/08/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import SpriteKit

// N.B. La documentazione relativa ai metodi pubblici è stata definita nel file ___Protocols.swift .
extension Scalable where Self: SKSpriteNode {
    func getScaled(size: CGSize, by: CGFloat) -> CGSize {
        return CGSize(width: size.width * by, height: size.height * by)
    }
}

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    
    public func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

extension UIImage {
    convenience public init?(_ visual: Resource) {
        
        switch visual.location {
        case .remote:
            do{
                //Remote
                let data = try Data(contentsOf: URL(string: visual.nameOrURL)!)
                self.init(data: data)!
            
            } catch let error {
                
                //Image not Found
                let tmsBundle = Bundle(for: StoryScene.self)
                self.init(named: "ImageNotFound", in: tmsBundle, compatibleWith: nil)!
            }
        case .project:
            self.init(named: visual.nameOrURL)
        case .framework:
            let tmsBundle = Bundle(for: StoryScene.self)
            self.init(named: visual.nameOrURL, in: tmsBundle, compatibleWith: nil)!
        }
    }
}
