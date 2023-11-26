

import UIKit

class PhoneTableViewCell: UITableViewCell {

    @IBOutlet weak var phoneImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    // Add any additional setup or functions you might need for this cell
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        print("PhoneImageView frame: \(phoneImageView.frame)")
//        print("NameLabel frame: \(nameLabel.frame)")
//        print("PriceLabel frame: \(priceLabel.frame)")
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.constraints.forEach { constraint in
            print("Constraint: \(constraint)")
        }
    }




}
