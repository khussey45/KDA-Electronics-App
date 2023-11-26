

import UIKit

struct Desktop {
    let name: String
    let price: String
    let imageName: String // Name of the image in your assets
}

class DesktopsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    // Array to store desktop data
    let desktops = [
        Desktop(name: "iMac 24-inch", price: "$1299", imageName: "iMac24"),
        Desktop(name: "Dell XPS Desktop", price: "$999", imageName: "dellXPS"),
        Desktop(name: "HP Pavilion", price: "$749", imageName: "hp"),
        // Add more desktops here
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return desktops.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a cell of the type DesktopTableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DesktopCell", for: indexPath) as? DesktopTableViewCell else {
            fatalError("Dequeued cell is not an instance of DesktopTableViewCell.")
        }

        // Configure the cell
        let desktop = desktops[indexPath.row]
        cell.nameLabel.text = desktop.name
        cell.priceLabel.text = desktop.price
        cell.desktopImageView.image = UIImage(named: desktop.imageName)

        return cell
    }

    // ... Any additional methods or properties ...
}
