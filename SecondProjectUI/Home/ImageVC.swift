//
//  ImageVC.swift
//  SecondProjectUI
//
//  Created by IOS Training 4 on 16/07/22.


import UIKit

class ImageVC: UIViewController {

    @IBOutlet weak var imgTable: UITableView!
    var dataArray: Array<String> = ["1", "2", "3","4", "5", "6"]
    var listType = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if listType == 1 {
            dataArray = dataArray.sorted(by: >)
        }
        configure()
    }
    
    func configure() {
        imgTable.register(UINib(nibName: "Img2TableViewCell", bundle: nil) , forCellReuseIdentifier: "Img2TableViewCell")
        imgTable.delegate = self
        imgTable.dataSource = self
    }
}

extension ImageVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Img2TableViewCell", for: indexPath) as! Img2TableViewCell
        cell.updateUI(imageName: dataArray[indexPath.row])
        cell.handler = {
            print("Section = \(indexPath.section) and Row = \(indexPath.row)")
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tabBarController?.selectedIndex = 1
        let navVC = tabBarController?.viewControllers![1] as! UINavigationController
        let secondTab = navVC.topViewController as! GridViewController
        secondTab.imageNameForGrid = dataArray[indexPath.row]
        secondTab.tap = true
    }
}
