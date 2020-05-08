//
//  ListDetailVC.swift
//  GithubDemo
//
//  Created by varun on 06/05/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import UIKit
import SafariServices

class ListDetailVC: UIViewController {
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    var strSearch : String = ""

    fileprivate lazy var searchController = UISearchController(searchResultsController: nil)

    var arrRepo = [RepoModel]()
    var arrFilter = [RepoModel]()
    
    var modelList : ListModel?
    
    @IBOutlet weak var tblDetail: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CommonUnit.sharedInstance.setBorderAndCorner(imgUser, 0.0, .lightGray, 50.0)

        navigationItem.searchController = searchController

        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder                = "Search repos"
        searchController.searchBar.delegate                   = self
        navigationItem.title = "Detail"
        
        strSearch = modelList!.login!
        imgUser?.af_setImage(withURL:NSURL(string : modelList!.avatarUrl)! as URL, placeholderImage: UIImage(named: "placeholder"))
        lbl2.text = ""
        lbl3.text = ""
        lblName.text = ""

        
        callwebService(params: [:], isProgress: true) { (isSucess) in }
        callwebServiceUserDetail(params: [:], isProgress: true) { (isSucess) in }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesSearchBarWhenScrolling = false
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationItem.hidesSearchBarWhenScrolling = true
        super.viewDidAppear(animated)
    }
    

    func callwebServiceUserDetail (params : NSDictionary ,isProgress: Bool, completionHandler: @escaping (Bool) -> Void)
    {
        if isProgress {
            CommonUnit.progressHUD(.showProgress)
        }
        
        let strApi = Constant.App.BaseURL + "users/\(strSearch)"
        
        WSClient.sharedInstance.getRequestForAPIString(encodeType: .urlEnocding , api: strApi , parameters: params , completionHandler: { (responseObject, error) in
            
            if error == nil {
                
                if  responseObject != nil{
                    let model : userModel = userModel.init(object: responseObject!)
                    self.lblName.text = "Name : " + model.name
                    self.lbl3.numberOfLines = 0
                    self.lbl3.text = "Email : " + model.email + "\nLocation : " + model.location! + "\nCompany : " + String(model.company) + "\nFollowers : " + String(model.followers!) + "\nFollwing :" + String(model.following!)

                }
   
                if isProgress {
                    CommonUnit.progressHUD(.dismissProgress)
                }
    
                completionHandler(true)

            }else{
                if isProgress {
                    CommonUnit.progressHUD(.dismissProgress)
                }
            }
        })
    }
    
    func callwebService (params : NSDictionary ,isProgress: Bool, completionHandler: @escaping (Bool) -> Void)
    {
        if isProgress {
            CommonUnit.progressHUD(.showProgress)
        }
        
        let strApi = Constant.App.BaseURL + WSAPI.repo.rawValue + "\(strSearch)/repos"
        
        WSClient.sharedInstance.getRequestForAPIStringArray(encodeType: .urlEnocding , api: strApi , parameters: params , completionHandler: { (responseObject, error) in
            
            if error == nil {
                
                self.arrRepo = [RepoModel]()
                self.arrFilter = [RepoModel]()

                
                for (_, element) in responseObject!.enumerated()  {
                    let model : RepoModel = RepoModel.init(object: element as! NSDictionary)
                    self.arrRepo.append(model)
                    self.arrFilter.append(model)
                }
                self.lbl2.text = "Total Repo : " + String(self.arrRepo.count)

                if isProgress {
                    CommonUnit.progressHUD(.dismissProgress)
                }
    
                self.tblDetail.reloadData()
                completionHandler(true)

            }else{
                if isProgress {
                    CommonUnit.progressHUD(.dismissProgress)
                }
            }
        })
    }
    
}



// M
// MARK:- TABLE METHOD
extension ListDetailVC: UITableViewDataSource,UITableViewDelegate{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRepo.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier:String = "ListDetail"
         
         var cell:ListCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListCell
         if (cell == nil)
         {
             let nib:Array = Bundle.main.loadNibNamed("ListCell", owner: self, options: nil)!
             cell = nib[1] as? ListCell
             cell?.selectionStyle = UITableViewCell.SelectionStyle.none
             cell?.backgroundColor = .clear
         }
        
        let model : RepoModel = self.arrRepo[indexPath.row]
        cell?.lblName.numberOfLines = 0
        cell?.lblName.text =  model.name + "\n" + model.fullName
        cell?.lblLink.text =  model.htmlUrl!
        cell?.lblFork.text = String(model.forksCount!) + " Forks"
        cell?.lblStar.text = String(model.stargazersCount!) + " Stars"
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model : RepoModel = self.arrRepo[indexPath.row]
  
        if let url = URL(string: model.htmlUrl) {
            UIApplication.shared.open(url)
        }
    }

}



// MARK:-
// MARK:- UISearchBarDelegate
extension ListDetailVC: UISearchBarDelegate{
    //MARK: UISearchbar delegate
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.searchController.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchController.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchController.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if searchText.count == 0 {
            self.arrRepo =  self.arrFilter
        } else {
            self.arrRepo = self.arrFilter.filter({($0.fullName.lowercased().contains(searchText.lowercased()))})
        }
        self.tblDetail.reloadData()
    }
    
}


