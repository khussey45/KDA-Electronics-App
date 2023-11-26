

import UIKit

struct GamingProduct {
    let name: String
    let price: String
    let imageName: String // Name of the image in your assets
}

class GamingViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    // Array to store gaming product data
    let gamingProducts = [
        GamingProduct(name: "PlayStation 5", price: "$499", imageName: "ps5"),
        GamingProduct(name: "Xbox Series X", price: "$499", imageName: "xboxSeriesX"),
        GamingProduct(name: "Nintendo Switch", price: "$299", imageName: "nintendoSwitch"),
        // Add more gaming products here
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140

        tableView.reloadData() // Add this line
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of gaming products: \(gamingProducts.count)")
        return gamingProducts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Dequeue a cell of the type GamingTableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GamingCell", for: indexPath) as? GamingTableViewCell else {
            fatalError("Dequeued cell is not an instance of GamingTableViewCell.")
        }

        // Configure the cell
        let gamingProduct = gamingProducts[indexPath.row]
        cell.nameLabel.text = gamingProduct.name
        cell.priceLabel.text = gamingProduct.price
        cell.gamingImageView.image = UIImage(named: gamingProduct.imageName)
        
        print("Configuring cell for \(gamingProduct.name)")
        return cell
    }

    // ... Any additional methods or properties ...
}
