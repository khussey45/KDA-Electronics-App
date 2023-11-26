
import UIKit

struct CellPhone {
    let name: String
    let price: String
    let imageName: String // Name of the image in your assets
}


class PhonesViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    // Array to store cell phone data
    let cellPhones = [
        CellPhone(name: "iPhone 13", price: "$799", imageName: "iphone13"),
        CellPhone(name: "iPhone 14", price: "$899", imageName: "iphone14"),
        CellPhone(name: "iPhone 15", price: "$999", imageName: "iphone15"),
        CellPhone(name: "Samsung Galaxy S22", price: "$949", imageName: "s22"),
        // Add more phones here
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
              tableView.estimatedRowHeight = 140
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellPhones.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a cell of the type PhoneTableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneCell", for: indexPath) as? PhoneTableViewCell else {
            fatalError("Dequeued cell is not an instance of PhoneTableViewCell.")
        }

        // Configure the cell
        let phone = cellPhones[indexPath.row]
        cell.nameLabel.text = phone.name
        cell.priceLabel.text = phone.price
        cell.phoneImageView.image = UIImage(named: phone.imageName)
        
        print("Cell frame after configuration: \(cell.frame)")
        
        print("NameLabel intrinsic size: \(cell.nameLabel.intrinsicContentSize)")

        return cell
    }
    

}
