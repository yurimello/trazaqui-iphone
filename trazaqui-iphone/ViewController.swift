import UIKit
import SwiftyJSON

class ViewController : UIViewController {
    
    @IBOutlet weak var itinerariesButton: UIButton!
    let api: RestApiManager = RestApiManager()
    let itinerariesController: ItinerariesController = ItinerariesController()
    
    override func viewDidLoad() {
        itinerariesButton.addTarget(self , action: #selector(self.makeRequest), for: .touchUpInside)
        
        super.viewDidLoad()
    }
    
    func makeRequest(){
        self.api.request(callback: myCallback)
    }
    
    func myCallback(_ response: JSON){
        itinerariesController.resetData()
        for itinerary in response.array! {
            itinerariesController.addItinerary(itinerary)
        }
        itinerariesController.tableView.reloadData()
        self.navigationController?.pushViewController(self.itinerariesController, animated: true)
    }
    
    func addItineraries(data: Array<JSON>){
        var y = 50
        for itinerary in data {
            for place in itinerary["places"].array!{
                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
                label.center = CGPoint(x: 160, y: y)
                label.textAlignment = .center
                label.text = place["name"].string!
                
                self.view.addSubview(label)
                y = y + 30
            }
        }
    }
}
