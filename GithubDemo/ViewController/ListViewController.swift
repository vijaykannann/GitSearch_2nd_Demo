//
//  ListViewController.swift
//  GithubDemo
//
//  Created by varun on 06/05/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    var strSearch : String = ""
    
    var pagelimit : Int = 15
    var pageOffset : Int = 0

    @IBOutlet weak var tblList: UITableView!
    fileprivate lazy var searchController = UISearchController(searchResultsController: nil)

    var arrList = [ListModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
          navigationItem.searchController = searchController

          searchController.obscuresBackgroundDuringPresentation = false
          searchController.hidesNavigationBarDuringPresentation = false
          searchController.searchBar.placeholder                = "Search"
          searchController.searchBar.delegate                   = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesSearchBarWhenScrolling = false
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationItem.hidesSearchBarWhenScrolling = true
        super.viewDidAppear(animated)
    }
    


    func callwebService (params : NSDictionary ,isProgress: Bool, completionHandler: @escaping (Bool) -> Void)
    {
        if isProgress {
            CommonUnit.progressHUD(.showProgress)
        }
        
        let strApi = Constant.App.BaseURL + WSAPI.search.rawValue + "\(strSearch)+in:fullname"
        
        WSClient.sharedInstance.getRequestForAPIString(encodeType: .urlEnocding , api: strApi , parameters: params , completionHandler: { (responseObject, error) in
            
            if error == nil {
                     
                self.arrList = [ListModel]()

                guard let items: NSArray = responseObject?["items"] as? NSArray else {
                    CommonUnit.progressHUD(.dismissProgress)
                    self.tblList.reloadData()
                    return
                }
                
                
                for (_, element) in items.enumerated()  {
                    let model : ListModel = ListModel.init(object: element as! NSDictionary)
                    self.arrList.append(model)
                }
                                                                    
                if isProgress {
                    CommonUnit.progressHUD(.dismissProgress)
                }
    
                self.tblList.reloadData()
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
extension ListViewController: UITableViewDataSource,UITableViewDelegate{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
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
        let cellIdentifier:String = "ListCell"
         
         var cell:ListCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListCell
         if (cell == nil)
         {
             let nib:Array = Bundle.main.loadNibNamed("ListCell", owner: self, options: nil)!
             cell = nib[0] as? ListCell
             cell?.selectionStyle = UITableViewCell.SelectionStyle.none
             cell?.backgroundColor = .clear
         }
        
        let model : ListModel = self.arrList[indexPath.row]
        cell?.lblName.text = model.login!
        cell?.imgName?.af_setImage(withURL:NSURL(string : model.avatarUrl)! as URL, placeholderImage: UIImage(named: "placeholder"))
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model : ListModel = self.arrList[indexPath.row]

        let obj = Constant.Common.mainStoryBoard.instantiateViewController(withIdentifier:"ListDetailVC") as! ListDetailVC
        obj.modelList = model
        self.navigationController?.pushViewController(obj, animated: true)
    }

}



// MARK:-
// MARK:- UISearchBarDelegate
extension ListViewController: UISearchBarDelegate{
    //MARK: UISearchbar delegate
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        CommonUnit.progressHUD(.dismissProgress)

    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        CommonUnit.progressHUD(.dismissProgress)

        self.searchController.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        CommonUnit.progressHUD(.dismissProgress)

        self.searchController.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        CommonUnit.progressHUD(.dismissProgress)

        self.searchController.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        self.strSearch = searchText
        
        self.callwebService(params: ["sort":"stars",
                                 "order":"desc",
                                 "page":"1",
                                 "per_page":"100"], isProgress: true) { (isSucess) in
            
         }
    }
    
}


