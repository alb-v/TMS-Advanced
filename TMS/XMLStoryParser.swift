//
//  XMLParser.swift
//  TellMeStories
//
//  Created by Alberto Volpe on 28/08/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation
import CheatyXML

//Put .remote....there is .project only for demo purpose

open class XMLStoryParser {
    
    private var parser: CXMLParser
    private var identifiers: XMLSchemeTags?
    private var story = StoryData()
    
    public init(ofUrl url: URL) {
        
        parser = CXMLParser(contentsOfURL: url)!
    }
    
    public func getStory() throws -> StoryData {
        
        try identifiers = XMLSchemeTags.get(ofVersion: parser.rootElement.attribute("tms:xmlSchema").string!)
        try readStoryInfo()
        
        let elementID = try identifiers!.scenes()
        let subElementID = try identifiers!.scene()
        for element in parser[elementID][subElementID].array {
            try story.scenes[element.attribute(identifiers!.sceneID()).stringValue] = getScene(fromElement: element)
        }
        
        return story
    }

    private func readStoryInfo() throws {
        
        try story.authorID = parser.rootElement.attribute(identifiers!.authorID()).string
        try story.storyID = parser.rootElement.attribute(identifiers!.storyID()).string
        try story.cover = parser.rootElement.attribute(identifiers!.cover()).string
        try story.sound = Resource(location: .remote, nameOrURL: parser.rootElement.attribute(identifiers!.sound()).string!)
        
        try story.title = getTranslations(fromElements: parser.rootElement[identifiers!.title()][identifiers!.text()].array)
        try story.description = getTranslations(fromElements: parser.rootElement[identifiers!.description()][identifiers!.text()].array)
        
        let elementID = try identifiers!.languages()
        let subElementID = try identifiers!.language2()
        for element in parser.rootElement[elementID][subElementID].array {
            story.languages.append(element.string)
        }
    }

    private func getTranslations(fromElements textElements: [CXMLTag]) throws -> Text {
        
        let elementID = try identifiers!.value()
        let attributeID = try identifiers!.language()
            
        var d = Text()
        
        for text in textElements {
            d.value[text.attribute(attributeID).stringValue] = text[elementID].stringValue
        }
            
        return d
    }
    
    private func getScene(fromElement element: CXMLTag) throws -> SceneData {
        
        var s = SceneData()
        
        try s.background = element.attribute(identifiers!.background()).stringValue
        try s.loadCover(link: element.attribute(identifiers!.cover()).stringValue)
        try s.title = getTranslations(fromElements: element[identifiers!.title()][identifiers!.text()].array)
        try s.hint = getTranslations(fromElements: element[identifiers!.hint()][identifiers!.text()].array)
        
        for child in element[try identifiers!.objects()].makeIterator() {

            let position = try Quadrant(row: child[identifiers!.positionable()].attribute(identifiers!.row()).int!,
                                    col: child[identifiers!.positionable()].attribute(identifiers!.col()).int!)
            let visual = try child.attribute(identifiers!.visual()).string!

            switch child.tagName {
            case try identifiers!.draggableElement():
                let nextSceneID = try child.attribute(identifiers!.nextSceneID()).string
                let hintOnFailure = try getTranslations(fromElements: child[identifiers!.hintOnFailure()][identifiers!.text()].array)
                let hintOnSuccess = try getTranslations(fromElements: child[identifiers!.hintOnSuccess()][identifiers!.text()].array)
                try s.draggableElements.append(DraggableData(hintOnFailure: hintOnFailure,
                                                             hintOnSuccess: hintOnSuccess,
                                                             visual: visual,
                                                             position: position,
                                                             nextSceneID: nextSceneID,
                                                             destination: Quadrant(row: child[identifiers!.destination()].attribute(identifiers!.row()).int!,
                                                            col: child[identifiers!.destination()].attribute(identifiers!.col()).int!)))
                
            case try identifiers!.interactionableElement():
                let nextSceneID = try child.attribute(identifiers!.nextSceneID()).string
                let hint = try getTranslations(fromElements: child[identifiers!.hint()][identifiers!.text()].array)
                try s.interactionableElements.append(InteractionableData(visual: visual,
                                                                         position: position,
                                                                         nextSceneID: nextSceneID,
                                                                         sound: child[identifiers!.associativeSound()].attribute(identifiers!.sound()).string!,
                                                                         hint: hint))
                
            case try identifiers!.element():
                try s.elements.append(ElementData(visual: visual,
                                                  position: position,
                                                  sound: child[identifiers!.associativeSound()].attribute(identifiers!.sound()).string!))

            case try identifiers!.basicElement():
                s.basicElements.append(BasicElementData(visual: visual, position: position))
                
            default:
                print("\(child.tagName) Tipo di elemento non riconosciuto")
            }
        }
        
        return s
    }
}
