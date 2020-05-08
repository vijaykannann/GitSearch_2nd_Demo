//
//  CommonUnit.swift
//  BaseProject
//
//  Created by Narjis Mac on 09/12/19.
//  Copyright © 2019 Nikhil Mac. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD



enum shadowCornerRadius : Int{
    case top = 0
    case bottom
    case all
}

enum ProgressState : Int {
    case showProgress = 0
    case dismissProgress = 1
}


class  CommonUnit
{
    
    // MARK:
    // MARK:- sharedInstance
    static let sharedInstance = CommonUnit()
    
    
    //MARK:- Progress Method
    class func progressHUD(_ progressState : ProgressState){
        switch progressState {
        case ProgressState.showProgress:
            SVProgressHUD.setBackgroundColor(UIColor.clear)
            SVProgressHUD.setForegroundColor(.black)
            SVProgressHUD.show()
        default:
            SVProgressHUD.dismiss()
        }
    }
    
    //MARK:- set Border And Corner

       func setBorderAndCorner (_ view:UIView?,_ borderWidth:CGFloat,_ borderColor:UIColor,_ cornerRadius:CGFloat) -> Void {
           view?.clipsToBounds = true
           view?.layer.borderWidth = borderWidth
           view?.layer.borderColor = borderColor.cgColor
           view?.layer.cornerRadius = cornerRadius;
       }

    
    //MARK:- Set Alert with title
     func E_showAlertWithTitle(_ strTitle : String, strMessage : String,strButtonTitle : String, view : UIViewController){
         DispatchQueue.main.async(execute: { () -> Void in
             let alert = UIAlertController(title: strTitle, message:  strMessage , preferredStyle: UIAlertController.Style.alert)
             alert.addAction(UIAlertAction(title: strButtonTitle , style: .default, handler: nil))
             view.present(alert, animated: true, completion: nil)
         })
     }
    
    
    //MARK:- Alert Controller
     class func alertController(_ title:NSString, message: String, okTitle: String, okCompletion :(() -> Void)?) {
         let alertController = UIAlertController.init(title: title as String, message: message as String, preferredStyle: UIAlertController.Style.alert)
         
         let okAction = UIAlertAction.init(title: okTitle as String, style: UIAlertAction.Style.default) { (alertAction :UIAlertAction) in
             if okCompletion != nil{
                 okCompletion!()
             }
         }
         alertController.addAction(okAction)
         Constant.Common.appdelObj.navVC?.visibleViewController?.present(alertController, animated: true, completion: nil)
     }
    
        
    // MARK:-
    class func alertController(_ title:NSString, message: String, okTitle: String, cancelTitle: String, okCompletion :(() -> Void)?) {
        let alertController = UIAlertController.init(title: title as String, message: message as String, preferredStyle: UIAlertController.Style.alert)
        
        let cancelAction = UIAlertAction.init(title: cancelTitle as String, style: UIAlertAction.Style.default)
        
        let okAction = UIAlertAction.init(title: okTitle as String, style: UIAlertAction.Style.default) { (alertAction :UIAlertAction) in
            if okCompletion != nil{
                okCompletion!()
            }
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        Constant.Common.appdelObj.navVC?.visibleViewController?.present(alertController, animated: true, completion: nil)
    }
    
   
    // MARK:-

    func ClearData(){
      
        UIApplication.shared.applicationIconBadgeNumber = 0
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
    }
    
    
    // MARK:-

   
    
    
  
    
    // MARK:-

    func checkIfStringNull(someObject : AnyObject) -> String {
        if !self.isNull(someObject: someObject) {
            if let str = someObject as? String{
                return str
            }else {
                return ""
            }
        }else {
            return ""
        }
    }
    
    // MARK:-

    func isNull(someObject: AnyObject?) -> Bool {
          guard let someObject = someObject else {
              return true
          }
          return (someObject is NSNull)
    }
    
}



//MARK: Extension on UIView
extension UIView {
    
    func setShadow(radiusType : shadowCornerRadius, cornerRadius : CGFloat , shadowRadius : CGFloat ,opacity : CGFloat) {
       
        switch radiusType {
        case .top:
            self.clipsToBounds = true
            self.layer.masksToBounds = false
            self.layer.shadowRadius = shadowRadius
            self.layer.cornerRadius = cornerRadius
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.layer.shadowOpacity = Float(opacity)
            self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        case .bottom:
            self.clipsToBounds = true
            self.layer.masksToBounds = false
            self.layer.shadowRadius = shadowRadius
            self.layer.cornerRadius = cornerRadius
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 1)
            self.layer.shadowOpacity = Float(opacity)
            self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        default:
            self.layer.masksToBounds = false
            self.layer.cornerRadius = cornerRadius
            self.layer.shadowRadius = shadowRadius
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.layer.shadowOpacity = Float(opacity)
        }
    }
}
