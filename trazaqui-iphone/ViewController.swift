import UIKit
import SwiftyJSON

class ViewController : UIViewController {
    
    @IBOutlet weak var itinerariesButton: UIButton!
    let api: RestApiManager = RestApiManager()
    var itinerariesController: ItinerariesController = ItinerariesController()
    
    
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
            itinerariesController.addJSONObject(itinerary, labelName: "_id", childName: "places")
        }
        
        itinerariesController.showTable(self.navigationController)

    }
}
