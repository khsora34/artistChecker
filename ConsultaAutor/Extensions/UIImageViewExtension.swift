import UIKit
import Alamofire

extension UIImageView {
    func setImage(with url: String) {
        self.image = UIImage(named: "placeholder")
        Alamofire.request(url).responseImage { response in
            if let image = response.result.value {
                self.image = image
            }
        }
    }
}
