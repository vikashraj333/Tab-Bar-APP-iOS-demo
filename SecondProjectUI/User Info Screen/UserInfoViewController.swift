//
//  UserInfoViewController.swift
//  SecondProjectUI
//
//  Created by IOS Training 3 on 24/07/22.
//

import UIKit

class UserInfoViewController: UIViewController{
    @IBOutlet weak var userInfoTableView: UITableView!
    @IBAction func logoutButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
        print("LogOut")
    }
    var arrUserDetails : [UserDetails] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       
        userInfoTableView.delegate = self
        userInfoTableView.dataSource = self
        
        guard let userDetails = DatabaseHelperCoreData.sharedInstanceCD.getAllData() else{return}
        arrUserDetails = userDetails
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
       
        self.userInfoTableView.reloadData()
    }

}
extension UserInfoViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUserDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UseriInfoTableViewCell.identifier, for: indexPath) as! UseriInfoTableViewCell
      
        let  user = arrUserDetails[indexPath.row]
        if
            let name = user.name, let mail = user.mail, let mobile = user.mobile, let address = user.address, let state = user.state
        {
            cell.didSetValue(name: name, mail: mail, mobile: mobile, address: address, state: state)
        }
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    
}

   


