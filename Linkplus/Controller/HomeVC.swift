//
//  ViewController.swift
//  Linkplus
//
//  Created by Pajaziti Labinot on 30.4.21..
//

import UIKit
import AlamofireImage
import Alamofire

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    
    
    @IBOutlet weak var tableView : UITableView!
    var arrayOfUsers = [Results]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        ADJProductService.instance.listOfProduct { (succes, user) in
           
            if succes {
                DispatchQueue.main.async {
                    self.arrayOfUsers = user
                    self.tableView.reloadData()
                    print(self.arrayOfUsers.count)
                }
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeCell
        let product = arrayOfUsers[indexPath.row]
        let x : Int = (product.userDob?.age)!//
//        cell.imageUser.image = product.userPicture?.large?.toImage()
        
        let image_name = product.userPicture?.large
        let image_url = ( image_name!).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        if let url = URL(string: image_url) {
            cell.imageUser.af_setImage(withURL: url)
        }
        
        cell.firstName.text = product.userName?.first
        cell.lastName.text = product.userName?.last
        cell.AgeUser.text = String(x)
//        cell.nationality.text = product.userNat
        cell.nationality.text = flag(country: product.userNat!)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = arrayOfUsers[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        vc.product = product
        let nav = UINavigationController(rootViewController: vc)
//        self.present(nav, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - Convert data notionality from api in flag icon
    func flag(country:String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
}

extension String {
    func toImage() -> UIImage? {
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters){
            return UIImage(data: data)
        }
        return nil
    }
}

