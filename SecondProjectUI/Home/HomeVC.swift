//
//  HomeVC.swift
//  SecondProjectUI
//
//  Created by IOS Training 4 on 16/07/22.
//

import UIKit
var sb = UIStoryboard(name: "Main", bundle: nil)
class HomeVC: UIViewController {
    static let identifier = "HomeVC"
    @IBOutlet weak  var ordertableView: UITableView!
    var dataArray = ["Ascending", "Descending"]
    override func viewDidLoad() {
        super.viewDidLoad()
        ordertableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        ordertableView.delegate = self
        ordertableView.dataSource = self
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ordertableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.textcell?.text =  dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imageVC = sb.instantiateViewController(withIdentifier: "ImageVC") as! ImageVC
        
        imageVC.listType = indexPath.row
        self.navigationController?.pushViewController(imageVC, animated: true)
    }
    
}
