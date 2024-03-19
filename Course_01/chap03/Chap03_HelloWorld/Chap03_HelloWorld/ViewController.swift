//
//  ViewController.swift
//  Chap03_HelloWorld
//
//  Created by Vũ Nguyễn on 1/22/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    @IBAction func showMessage(sender: UIButton){
        var emoji_dict: [String : String] = ["👻": "Ghost",
                                             "💩":"Poop",
                                             "😤":"Angry",
                                             "😱":"Scream",
                                             "👾":"Alien monster"
                                              ]
        
        let selectedButton = sender
        
        if let wordToLookup = selectedButton.titleLabel?.text{
            
            let meanning = emoji_dict[wordToLookup]
            
            let alertController = UIAlertController(title: "Emoji Meaning", message: meanning,preferredStyle:  UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        
    }

}

