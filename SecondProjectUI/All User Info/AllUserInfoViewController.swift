//
//  AllUserInfoViewController.swift
//  SecondProjectUI
//
//  Created by IOS Training 3 on 24/07/22.
//

import UIKit

class AllUserInfoViewController: UIViewController {
    
    @IBOutlet weak var userListTableView: UITableView!
    var arrUserDetails : [UserDetails] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userListTableView.delegate = self
        userListTableView.dataSource = self
        guard let userDetails = DatabaseHelperCoreData.sharedInstanceCD.getAllData() else{return}
        arrUserDetails = userDetails
        
            

    }
    override func viewWillAppear(_ animated: Bool) {
       
        self.userListTableView.reloadData()
    }

}
extension AllUserInfoViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUserDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AllUserInfoTableViewCell.identifier, for: indexPath) as! AllUserInfoTableViewCell
      
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteUser = UIContextualAction(style: .destructive, title: "Delete" ){[self]_,_,_ in
            if DatabaseHelperCoreData.sharedInstanceCD.delete(user: arrUserDetails[indexPath.row]){
            guard let cd = DatabaseHelperCoreData.sharedInstanceCD.getAllData() else {return }
            arrUserDetails = cd
                tableView.reloadData()
        }
    }
    return UISwipeActionsConfiguration(actions: [deleteUser])
}
}
