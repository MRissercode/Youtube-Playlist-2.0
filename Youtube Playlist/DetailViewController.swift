//
//  DetailViewController.swift
//  Youtube Playlist
//
//  Created by MRisser1 on 5/11/17.
//  Copyright © 2017 MRisser1. All rights reserved.
//

import UIKit
import RealmSwift
import SafariServices

class DetailViewController: UIViewController {

    @IBOutlet weak var detailNavigationItem: UINavigationItem!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    let realm = try! Realm()

    func configureView() {
        // Update the user interface for the detail item.
        if let video = detailItem {
            if titleTextField != nil && urlTextField != nil {
                titleTextField.text = video.title
                urlTextField.text = video.url
                detailNavigationItem.title = video.title
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var detailItem: Video? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    @IBAction func onTappedSaveButton(_ sender: UIButton) {
        if let video = detailItem {
            try! realm.write {
                video.title = titleTextField.text!
                video.url = urlTextField.text!
                detailNavigationItem.title = video.title
            }
        }
    }
    
    @IBAction func onTappedPlayVideoButton(_ sender: UIButton) {
        let url = URL(string: urlTextField.text!)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }


}

