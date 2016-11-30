import Alamofire
import SwiftyJSON

class RestApiManager: NSObject {

    func request(callback: @escaping (JSON) -> Void) {
        Alamofire.request("http://localhost:3000/api/itineraries").responseData { response in
            debugPrint("All Response Info: \(response)")
            let res = JSON(data: response.result.value!)
            callback(res)
//            let itineraries = JSON(data: response.result.value!)
//            viewController.addItineraries(data: itineraries.array!)
//            let itinerary = self.itineraries
//            debugPrint(itineraries[0]["places"][0]["name"])
//            if let data = response.result.value, let utf8Text = String(data: data, encoding: .utf8) {
//                itineraries = utf8Text
//            }
        }
    }
}
