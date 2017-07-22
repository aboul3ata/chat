//
//  ViewController.swift
//  LynnBubbleTableViewDemo
//
//  Created by Colondee :D on 2015. 11. 3..
//  Copyright © 2015년 lou. All rights reserved.
//

import UIKit

class ViewController: UIViewController,LynnBubbleViewDataSource {
    
    @IBOutlet weak var tbBubbleDemo: LynnBubbleTableView!
    
    var arrChatTest:Array<LynnBubbleData> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        tbBubbleDemo.delegate = self
        tbBubbleDemo.bubbleDelegate = self
        tbBubbleDemo.bubbleDataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.testChatData()
    }
    
    
    
    func testChatData () {

        var messageMine = "Hey alexa"
        var messageSomeone = "Hey legend"
        
        let userMe = LynnUserData(userUniqueId: "123", userNickName: "me", userProfileImage: nil, additionalInfo: nil)
        let userSomeone = LynnUserData(userUniqueId: "234", userNickName: "Alexa", userProfileImage: UIImage(named: "ico_girlprofile"), additionalInfo: nil)
        let yesterDay = Date().addingTimeInterval(-60*60*24)

        
                //                let bubbleData:LynnBubbleData = LynnBubbleDataMine(userID: "123",userNickname: "me" , profile: nil, text: messageMine, image: nil, date: NSDate())
                
                let bubbleData:LynnBubbleData = LynnBubbleData(userData: userMe, dataOwner: .me, message: messageMine, messageDate: yesterDay)
                
                self.arrChatTest.append(bubbleData)
                messageMine += " " + messageMine

            

        
        
        messageMine = "How can I help you today"
        messageSomeone = "I dont know"
        let tommorow = Date().addingTimeInterval(60*60*24)
        
            

                
                let bubbleData2:LynnBubbleData = LynnBubbleData(userData: userSomeone, dataOwner: .someone, message: messageSomeone, messageDate: tommorow)
                self.arrChatTest.append(bubbleData2)
                messageSomeone += " " + messageSomeone

            
        
        self.tbBubbleDemo.reloadData()
 
    }
    
    func bubbleTableView(dataAt index: Int, bubbleTableView: LynnBubbleTableView) -> LynnBubbleData {
        return self.arrChatTest[index]
    }
    
    func bubbleTableView(numberOfRows bubbleTableView: LynnBubbleTableView) -> Int {
        return self.arrChatTest.count
    }
}

extension ViewController : LynnBubbleViewDelegate {

    
    

    // LATER ON. can use this to add action to when user presses alexa icon!
    
    func bubbleTableView(_ bubbleTableView: LynnBubbleTableView, didTouchedUserProfile userData: LynnUserData, at index: Int) {
        let alert = UIAlertController(title: nil, message: "UserProfile index : " + "\(index)", preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Close",
                                        style: .default) { (action: UIAlertAction!) -> Void in
        }
        alert.addAction(closeAction)
        self.present(alert, animated: true, completion: nil)
    }
}


