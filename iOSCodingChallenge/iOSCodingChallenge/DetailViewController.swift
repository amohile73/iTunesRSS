//
//  DetailViewController.swift
//  iOSCodingChallenge
//
//  Created by Kedar Mohile on 10/22/19.
//  Copyright © 2019 Arti Karnik. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    var lblArtistName : UILabel!
    var lblPubDate : UILabel! 
    var strArtistName : String!
    var strReleaseDate : String!
    var imgViewProfileUrl : String!
    var imgViewProfile : UIImageView!
    let imageCache = NSCache<NSString, UIImage>()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange
        basicUI()
    }
    // Basic UI for main screen
    func basicUI()
    {
        // =======  Main Screen Image ======
        imgViewProfile = UIImageView()
        imgViewProfile.frame = CGRect(x: 10,y: 100,width: 350,height: 100)
        imgViewProfile.image = UIImage(named: "image.png")
        imgViewProfile.contentMode = .scaleAspectFit
        imgViewProfile.translatesAutoresizingMaskIntoConstraints = false
        imgViewProfile.clipsToBounds = true
        self.view.addSubview(imgViewProfile)
            
       NSLayoutConstraint.activate([
            imgViewProfile.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16.0),
            imgViewProfile.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16.0),
            imgViewProfile.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16.0),
        
        imgViewProfile.heightAnchor.constraint(equalToConstant: 200)
        ])
        //==================================
        
        // =======  Artish Name  ======
        let lblArtistName = UILabel()
        lblArtistName.numberOfLines = 0
        lblArtistName.backgroundColor = UIColor.clear
        lblArtistName.frame = CGRect(x: 10,y: 270,width: 150,height: 50)
        lblArtistName.textAlignment = .left
        lblArtistName.text = "Artist Name"
       //lblArtistName.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblArtistName)
                  
        let lblArtistNameText = UILabel()
        lblArtistNameText.numberOfLines = 0
        lblArtistNameText.backgroundColor = UIColor.clear
        lblArtistNameText.frame = CGRect(x: 170,y: 270,width: 150,height: 50)
        lblArtistNameText.textAlignment = .left
        lblArtistNameText.text = strArtistName
        self.view.addSubview(lblArtistNameText)
        //==================================
        
        // =======  Publish date  ======
          let lblPubDt = UILabel()
          lblPubDt.numberOfLines = 0
          lblPubDt.backgroundColor = UIColor.clear
          lblPubDt.frame = CGRect(x: 10,y: 320,width: 150,height: 50)
          lblPubDt.textAlignment = .left
          lblPubDt.text = "Publish date"
         // lblPubDt.translatesAutoresizingMaskIntoConstraints = false
          self.view.addSubview(lblPubDt)
                 
          let lblPubDtText = UILabel()
          lblPubDtText.numberOfLines = 0
          lblPubDtText.backgroundColor = UIColor.clear
          lblPubDtText.frame = CGRect(x: 170,y: 320,width: 150,height: 50)
          lblPubDtText.textAlignment = .left
          lblPubDtText.text = strReleaseDate
         //  lblPubDtText.translatesAutoresizingMaskIntoConstraints = false
         self.view.addSubview(lblPubDtText)
         //==================================
        
        setProfileImage()
    }
    func setProfileImage()
    {
        let key =  "Detail" + self.imgViewProfileUrl
                       
        if let cachedImage = self.imageCache.object(forKey:key as! NSString) // check for cache image
        {
            print("in cache")
             imgViewProfile.image = cachedImage
         }
         else
        {
            DispatchQueue.global(qos: .background).async
            {
                    let url = URL(string:self.imgViewProfileUrl!)
                    let data = try? Data(contentsOf: url!)
                    let image: UIImage = UIImage(data: data!)!
                   
                    DispatchQueue.main.async
                    {
                        self.imageCache.setObject(image, forKey:key as! NSString)
                        self.imgViewProfile.image = image
                    }
            }
        }
    }
}
