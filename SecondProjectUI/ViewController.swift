//
//  ViewController.swift
//  SecondProjectUI
//
//  Created by IOS Training 4 on 16/07/22.
//

import UIKit
import CoreData


class ViewController: UIViewController {
  static let  identifier = "ViewController"
    
    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var ScreenViewController: UIView!
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    

    var mailArray = [String]()
    var passwordArray = [String]()
    var databaseSQL : Bool = true
    
    @IBAction func choiceSqlCoreData(_ sender: Any) {
        switch segmentOutlet.selectedSegmentIndex{
        case 0 : ScreenViewController.backgroundColor = .green
                    databaseSQL = true
        case 1 : ScreenViewController.backgroundColor = .yellow
                    databaseSQL = false
        default:
            break
        }
        
    }
  
    @IBAction func signUpButton(_ sender: Any) {
       if let signUpVC =  self.storyboard?.instantiateViewController(withIdentifier: SignUpTableViewController.identifier) as? SignUpTableViewController{
            self.navigationController?.pushViewController(signUpVC, animated: false)}
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScreenViewController.backgroundColor = .green
        // Do any additional setup after loading the view.
    }


}

extension ViewController{
    @IBAction func signInButton(_ sender: Any) {
        guard
        let mail = mailText.text,
        let password = passwordText.text
        else{
            return}
        if databaseSQL {
            SqlDbManager.sharedInstance.isValid(mail: mail, password: password)
            performSegue(withIdentifier: "HomeVC", sender: nil)
            print("Login")
        }
        else {
            if DatabaseHelperCoreData.sharedInstanceCD.isValid(mail: mail, password: password)! {
            performSegue(withIdentifier: "HomeVC", sender: nil)
            print("Login")
        }
        else{
            let alert = UIAlertController(title: "Not Found", message: "No account found for this Email", preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
                UIAlertAction in
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        }
    }
//        let appdelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appdelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInfo")
//        fetchRequest.returnsObjectsAsFaults = false
//        do{
//            let results = try context.fetch(fetchRequest)
//
//            for result in results as! [NSManagedObject]{
//                if let mail = result.value(forKey: "mail") as? String{
//                    self.mailArray.append(mail)
//                }
//                if let password = result.value(forKey: "password") as? String{
//                    self.passwordArray.append(password)
//                }
//            }
//        }
//        catch{
//            print("error")
//        }
//        if(mailArray.contains(mailText.text!)){
//            let mailIndex = mailArray.firstIndex(where: {$0 == mailText.text})
//            if passwordArray[mailIndex!] == passwordText.text{
//                print("Login")
////                let loginUser: () = LoginDefault.setData(mail: mailText.text!)
//               performSegue(withIdentifier: "HomeVC", sender: nil)
//            }
//        }
//        else {
//            let alert = UIAlertController(title: "Not Found", message: "No account found for this Email", preferredStyle: .alert
//            )
//            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
//                UIAlertAction in
//            }
//            alert.addAction(okAction)
//            self.present(alert, animated: true, completion: nil)
//        }
    }

