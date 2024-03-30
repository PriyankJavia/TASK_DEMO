//
//  ListingVC.swift
//  demo
//
//  Created by Priyank Javia on 30/03/24.
//

import UIKit

class ListingVC: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var tblViewListing: UITableView!
    
    //MARK: Variables
    var arrFruits : [FruitDataModel] = [.init(fruitName: "Apple"),
                                        .init(fruitName: "Banana"),
                                        .init(fruitName: "Kiwi"),
                                        .init(fruitName: "Watermelon"),
                                        .init(fruitName: "Grapes")]
    //MARK: Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewListing.dataSource = self
        tblViewListing.delegate = self
    }
}

//MARK: Tableview delegate and datasource

extension ListingVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListingTVCell", for: indexPath) as! ListingTVCell
        cell.lblFruitName.text = arrFruits[indexPath.row].fruitName
        cell.onVerifyBtnTapped = {
            let alert = UIAlertController(title: self.arrFruits[indexPath.row].fruitName, message: "", preferredStyle: .alert)
            alert.addAction(.init(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        return cell
    }
}
