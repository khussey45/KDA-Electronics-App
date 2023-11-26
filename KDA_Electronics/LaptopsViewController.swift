

import UIKit

struct Laptop {
    let name: String
    let price: String
    let imageName: String // Name of the image in your assets
}

class LaptopsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    // Array to store laptop data
    let laptops = [
        Laptop(name: "MacBook Pro 16-inch", price: "$2399", imageName: "macbook"),
        Laptop(name: "Dell XPS 13", price: "$1299", imageName: "dellXPS13"),
        Laptop(name: "HP Spectre x360", price: "$1499", imageName: "hpspectre"),
        // Add more laptops here
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laptops.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a cell of the type LaptopTableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LaptopCell", for: indexPath) as? LaptopTableViewCell else {
            fatalError("Dequeued cell is not an instance of LaptopTableViewCell.")
        }

        // Configure the cell
        let laptop = laptops[indexPath.row]
        cell.nameLabel.text = laptop.name
        cell.priceLabel.text = laptop.price
        cell.laptopImageView.image = UIImage(named: laptop.imageName)

        return cell
    }

    // ... Any additional methods or properties ...
}
