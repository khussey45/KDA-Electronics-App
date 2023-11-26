

import UIKit

struct Tablet {
    let name: String
    let price: String
    let imageName: String // Name of the image in your assets
}

class TabletsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    // Array to store tablet data
    let tablets = [
        Tablet(name: "iPad Pro", price: "$999", imageName: "ipadPro"),
        Tablet(name: "Samsung Galaxy Tab S7", price: "$649", imageName: "s7"),
        Tablet(name: "Surface Pro 9", price: "$899", imageName: "surfacePro9"),
        // Add more tablets here
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a cell of the type TabletTableViewCell
        print("Dequeued cell type: \(type(of: tableView.dequeueReusableCell(withIdentifier: "TabletCell", for: indexPath)))")

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TabletCell", for: indexPath) as? TabletTableViewCell else {
            fatalError("Dequeued cell is not an instance of TabletTableViewCell.")
        }

        // Configure the cell
        let tablet = tablets[indexPath.row]
        cell.nameLabel.text = tablet.name
        cell.priceLabel.text = tablet.price
        cell.tabletImageView.image = UIImage(named: tablet.imageName)

        return cell
    }

    // ... Any additional methods or properties ...
}
