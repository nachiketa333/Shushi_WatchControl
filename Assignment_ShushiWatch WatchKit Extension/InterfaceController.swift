//
//  InterfaceController.swift
//  Assignment_ShushiWatch WatchKit Extension
//
//  Created by Nachiketa Nachiketa on 2019-11-03.
//  Copyright © 2019 Nachiketa Nachiketa. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    @IBOutlet weak var connectionLabel: WKInterfaceLabel!
    
    @IBAction func rightButtonPressed() {
        
        if (WCSession.default.isReachable == true) {
            print("right Movement")
            // Here is the message you want to send
            // All messages get sent as dictionaries
            let message = ["movement":"rightTap"] as [String : Any]
            
            //  message
            WCSession.default.sendMessage(message, replyHandler:nil)
        }
        else
        {
            connectionLabel.setText("Cannot reach Phone!")
        }

    }
    
    @IBAction func leftButtonPressed() {
        
        if (WCSession.default.isReachable == true) {
            print("left Movement")
            // Here is the message you want to send
            // All messages get sent as dictionaries
            let message = ["movement":"leftTap"] as [String : Any]
            
            //  message
            WCSession.default.sendMessage(message, replyHandler:nil)
        }
        else
        {
            connectionLabel.setText("Cannot reach Phone!")
        }
    }
    
    @IBAction func pauseButtonPressed() {
        
    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        super.awake(withContext: context)
        
        
        // 1. Check if teh watch supports sessions
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
    }
        
    }
    
    override func willActivate() {
        
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
            // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
