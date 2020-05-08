//
//  WSClient.swift
//  BaseProject
//
//  Created by Nikhil Mac on 09/12/19.
//  Copyright © 2019 Nikhil Mac. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import SystemConfiguration
import SVProgressHUD



// MARK:
// MARK:- PARAMETER ENCODING TYPE
enum encodingType : Int{
    case json
    case urlEnocding
}


// MARK:
// MARK:- REQUEST TYPE
enum WSRequestType : Int
{
    case WSRequestType_search = 1
    case WSRequestType_repo
}


// MARK:
// MARK:- API POSTFIX
enum WSAPI : String
{
    case search                             = "search/users?q="
    case repo                               = "users/" 
}


// MARK:
// MARK:- WEBSERVICE MANAGER
class WSClient: NSObject {

    // MARK:
    // MARK:- INSTANCE
    static let sharedInstance : WSClient = {
        let instance = WSClient()
        return instance
    }()

    
    //MARK:- BASE URL
    let BaseURL = Constant.App.BaseURL

    
    //MARK:- GET API FULLPATH
    public func getAPI(apiType : WSRequestType) -> String
    {
        switch apiType
        {
        case .WSRequestType_search:
            return BaseURL+WSAPI.search.rawValue
            
        case .WSRequestType_repo:
            return BaseURL+WSAPI.repo.rawValue
        }
    }
    

     // MARK:- get REQUEST
    func getRequestForAPIString(encodeType: encodingType , api : String?, parameters : NSDictionary? = nil, completionHandler:@escaping (_ responseObject : NSDictionary?, _ error : NSError?) -> Void)
         {
            // MARK:
            // MARK:- INTERNET CHECKING
             if !WSClient.sharedInstance.isConnectedToNetwork(){
                 CommonUnit.progressHUD(.dismissProgress)
                 
                 CommonUnit.alertController("Error", message: "Internet connection is not available", okTitle: "Ok", okCompletion: {
                 })
                 return
             }
            
             
             let apipath : String = api!
             var apiParams : NSDictionary!
             var encode : ParameterEncoding?

             if (parameters != nil)
             {
                 apiParams = parameters
             }
             
             if encodeType == .json {
                 encode = JSONEncoding.default
             }else if encodeType == .urlEnocding{
                 encode = URLEncoding.default
             }
             
             print("PARAMS : \(String(describing: apiParams as? Parameters))"  + "OF REQUEST URL : \(apipath)")
             
             Alamofire.request(apipath, method: .get, parameters: apiParams as? Parameters, encoding: encode! , headers:
                ["Content-Type":"application/json"])
                
                 .responseJSON { response in

                     switch(response.result) {
                         case .success(_):
                             do {
                                
                                
                             let JSON = try JSONSerialization.jsonObject(with: response.data! as Data, options:JSONSerialization.ReadingOptions(rawValue: 0))
                             
                             guard let JSONDictionary: NSDictionary = JSON as? NSDictionary else {
                                 print("Not a Dictionary : \(apipath)")
                                 return
                             }
                             
                             print("RESPONSE OF : \(apipath)" + " \(JSONDictionary)")
                             
                             completionHandler(JSONDictionary,nil)
                             }
                             catch let JSONError as NSError {
                                 print("\(JSONError)")
                             }
                             
                             break
                         case .failure(_):
                            CommonUnit.progressHUD(.dismissProgress)
                            
                            CommonUnit.alertController("Failure", message: (String(describing: response.result.error?.localizedDescription)), okTitle: "Ok", okCompletion: nil)
                            
                             print("failure Http: \(String(describing: response.result.error?.localizedDescription)) : \(apipath)")
                             completionHandler(nil,response.result.error! as NSError)
                             break
                     }
             }
         }
    
    
    
       // MARK:- get REQUEST
      func getRequestForAPIStringArray(encodeType: encodingType , api : String?, parameters : NSDictionary? = nil, completionHandler:@escaping (_ responseObject : NSArray?, _ error : NSError?) -> Void)
           {
              // MARK:
              // MARK:- INTERNET CHECKING
               if !WSClient.sharedInstance.isConnectedToNetwork(){
                   CommonUnit.progressHUD(.dismissProgress)
                   
                   CommonUnit.alertController("Error", message: "Internet connection is not available", okTitle: "Ok", okCompletion: {
                   })
                   return
               }
              
               let apipath : String = api!
               var apiParams : NSDictionary!
               var encode : ParameterEncoding?

               if (parameters != nil)
               {
                   apiParams = parameters
               }
               
               if encodeType == .json {
                   encode = JSONEncoding.default
               }else if encodeType == .urlEnocding{
                   encode = URLEncoding.default
               }
               
               print("PARAMS : \(String(describing: apiParams as? Parameters))"  + "OF REQUEST URL : \(apipath)")
               
               Alamofire.request(apipath, method: .get, parameters: apiParams as? Parameters, encoding: encode! , headers:
                  ["Content-Type":"application/json"])
                  
                   .responseJSON { response in

                       switch(response.result) {
                           case .success(_):
                               do {
                                
                                if let data = response.data, let responseString = String(data: data, encoding: .utf8) {
                                    let strJson : String = responseString
                                    let data = strJson.data(using: .utf8)!
                                    do {
                                        if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? NSArray
                                        {
                                            // print(jsonArray) // use the json here
                                            completionHandler(jsonArray,nil)
                                            print("Response : \(apipath) \(jsonArray)")

                                        } else {
                                            print("bad json")
                                        }
                                    } catch let error as NSError {
                                        print(error)
                                    }
                                    return
                                    }
                                }
                           
                               break
                        
                           case .failure(_):
                              CommonUnit.progressHUD(.dismissProgress)
                              
                              CommonUnit.alertController("Failure", message: (String(describing: response.result.error?.localizedDescription)), okTitle: "Ok", okCompletion: nil)
                              
                               print("failure Http: \(String(describing: response.result.error?.localizedDescription)) : \(apipath)")
                               completionHandler(nil,response.result.error! as NSError)
                               break
                       }
               }
           }
     
    
    // MARK:
    // MARK:- GET REQUEST
    func getRequestForAPI(apiType : WSRequestType, completionHandler:@escaping (_ responseObject : NSDictionary?, _ error : NSError?) -> Void)
     {
         let apipath : String = getAPI(apiType: apiType)
         
         //MARK :- Get App version
         if let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            print("App Version : \(appVersion)")
        }
         
         print("Get Requset URL : \(apipath)")
         //MARK:- Header
        let requestHeader : HTTPHeaders = [:]
         
         Alamofire.request(apipath, method: .get, parameters: [:], encoding: URLEncoding.default, headers: requestHeader)
             .responseJSON { response in
                 switch(response.result) {
                 case .success(_):
                     do {
                         let JSON = try JSONSerialization.jsonObject(with: response.data! as Data, options:JSONSerialization.ReadingOptions(rawValue: 0))
                         
                         guard let JSONDictionary: NSDictionary = JSON as? NSDictionary else {
                             print("Not a Dictionary")
                             return
                         }
                         completionHandler(JSONDictionary,nil)
                     }
                     catch let JSONError as NSError {
                         print("\(JSONError)")
                     }
                     
                     break
                 case .failure(_):
                     print("failure Http: \(String(describing: response.result.error?.localizedDescription))")
                     completionHandler(nil,response.result.error! as NSError)
                     break
             }
         }
     }
     
    
      
      // MARK:
      //MARK:- IMAGE DOWNLOADER
      func downloadImage(url: String, completionHandler: @escaping (_ error: NSError?, _ image:UIImage?)-> Void) {
          Alamofire.request(url)
              .downloadProgress { progress in
                  //print("Download Progress: \(progress.fractionCompleted)")
                  SVProgressHUD.showProgress(Float(progress.fractionCompleted))
              }
              .responseData { response in
                  if let data = response.result.value {
                      let image = UIImage(data: data)
                      SVProgressHUD.dismiss()
                      completionHandler(response.result.error as NSError?,image)
                  }
          }
      }
      
    // MARK:
    // MARK:- NETWORK CHECK
    func isConnectedToNetwork() -> Bool {
          
          var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
          zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
          zeroAddress.sin_family = sa_family_t(AF_INET)

          let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
              $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                  SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
              }
          }

          var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
          if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
              return false
          }
          
          /* Only Working for WIFI
           let isReachable = flags == .reachable
           let needsConnection = flags == .connectionRequired
           
           return isReachable && !needsConnection
           */
          
          // Working for Cellular and WIFI
          let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
          let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
          let ret = (isReachable && !needsConnection)

          return ret
      }
}

