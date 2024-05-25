//
//  ViewController.swift
//  Assigment
//
//  Created by Apple on 25/05/24.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,User_Protocol {
    func DidChange(user: [UsermodelElement]) {
        UserList = user
        DispatchQueue.main.async {
            self.tableview.reloadData()
            self.loadingData = true
            self.topage = self.topage + 10
        }
    }
    
 
    
    @IBOutlet weak var tableview: UITableView!
    
    var UserList : [UsermodelElement] = []
    
    var modelobj = UserViewModel()
    var activityIndicator: UIActivityIndicatorView?
    var loadingData = true
    var frompage = 1
    var topage:Int = 10


    override func viewDidLoad() {
        super.viewDidLoad()
        modelobj.protocolobj = self
        modelobj.fetchData(from: 1, to: topage)
        tableview.rowHeight = 100
        self.title = "Assignment"
    }
    
    
    func configureActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.center = self.view.center
        activityIndicator?.hidesWhenStopped = true
        if let activityIndicator = activityIndicator {
            self.view.addSubview(activityIndicator)
        }
    }
    
    func showActivityIndicator() {
        activityIndicator?.startAnimating()
    }

    func hideActivityIndicator() {
        activityIndicator?.stopAnimating()
    }
    
    func loadMoreData() {
        if loadingData{
            print("at ed")
            print(topage)
            showActivityIndicator()
            loadingData = false
            modelobj.fetchData(from: 1, to: topage + 10)
            
        }else{
            
        }

     }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        UserList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell") as! UserTableViewCell
        cell.id.text = "\(UserList[indexPath.row].id)"
        cell.title.text = UserList[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPost = UserList[indexPath.row]
        
//        let /*detailVC*/ = DetailViewController()
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        // Transfer the selected post data to the detail view controller
        vc.post = selectedPost
        
        // Push the detail view controller onto the navigation stack
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // UIScrollViewDelegate Method
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height

        if offsetY > contentHeight - height {
            loadMoreData()
        }
    }
}

