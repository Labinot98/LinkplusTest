//
//  DetailVC.swift
//  Linkplus
//
//  Created by Pajaziti Labinot on 30.4.21..
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var FirstName: UILabel!
    @IBOutlet weak var LastName: UILabel!
    @IBOutlet weak var emailUser: UILabel!
    
    var product = Results()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirstName.text = product.userName?.first
        LastName.text = product.userName?.last
        emailUser.text = product.userEmail
        
        let image_name = product.userPicture?.large
        let image_url = ( image_name!).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        if let url = URL(string: image_url) {
            imageUser.af_setImage(withURL: url)
        }

        // Do any additional setup after loading the view.
    }
    
}
