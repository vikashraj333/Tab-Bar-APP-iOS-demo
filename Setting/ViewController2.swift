//
//  ViewController2.swift
//  SecondProjectUI
//
//  Created by IOS Training 1 on 18/07/22.
//

import UIKit

class ViewController2: UIViewController {

    //    var settingArray: [[String]] = [["Sign-In"],["Wifi","Bluetooth","Mobile Data","Personal HotSpot"],["Notification","Sound","Do Not Disturb","Screen Time"],["Battery","Control Center", "Display Brightness", "Emergency SOS", "Face ID","General","Privacy", "Siri Search", "Wallpaper"]]
    //    var settingImgArray : [[String]] = [["Sign-InImg"],["WifiImg","BluetoothImg","Mobile DataImg","Personal HotSpotImg"],["NotificationImg","SoundImg","Do Not DisturbImg","Screen TimeImg"],["BatteryImg","Control CenterImg", "Display BrightnessImg", "Emergency SOSImg", "Face IDImg","GeneralImg","PrivacyImg", "Siri SearchImg", "WallpaperImg"]]
        var settingLists: [SettingPage] = []
        @IBOutlet weak var tableView: UITableView!
        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Settings"
            tableView.delegate = self
            tableView.dataSource = self
            makeData()
            // Do any additional setup after loading the view.
            tableView.register(UINib(nibName: "TableViewCellSetting", bundle: nil), forCellReuseIdentifier: "TableViewCellSetting")
    //        tableView.register(UINib(nibName: "TableSectionForSetting", bundle: nil), forHeaderFooterViewReuseIdentifier: "TableSectionForSetting")
            
        }
        
        func makeData() {
            var list1 = SettingPage()
            list1.name = "Setting"
            list1.settingList = [SettingListName(name: "Sign-In", image: "Sign-InImg"),
            ]
            settingLists.append(list1)
            
            var list2 = SettingPage()
            list2.name = "Connectivity"
            list2.settingList = [SettingListName(name: "Wifi", image: "WifiImg"),
                                 SettingListName(name: "Bluetooth", image: "BluetoothImg"),
                                 SettingListName(name: "Mobile Data", image: "Mobile DataImg"),
                                 SettingListName(name: "Personal HotSpot", image: "Personal HotSpotImg")
            ]
            settingLists.append(list2)
            
            var list3 = SettingPage()
            list3.name = "Sound"
            list3.settingList = [SettingListName(name: "Notification", image: "NotificationImg"),
                                 SettingListName(name: "Sound", image: "SoundImg"),
                                 SettingListName(name: "Do Not Disturb", image: "Do Not DisturbImg"),
                                 SettingListName(name: "Screen Time", image: "Screen TimeImg")
            ]
            settingLists.append(list3)
            
            var list4 = SettingPage()
            list4.name = "General"
            list4.settingList = [SettingListName(name: "Battery", image: "BatteryImg"),
                                 SettingListName(name: "Control Center", image: "Control CenterImg"),
                                 SettingListName(name: "Display Brightness", image: "Display BrightnessImg"),
                                 SettingListName(name: "Emergency SOS", image: "Emergency SOSImg"),
                                 SettingListName(name: "Face ID", image: "Face IDImg"),
                                 SettingListName(name: "General", image: "GeneralImg"),
                                 SettingListName(name: "Privacy", image: "PrivacyImg"),
                                 SettingListName(name: "Siri Search", image: "Siri SearchImg"),
                                 SettingListName(name: "Wallpaper", image: "WallpaperImg")
            ]
            settingLists.append(list4)
        }

}

extension ViewController2: UITableViewDelegate, UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingLists[section].settingList?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellSetting") as! TableViewCellSetting
        cell.label.text = settingLists[indexPath.section].settingList?[indexPath.row].name
        cell.iconImage.image = UIImage(named: (settingLists[indexPath.section].settingList?[indexPath.row].image)!)
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        50
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nav = sb.instantiateViewController(withIdentifier: "SettingScreen") as! SettingScreen
        self.navigationController?.pushViewController(nav, animated: true)
        nav.name = settingLists[indexPath.section].settingList?[indexPath.row].name
        nav.index = indexPath
        nav.imageName = settingLists[indexPath.section].settingList?[indexPath.row].image
        nav.delegate = self
        
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        settingLists.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        10
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Setting"
        }
        if section == 1{
            return "Connectivity"
        }
        if section == 2{
            return "Sound"
        }
        if section == 3{
            return "General"
        }
        return " "
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let sectionView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableSectionForSetting") as! TableSectionForSetting
//        sectionView.labelForSection.text = settingLists[section].name
//        return sectionView
//    }
}

extension ViewController2: SettingScreenDelegate{
    func dataPass(string: String, index: IndexPath) {
        print("after button pressed => \(string)")
        settingLists[index.section].settingList?[index.row].name = string
        self.tableView.reloadData()
    }
}



protocol SettingScreenDelegate {
    func dataPass(string: String, index: IndexPath)
}

