//
//  ViewController.swift
//  togetherTable
//
//  Created by rubl333 on 2016/5/20.
//  Copyright © 2016年 appcoda. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var lineID_input: UITextField!
    @IBOutlet weak var secret_input: UITextField!
    @IBOutlet weak var signOut: UIButton!
    @IBAction func signOutaction(sender: AnyObject) {
       let email = lineID_input.text!
        let password=secret_input.text!
        
        FIRAuth.auth()?.createUserWithEmail(email, password: password) { (user, error) in
            // ...
        }
//        let alert = UIAlertController(title: "完成", message: "請收信確認註冊", preferredStyle: UIAlertControllerStyle.Alert)
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
//        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    @IBOutlet weak var signIn: UIButton!
    
    @IBAction func signInaction(sender: AnyObject) {
        
        FIRAuth.auth()?.addAuthStateDidChangeListener { auth, user in
            if let user = user {
                print("成功登入")
                // User is signed in.
                
                ///抓成功登入者資料
                if let user = FIRAuth.auth()?.currentUser {
                    
                    let email = user.email
                    let uid = user.uid
                    
                    print("抓使用者email \(email)")
                    print("抓使用者uid \(uid)")
                    // The user's ID, unique to the Firebase project.
                    // Do NOT use this value to authenticate with
                    // your backend server, if you have one. Use
                    // getTokenWithCompletion:completion: instead.
                } else {
                    // No user is signed in.
                }
                /////
            } else {
                print("登入失敗")
                // No user is signed in.
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let aa = segue.destinationViewController as! Group
        aa.lineID_get = self.lineID_input.text!
        
    }


}

