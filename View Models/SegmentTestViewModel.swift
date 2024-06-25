//
//  SegmentTestViewModel.swift
//  OptiiOSApp
//
//  Created by Grant Matthews on 6/20/24.
//

import Foundation
import Segment
import Optimizely

class SegmentTestViewModel: ObservableObject{
    
    var analytics: Analytics? = nil
    var analyticsInitialized: String = "False"
    var optimizely: OptimizelyClient? = nil
    var optimizelyInitialized: String = "False"
    
    var userId: String = "default_user"
    var attributes: [String: Any] = [:]
    
    var optiUser: OptimizelyUserContext? = nil
    
    func setUserId(new_userId: String){
        self.userId = new_userId
        print("User ID now Equals: " + userId)
    }
    
    func addUserAttribute(name: String, value: Any){
        self.attributes[name] = value
        print("Attributes now Equal: ")
        print(attributes)
    }
    
    func initSegment(){
        let config = Configuration(writeKey: Globals.segmentSDKKey)
            // Automatically track Lifecycle events
            .trackApplicationLifecycleEvents(true)
            .flushAt(3)
            .flushInterval(10)

        self.analytics = Analytics(configuration: config)
        self.analyticsInitialized = "True"
        print("Segment Initialized")
    }
    
    func identifySegment(){
        analytics?.identify(userId: self.userId, traits: self.attributes)
        print("User ID now Equals: " + userId)
        print("Attributes now Equal: ")
        print(attributes)
        print("Segment Identify Call Made")
    }
    
    func trackSegment(name: String){
        analytics?.track(name: name)
        print("Segment Track Call Made: " + name)
    }
    
    func initOptimizely(){
        self.optimizely = OptimizelyClient(sdkKey: Globals.optimizelySDKKey)
        do{
            try self.optimizely!.start()
            self.optimizelyInitialized = "True"
            print("Optimizely Initialized")
        }
        catch{
            print("Optimizely Failed to Initialize")
        }
    }
    
    func setOptimizelyUser(){
        self.optiUser = self.optimizely?.createUserContext(userId: self.userId, attributes: self.attributes)
        print("User ID now Equals: " + userId)
        print("Attributes now Equal: ")
        print(attributes)
        print("Optimizely User Context Created")
        print(optiUser)
        
    }
    
    func decideOptimizely(flagKey : String) -> OptimizelyDecision{
        let decision = optiUser!.decide(key: flagKey)
        print("Optimizely Decided on Flag: " + flagKey)
        print(decision)
        return(decision)
    }
    
}
