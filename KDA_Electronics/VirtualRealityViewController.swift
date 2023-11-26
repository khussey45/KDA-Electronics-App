

import UIKit

struct VRProduct {
    let name: String
    let price: String
    let imageName: String // Name of the image in your assets
}

class VirtualRealityViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    // Array to store VR product data
    let vrProducts = [
        VRProduct(name: "Meta Quest 3", price: "$599", imageName: "metaQuest3"),
        VRProduct(name: "HTC Vive Cosmos", price: "$699", imageName: "viveCosmos"),
        VRProduct(name: "Valve Index", price: "$999", imageName: "valveIndex"),
        // Add more VR products here
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vrProducts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a cell of the type VRTableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VRCell", for: indexPath) as? VirtualRealityTableViewCell else {
            fatalError("Dequeued cell is not an instance of VirtualRealityTableViewCell.")
        }

        // Configure the cell
        let vrProduct = vrProducts[indexPath.row]
        cell.nameLabel.text = vrProduct.name
        cell.priceLabel.text = vrProduct.price
        cell.vrImageView.image = UIImage(named: vrProduct.imageName)

        return cell
    }

    // ... Any additional methods or properties ...
}
