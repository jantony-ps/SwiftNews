//
//  ViewController.swift
//  SwiftNews
//
//  Created by Jinto Antony on 2020-11-12.
//  Copyright © 2020 JA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
  
    @IBOutlet weak var tableView: UITableView!
    var newsFeedManager = NewsFeedManager()
    override func viewDidLoad() {

        // Do any additional setup after loading the view.
        self.title = "Swift News"
        self.register()
        let newsFeedViewSize:CGSize = self.tableView.frame.size
        NWSesssion().getNewsFeed { (data,err) in
            if let newsData = data{
                if let newsFeed = newsData.data?.children{
                    self.newsFeedManager = NewsFeedManager(newsFeed,newsFeedViewSize);
                    if self.newsFeedManager.getNewsFeed().count > 0{
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 600
    }
    func register(){
        self.tableView.register(UINib(nibName: "newsCell", bundle: nil), forCellReuseIdentifier: "newCell");
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsFeedManager.newsFeed.count
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newCell", for: indexPath) as! newsCell
        let title = self.newsFeedManager.getTitle(atIndex: indexPath.row)
        cell.lblTitle.text = title
        cell.setTitleHeight(height: self.newsFeedManager.getTitleHeight(atIndex: indexPath.row))
        cell.imgView.image = nil
        if let url = self.newsFeedManager.getThumbNailUrl(atIndex: indexPath.row) {
            if let image = self.newsFeedManager.getImageFromCache(url.absoluteString){
                cell.imgView.image = image
            }else{
                cell.imgView.getImage(url: self.newsFeedManager.getThumbNailUrl(atIndex: indexPath.row))
            }
        }
        cell.selectionStyle = .none
        return cell;
    }

    func tableView(_ tableView: UITableView,
                 heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.newsFeedManager.getCellHeight(atIndex: indexPath.row)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailView = self.storyboard?.instantiateViewController(withIdentifier: "detailView") as? NewsDetailViewController {
            detailView.index = indexPath.row
            detailView.newsFeedManager = self.newsFeedManager
            self.navigationController?.pushViewController(detailView, animated: true)
        }
    }
}
extension UIImageView {
    func getImage(url: URL?) {
        if let url = url{
            DispatchQueue.global().async { [weak self] in
                NWSesssion().getImage(url: url) { (data) in
                    if let data = data{
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self?.image = image
                                self?.contentMode = UIView.ContentMode.scaleAspectFit
                                self?.layoutIfNeeded()
                            }
                        }
                    }
                }
            }
        } 
    }
}

