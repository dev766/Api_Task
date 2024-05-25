//
//  DetailViewController.swift
//  Assigment
//
//  Created by Apple on 25/05/24.
//

import UIKit

class DetailViewController: UIViewController {

    
    var post: UsermodelElement?
    
    
    @IBOutlet weak var idLBL: UILabel!
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var bodyLBL: UILabel!
    @IBOutlet weak var useridLBL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let post = post {
            self.titleLBL.text = "Title:-  " + post.title
            self.idLBL.text = "Id:-  " + "\(post.id)"
            self.bodyLBL.text = "Body:-  " + post.body
            self.useridLBL.text = "UserId:-  " + "\(post.userID)"
            // Set up the UI to display the post details
        }
        

    }
    


}
