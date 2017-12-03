# TMS: TellMeStories Framework
TMS is an iOS framework designed to elaborate an XML file that describes a story and create an interactive one for iPad.
Here you can see a little presentation about it: https://www.slideshare.net/albertovolpe9/tellmestories
Here there is a document that explain everything: https://www.slideshare.net/albertovolpe9/tesi-di-laurea-in-informatica

# Fruition of the Story 

## Dependecies
CheatyXML framework https://github.com/lobodart/CheatyXML

## Manual Installation
To install this, simply add the .xcodeproj to your project, and do not forget to link the .framework.

Whenever you want to use it in your code, simply type :

``` 
    import TMS
``` 


## Step1
Create a SceneKit file and in the Custom Class Inspector panel put the following parameters:
- CustomClass: StoryScene
- Module: TMS

## Step2
Create a ViewController of the Scene and add in the viewDidLoad() the following call in oreder to load a scene

``` 
    (scene as! StoryScene).create(s: s!, language: language!)
``` 

## Step3
In order to pass between scenes you have to insert the following method in the ViewController:

``` 
    func openScene(ID: String){
        
        let nextScene = SKScene(fileNamed: "StoryScene")

        (nextScene as! StoryScene).tView = tView
        (nextScene as! StoryScene).sceneViewController = self
        (nextScene as! StoryScene).create(s: scenes![ID]!, language: language!)

        let transition = SKTransition.reveal(with: .left, duration: 1.0)
        nextScene?.scaleMode = .resizeFill
        scene?.view?.presentScene(nextScene!, transition: transition)
        scene = nextScene
     }  
``` 

## Step 4
Before calling and instantiating the ViewController, load the story using the XMLStoryParser object:

``` 
    let xmlSP = XMLStoryParser(ofUrl: URL(string: "place here th url where there is the xml description of the story")!)
``` 

And catch any possible error findend in the parsing activity:

``` 
    do {
       let storyData = try xmlSP.getStory()
       let destination = segue.destination as! StoryViewController
       destination.story = storyData
   }catch let error as XMLSchemeTagsError {
       //print(error.errorMsg)
    } catch {
       //print("Error")
    }
``` 

# Creation of the story

## Schema XSD
The story.xsd file is the XSD Schema that you have to use in order to create the description of the story
The main nodes are explained in the presentation and in the document linked before.
Use editors like Eclipse EE in order to create the story.
You have to load on a remote server the xml file and the linked resources like images and audio files.


