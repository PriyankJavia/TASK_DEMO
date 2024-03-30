//
//  ListingTVCell.swift
//  demo
//
//  Created by Priyank Javia on 30/03/24.
//

import UIKit

class ListingTVCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var lblFruitName: UILabel!
    
    @IBOutlet weak var btnVerify: UIButton!
    
    //MARK: Variables
    var onVerifyBtnTapped : (() -> ())?
    
    //MARK: Life cycles
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //MARK: IBActions
    @IBAction func btnVerifyTapped(_ sender: Any) {
        onVerifyBtnTapped?()
    }
}
