//
//  Constant.swift
//  BaseProject
//
//  Created by Narjis Mac on 09/12/19.
//  Copyright © 2019 Nikhil Mac. All rights reserved.
//

import Foundation
import UIKit

struct Constant {
    
    // MARK:
    // MARK:- APPLICATION
    struct App {
        
        // Main
        static let isHTTPS = false
        
        // Base
        static let BaseURL: String = {
            if Constant.App.isHTTPS {
                return "https://" + Constant.Common.UrlType
            }
            else {
                return "http://" + Constant.Common.UrlType
            }
        }()
    }
    
    
    // MARK:
    // MARK:- Common
    struct Common
    {
        static let appdelObj : AppDelegate  =  UIApplication.shared.delegate as! AppDelegate
        static let mainStoryBoard           =  UIStoryboard(name: "Main", bundle: Bundle.main)
        static let UrlType : String         =  AppURL.development
    }
    
    
    // MARK:
    // MARK:- APP URL TYPE
    struct AppURL {
        static let development  : String = "api.github.com/"
    }

}
