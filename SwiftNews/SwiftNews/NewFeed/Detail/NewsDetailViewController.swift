//
//  NewsDetailViewController.swift
//  SwiftNews
//
//  Created by Jinto Antony on 2020-11-14.
//  Copyright © 2020 JA. All rights reserved.
//

import UIKit
class NewsDetailViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imgConstraintHeight: NSLayoutConstraint!
    
    @IBOutlet weak var articleContainerHeight: NSLayoutConstraint!
    var index:Int = 0
    var newsFeedManager: NewsFeedManager!
    @IBOutlet weak var snapViewContianer: UIView!
    override func viewDidLoad() {
        self.imageView.image = nil
        if let url = newsFeedManager.getThumbNailUrl(atIndex: index){
            if let image = newsFeedManager.getImageFromCache(url.absoluteString){
                self.imageView.image = image
                self.imageView.contentMode = .scaleAspectFill
                self.imgConstraintHeight.constant = newsFeedManager.getImgHeight(atIndex: index)
                self.imgConstraintHeight.isActive = true
            }else{
                self.imgConstraintHeight.constant = 0
                self.imgConstraintHeight.isActive = true
            }
        }
        self.label.text = newsFeedManager.getTitle(atIndex: index)
        self.articleContainerHeight.constant = newsFeedManager.getTitleHeight(atIndex: index) + 50
        self.articleContainerHeight.isActive = true
        self.snapViewContianer.shadow()
        addComment()
        addSave()
        addviewCount()
        addSelfText()
        addselfText()
        self.scrollView.updateContentView()
    }
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height:  scrollView.contentSize.height)
    }
    let comment:UILabel =  UILabel()
    func addComment(){
        self.snapViewContianer.addSubview(comment)
        comment.anchor(nil, left: self.snapViewContianer.leftAnchor, bottom:self.snapViewContianer.bottomAnchor, right: nil, topConstant: 2, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 90, heightConstant: 20)
        comment.text = newsFeedManager.getComment(atIndex: index)
        comment.setConfig(fontSize:12)
    }
    
    let save:UIButton =  UIButton()
    func addSave(){
        self.snapViewContianer.addSubview(save)
        save.anchor(nil, left: self.comment.rightAnchor, bottom:self.snapViewContianer.bottomAnchor, right: nil, topConstant: 0, leftConstant: 3,  bottomConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 20)
        save.setTitle("Save", for: .normal)
        save.setTitleColor(.black, for: .normal)
        save.isEnabled = newsFeedManager.getSave(atIndex: index)
        save.titleLabel?.font = .systemFont(ofSize: 12)
    }
    let viewCount:UILabel =  UILabel()
    func addviewCount(){
        self.snapViewContianer.addSubview(viewCount)
        viewCount.anchor(nil, left: self.save.rightAnchor, bottom:self.snapViewContianer.bottomAnchor, right: nil, topConstant: 2, leftConstant: 3, bottomConstant: 0, rightConstant: 0, widthConstant: 120, heightConstant: 20)
        viewCount.setConfig(fontSize:12)
        viewCount.text = newsFeedManager.getViewCount(atIndex: index)
    }
    let selfTextView:UIView = UIView()
    func addSelfText(){
        self.scrollView.addSubview(selfTextView)
        selfTextView.anchor(self.snapViewContianer.bottomAnchor, left: self.snapViewContianer.leftAnchor, bottom:nil, right:  self.snapViewContianer.rightAnchor, topConstant: 20, leftConstant: 3, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    let selfText:UILabel =  UILabel()
    func addselfText(){
        let text = newsFeedManager.getSelfText(atIndex: index)
        self.selfTextView.addSubview(selfText)
        let height = newsFeedManager.heightForView(text)
        selfText.anchor(self.selfTextView.topAnchor, left: self.selfTextView.leftAnchor, bottom:nil, right: self.selfTextView.rightAnchor, topConstant: 2, leftConstant: 3, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: height + 10)
        selfText.text = text
        selfText.setConfig()
    }
 
    
}
extension UIScrollView {
    func updateContentView() {
        contentSize.height = subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY ?? contentSize.height + 50
    }
}
extension UIView{
    func shadow(){
       layer.masksToBounds = false
       layer.shadowColor = UIColor.lightGray.cgColor
       backgroundColor = UIColor.white
       layer.shadowOffset = CGSize(width: 0.2, height: 0.2)
       layer.shadowOpacity = 0.4
    }
}
extension UILabel{
    func setConfig(fontSize:CGFloat = 17){
        numberOfLines = 0
        lineBreakMode = NSLineBreakMode.byWordWrapping
        font = UIFont (name: "Helvetica Neue", size: fontSize)
    }
}
