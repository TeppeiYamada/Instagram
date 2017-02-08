//
//  CommentViewController.swift
//  Instagram
//
//  Created by 山田哲平 on 2017/02/06.
//  Copyright © 2017年 山田哲平. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD




class CommentViewController: UIViewController, UITextFieldDelegate {
    
    var postData:PostData? = nil
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func backButton(_ sender: Any) {
    }
    
    @IBAction func postButton(_ sender: Any) {
        
       
        
        // 増えたcommentsをFirebaseに保存する
        let postRef = FIRDatabase.database().reference().child(Const.PostPath).child((postData?.id!)!)
        let name = FIRAuth.auth()?.currentUser?.displayName
        
        postData?.comments.append("\(name!) : \(textField.text!)")
        let commentsName = ["comments":postData?.comments, "name": name!] as [String : Any]
        postRef.updateChildValues(commentsName)
        
        
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        
        // 全てのモーダルを閉じる
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        textField.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
