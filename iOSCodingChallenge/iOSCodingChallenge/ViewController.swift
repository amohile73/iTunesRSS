//
//  ViewController.swift
//  iOSCodingChallenge
//
//  Created by Kedar Mohile on 10/22/19.
//  Copyright © 2019 Arti Karnik. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource
{
    var myPickerView : UIPickerView!
    var message  = "Please Select Media Type and click on Done button to continue"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "iTunes App"
        self.view.backgroundColor = UIColor.orange
    }
    override func loadView()
    {
        super.loadView()
        setUpUI()
    }
    // Table view delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        return UITableViewCell()
    }
   
    // Set Basic UI for Screen
    func setUpUI()
    {
        // =======  Main Screen Label ======
        let infoLabel = UILabel()
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        infoLabel.text = message
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(infoLabel)
            
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16.0),
            infoLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16.0),
            infoLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16.0)
        ])
        //==================================
    
        //=============  Done Button ========
        
        let btnNext = UIButton()
        btnNext.backgroundColor = .systemBlue
        btnNext.layer.cornerRadius = 24.0
        btnNext.setTitleColor(.white, for: .normal)
        btnNext.setTitle("Done", for: .normal)
        btnNext.addTarget(self, action: #selector(pushNextScreenButtonAction), for: .touchUpInside)
        btnNext.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnNext)
                
        NSLayoutConstraint.activate([
            btnNext.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 48.0),
            btnNext.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -48.0),
            btnNext.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16.0),
            btnNext.heightAnchor.constraint(equalToConstant: 48.0)
        ])
        btnNext.heightAnchor.constraint(equalToConstant: 48.0)
        
        //==================================
        
        //=============  Picker View  ========

        myPickerView = UIPickerView(frame:CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: 200))
        myPickerView.backgroundColor = UIColor.clear
        myPickerView.translatesAutoresizingMaskIntoConstraints = false
        myPickerView.delegate = self
        myPickerView.dataSource = self
        self.view.addSubview(myPickerView)
        
        NSLayoutConstraint.activate([
            myPickerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 48.0),
            myPickerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -48.0),
            myPickerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -300.0),
            myPickerView.heightAnchor.constraint(equalToConstant: 200)
        ])
         //==================================
    }
    // Button Method
    @objc func pushNextScreenButtonAction()
    {
        let detailVC = TableViewController()
        detailVC.SelectedMediaType = Global.sharedInstance.arrMediaType[myPickerView.selectedRow(inComponent: 0)]
        detailVC.SelectedFeedType = Global.sharedInstance.arrFeedType[myPickerView.selectedRow(inComponent: 0)]
              
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    // Picker View Delegate Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return Global.sharedInstance.arrMediaType.count
        
        //return Global.sharedInstance.arrMediaType.count
   //     return arrMediaType.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
            return Global.sharedInstance.arrMediaType[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
    }
}

