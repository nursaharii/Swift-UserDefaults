//
//  ViewController.swift
//  BirtdayNoteTaker
//
//  Created by Nurşah on 14.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var birthlbl: UILabel!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var name: UITextField!
    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var birth: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirth = UserDefaults.standard.object(forKey: "birth")
        namelbl.text = storedName as? String
        birthlbl.text = storedBirth as? String
        // Do any additional setup after loading the view.
    }

    @IBAction func kaydet(_ sender: Any) {
        
        
        
        //UserDefaults.standart.syncronize() -> Eskiden kullanılıyormuş.
      if name.text != nil {
          
          let isim = name.text
          namelbl.text = "Name: " + isim!// başka yazma şekli "Name: \(isim!)"
          UserDefaults.standard.set(namelbl.text!, forKey: "name")
        }
        
        dateFormatter.dateFormat = "dd / MM / yyyy"
        birthlbl.text = "Birthday: " + dateFormatter.string(from: birth.date)
        UserDefaults.standard.set(birthlbl.text!, forKey: "birth")
        
       
    }
    
    @IBAction func sil(_ sender: Any) {
        
        
        let storedName =  UserDefaults.standard.object(forKey: "name")
        let storedBirth = UserDefaults.standard.object(forKey: "birth")
        
        if ((storedName as? String) != nil) {
            namelbl.text = "Name: "
            UserDefaults.standard.removeObject(forKey: "name")
            
            
        }
        if (storedBirth as? String) != nil {
            birthlbl.text = "Birthday: "
            UserDefaults.standard.removeObject(forKey: "birth")
            
            
        }
    }
    
}

