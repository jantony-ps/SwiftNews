//
//  NewsFeedManager.swift
//  SwiftNews
//
//  Created by Jinto Antony on 2020-11-13.
//  Copyright © 2020 JA. All rights reserved.
//

import Foundation
import UIKit
class NewsFeedManager: NSObject {
    
    let kEmpty :String = ""
    var newsFeed = [Children]()
    var size:CGSize = CGSize(width: 40,height: 0)
    override init() {
        
    }
    init(_ newsFeed : [Children], _ size:CGSize) {
        super.init()
        self.size = size
        self.newsFeed = self.mapData(newsFeed)
        self.setImageAspectRatio()
    }
    func getNewsFeed() ->[Children]{
        return self.newsFeed
    }
    func getNewsFeed(_ completionHandler: @escaping(_ data:NewsData?,  _ error:Error?) -> Void){
        NWSesssion().baseUrlRequestApi { (data,err) in
            completionHandler(data,err)
        }
    }
    func getTitle(atIndex:Int) -> String{
        if let title = self.newsFeed[atIndex].data?.title{
            return title
        }
        return kEmpty
    }
    func getThumbNailUrl(atIndex:Int) -> URL?{
        if let strUrl = self.newsFeed[atIndex].data?.thumbnail{
            if let Url = URL(string: strUrl) {
               return Url
            }
        }
        return nil
    }
    func getComment(atIndex:Int) -> String{
        if let numComments = self.newsFeed[atIndex].data?.numComments{
            return "\(numComments) Comments"
        }
        return kEmpty
    }
    func getSave(atIndex:Int) -> Bool{
        if let saved = self.newsFeed[atIndex].data?.saved{
            return Bool(truncating: saved as NSNumber)
        }
        return false
    }
    func getSelfText(atIndex:Int) -> String{
        if let selfText = self.newsFeed[atIndex].data?.selftext{
            return selfText
        }
        return kEmpty
    }
    func getViewCount(atIndex:Int) -> String{
        if let viewCount = self.newsFeed[atIndex].data?.viewCount{
             return "\(viewCount) ViewCount"
         }
         return kEmpty
     }
    func setImageAspectRatio(){
        _ = self.getNewsFeed().enumerated().map { (index,element) in
            if let height = element.data?.thumbnailHeight, let width = element.data?.thumbnailWidth{
                let imageRatio = CGFloat(width / Double(height))
                if imageRatio > 0{
                    let imgHeight = (self.size.width) / imageRatio
                    self.newsFeed[index].data?.imgHeight = Int(imgHeight)
                }
            }
            return
        }
    }
    func getCellHeight(atIndex:Int) -> CGFloat{
        if let data = self.newsFeed[atIndex].data{
            if data.imgHeight > data.titleHeight{
                return CGFloat(data.imgHeight) + 20
            }
            return CGFloat(data.titleHeight) + 50
        }
        return 0
    }
    func getTitleHeight(atIndex:Int) -> CGFloat{
        if let data = self.newsFeed[atIndex].data{
            return CGFloat(data.titleHeight) + 30
        }
        return 0
    }
    func getImageFromCache(_ strUrl:String)->UIImage?{
        if let data = NWSesssion.getCacheImage(strUrl){
            return UIImage(data: data)
        }
        return  nil
    }
    func getImgHeight(atIndex:Int) ->CGFloat{
        return CGFloat(self.newsFeed[atIndex].data?.imgHeight ?? 0)
        
    }
    func mapData(_ newsFeeds:[Children]) -> [Children]{
        var data = newsFeeds
        DispatchQueue.main.sync{
         _ = newsFeeds.enumerated().map { (index,element) in
                let height = Int(self.heightForView(element.data?.title ?? ""))
                data[index].data?.titleHeight = height;
                return
            }
        }
        return data
    }
    func heightForView(_ text:String) -> CGFloat{
        var currHeight:CGFloat!
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.size.width - 40, height: CGFloat.greatestFiniteMagnitude))
        label.setConfig()
        label.text = text
        label.sizeToFit()
        currHeight = label.frame.height
        return currHeight
    }
}
