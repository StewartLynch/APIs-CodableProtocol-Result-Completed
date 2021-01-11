/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## Mockaroo.com
 https://mockaroo.com
 
 Schema: https://mockaroo.com/885b3cd0
 
 API: https://my.api.mockaroo.com/family.json?key=5ef27fa0

*/
import Foundation

struct Family: Codable {
    let id: Int
    let gender: String
    let firstName: String
    let lastName: String
    struct Address: Codable {
        let city: String
        let country: String
    }
    let address: Address
    let birthDate: Date
    struct Sibling: Codable {
        let firstName: String
        let relationship: String
        let birthDate: Date
    }
    let siblings: [Sibling]
}

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-mm-dd"
APIService.getJSON(urlString: "https://my.api.mockaroo.com/family.json?key=5ef27fa0",
                   dateDecodingStategy: .formatted(dateFormatter)) { (result: Result<[Family], APIService.APIError>) in
    switch result {
    case .success(let families):
        for family in families {
            print(family.firstName)
            for sibling in family.siblings {
                print("   ", sibling.firstName, "-", dateFormatter.string(from: sibling.birthDate))
            }
        }
    case .failure(let error):
        switch error {
        case .error(let errorString):
            print(errorString)
        }
    }
}
/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
