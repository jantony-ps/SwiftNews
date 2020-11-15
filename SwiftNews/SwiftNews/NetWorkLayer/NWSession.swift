//
//  NWSession.swift
//  SwiftNews
//
//  Created by Jinto Antony on 2020-11-12.
//  Copyright © 2020 JA. All rights reserved.
//

import Foundation

class NWSesssion{
    let baseUrl = "https://www.reddit.com/r/swift/.json"
    static let imageCache = NSCache<AnyObject, AnyObject>()
    func baseUrlRequestApi(_ completionHandler: @escaping(_ data:NewsData?,  _ error:Error?) -> Void) ->Void{
        guard let url = URL(string: baseUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let data = data{
                print(data)
                do{
                     //here dataResponse received from a network request
                     let jsonResponse = try JSONSerialization.jsonObject(with:
                                            data, options: [])
                     print(jsonResponse) //Response result
                    let newsData:NewsData = try! JSONDecoder().decode(NewsData.self, from: data)
                    print(newsData)
                    completionHandler(newsData,err);
                
                  } catch let parsingError {
                     print("Error", parsingError)
                    completionHandler(nil,nil);
                }
            }
            if let res = res{
                print(res)
            }
            if let err = err{
                print(err)
            }
            completionHandler(nil,err);
        }.resume()

    }
    fileprivate func baseUrlRequestApi(url: URL,
                                _ completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func getNewsFeed(_ completionHandler: @escaping(_ data:NewsData?,  _ error:Error?) -> Void) ->Void{
        guard let url = URL(string: baseUrl) else {return}
        self.baseUrlRequestApi(url: url) { (data, res, err) in
            if let data = data{
               do{
                    //here dataResponse received from a network request
                    let jsonResponse = try JSONSerialization.jsonObject(with:
                                           data, options: [])
                    print(jsonResponse) //Response result
                   let newsData:NewsData = try! JSONDecoder().decode(NewsData.self, from: data)
                   print(newsData)
                   completionHandler(newsData,err);
               
                 } catch let parsingError {
                    print("Error", parsingError)
                   completionHandler(nil,nil);
               }
            }
        }
    }
    static func getCacheImage(_ strUrl:String) -> Data?{
        return NWSesssion.imageCache.object(forKey: strUrl as AnyObject) as? Data
    }
    func setCacheImage(_ data:Data?, strUrl:String){
        NWSesssion.imageCache.setObject(data as AnyObject, forKey: strUrl as AnyObject)
    }
    func getImage(url:URL,_ completionHandler: @escaping(_ data:Data?) -> Void) ->Void{
        if let imageFromCache = NWSesssion.getCacheImage(url.absoluteString){
            completionHandler(imageFromCache)
            return
        }
        self.baseUrlRequestApi(url: url) { (data, response, error) in
            if let data = data{
                self.setCacheImage(data, strUrl: url.absoluteString)
                completionHandler(data)
            }else{
                self.setCacheImage(Data(), strUrl: url.absoluteString)
            }
            completionHandler(nil)
        }
    }
}
