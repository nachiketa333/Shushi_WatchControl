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
    
   
    @IBAction func timerButtom() {
    }
    
    
    @IBAction func rightButtonPressed() {
         if(counter % 2 != 0)
         {
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
        else
         {
            connectionLabel.setText("GAME STOPPED")
        }

    }
    
    @IBAction func leftButtonPressed() {
        if(counter % 2 != 0)
        {
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
        else
        {
            connectionLabel.setText("GAME STOPPED")
        }
    }
    
    var countdownTimer: Timer!
    var totalTime = 25

    
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateTime() {
        connectionLabel.setText("\(timeFormatted(totalTime))")
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
            counter = 2;
        }
    }
    
    func endTimer() {
        countdownTimer.invalidate()
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var counter:Int = 0

    @IBAction func pauseButtonPressed() {
       
        
        self.counter = self.counter + 1;
        print("counter\(counter)")
        
        if(counter % 2 == 0)
        {
           endTimer()
            
        }
        else
        {
            
            startTimer()
        }
        
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
