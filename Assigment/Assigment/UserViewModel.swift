//
//  UserViewModel.swift
//  Assigment
//
//  Created by Apple on 25/05/24.
//

import Foundation
import UIKit

protocol User_Protocol{
    func DidChange (user:[UsermodelElement])
}

class UserViewModel{
    var userobj :[UsermodelElement] = []
    var protocolobj :User_Protocol?
    
    
    func fetchData(from:Int, to:Int){
        let url = URL(string:"https://jsonplaceholder.typicode.com/posts?_page=\(from)&_limit=\(to)")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data ,error == nil else{
                print("error Fetching data")
                return
            }
            do{
                let userdata = try JSONDecoder().decode([UsermodelElement].self, from: data)
                self.protocolobj?.DidChange(user: userdata)
            }catch{
                print("Error catch")
            }
        }.resume()
    }
}
