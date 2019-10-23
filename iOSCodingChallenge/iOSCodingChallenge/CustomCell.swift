
//
//  CustomCell.swift
//  iOSCodingChallenge
//
//  Created by Kedar Mohile on 10/22/19.
//  Copyright © 2019 Arti Karnik. All rights reserved.
//
import UIKit

class CustomCell: UITableViewCell
{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        containerView.addSubview(lblName)
        containerView.addSubview(lblTitle)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(imgViewProfile)
        self.contentView.addSubview(profileImageView)

        profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        lblName.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        lblName.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        lblName.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        lblTitle.topAnchor.constraint(equalTo:self.lblName.bottomAnchor).isActive = true
        lblTitle.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        lblTitle.topAnchor.constraint(equalTo:self.lblName.bottomAnchor).isActive = true
        lblTitle.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        
        imgViewProfile.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        imgViewProfile.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        imgViewProfile.widthAnchor.constraint(equalToConstant:70).isActive = true
        imgViewProfile.heightAnchor.constraint(equalToConstant:70).isActive = true
      }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    // =========  Create Class UI  =========//
    // Class Container View
    let containerView:UIView =
    {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    // Profile Image
    let profileImageView:UIImageView =
    {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    // Loading Image while downloading
    let imgViewProfile:UIImageView =
       {
           let img = UIImageView()
           img.image = UIImage(named: "placeholder.jpg")
           img.contentMode = .scaleAspectFill // without this your image will shrink and looks ugly
           img.translatesAutoresizingMaskIntoConstraints = false
           img.clipsToBounds = true
           return img
       }()
    // Artist Name label
    let lblName:UILabel =
    {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // zArtist title Label
    let lblTitle:UILabel =
    {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.gray
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = UIColor.clear
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.font = UIFont.italicSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
