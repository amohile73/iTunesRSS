//
//  TableViewController.swift
//  iOSCodingChallenge
//
//  Created by Kedar Mohile on 10/22/19.
//  Copyright © 2019 Arti Karnik. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController
{
    var arrResult = [[String:String]]()
    var SelectedMediaType : String = "Apple Music"
    var SelectedFeedType : String = ""
    var FinalJSonUrl : String = ""
    let imageCache = NSCache<NSString, UIImage>()
    var activityIndicator = UIActivityIndicatorView()
  
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
    }
    override func viewWillAppear(_ animated: Bool)
    {
        self.title = SelectedMediaType
        FinalJSonUrl =  createJSOnUrl()
        BasicUI()
        getData()
    }
    func BasicUI()
    {
         activityIndicator = UIActivityIndicatorView.init(style:.medium)
         activityIndicator.color = UIColor.black
         self.tableView.addSubview(activityIndicator)
         activityIndicator.center = self.tableView.center
    }
    //========  Table view data source ================//

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrResult.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        let dict =  arrResult[indexPath.row]
        cell.lblName.text = dict["name"]
        cell.lblTitle.text = dict["title"]

        let imgUrl = dict["ImageUrl"]
               
        if let cachedImage = self.imageCache.object(forKey:imgUrl as! NSString)
        {
            //print("in cache tblview ")
            cell.imgViewProfile.image = cachedImage
        }
        else
        {
            DispatchQueue.global(qos: .background).async
             {
                let url = URL(string:dict["ImageUrl"]!)
                let data = try? Data(contentsOf: url!)
                let image: UIImage = UIImage(data: data!)!
                              
                DispatchQueue.main.async
                {
                    self.imageCache.setObject(image, forKey:imgUrl as! NSString)
                    cell.imgViewProfile.image = image
                }
            }
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let detailVC = DetailViewController()
        let dict =  arrResult[indexPath.row]
        detailVC.strReleaseDate = dict["releaseDate"]
        detailVC.strArtistName = dict["name"]
        detailVC.imgViewProfileUrl = dict["ImageUrl"]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    //=============== create JSOn url based on Media type ==================================
    func createJSOnUrl() -> String
    {
        var tempJSonUrl :  String = ""
        
        var temp = SelectedMediaType.replacingOccurrences(of: " ", with: "-")
        temp = temp.lowercased()
        tempJSonUrl = Global.sharedInstance.mainMediaURLPart1 + temp + "/" + SelectedFeedType + Global.sharedInstance.mainMediaURLPart2
        
        return tempJSonUrl
    }
    // ===================================================
    //==================================================
    // Function to get data from Server ====
    func getData()
    {
        guard let gitUrl = URL(string:FinalJSonUrl)
        else
        {
            return
        }
        activityIndicator.startAnimating()
        
        URLSession.shared.dataTask(with: gitUrl) { (data, response
             , error) in
            do
            {
                self.arrResult.removeAll()
               
                let rSSFeed = try? JSONDecoder().decode(RSS.self, from: data!)
                let totalRows : Int = rSSFeed?.feed.results.count ?? 0
                
                if totalRows > 0
                {
                    for i in 0...totalRows-1
                    {
                        let tempDict = ["name" : rSSFeed!.feed.results[i].name,
                                        "title" : rSSFeed!.feed.results[i].artistName,
                                        "ImageUrl" : rSSFeed!.feed.results[i].artworkUrl100,
                                        "releaseDate" : rSSFeed!.feed.results[i].releaseDate]
                         // Save required data in Dictionary
                        self.arrResult.append(tempDict)
                    }
                  //  print(self.arrResult)
                    DispatchQueue.main.async {
                        self.reloadTable()
                    }
                }
            }
            catch let err
            {
                let alert = UIAlertController(title: "Error", message: "Something wrong happen.. Please try again later", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                     }))
               self.present(alert, animated: true, completion: nil)
               print(err)
            }
        }
        .resume()
    }
    func reloadTable()
    {
        activityIndicator.stopAnimating()
        self.tableView.reloadData()
    }
}
