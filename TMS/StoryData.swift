//
//  StoryData.swift
//  TMS Test
//
//  Created by Alberto Volpe on 28/08/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

public struct StoryData {
    
    /* Dichiararle tutte optional per garantire la retrocompatibilità */
    public var storyID: String?
    public var authorID: String?
    public var cover: String?
    public var sound: Resource?
    
    public var title = Text()
    public var description = Text()
    public var scenes = Dictionary<String, SceneData>()
    
    public var languages = [String?]()
    
    
}
