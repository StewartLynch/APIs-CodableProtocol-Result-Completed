/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 
 ## JSON Placeholder- users
 https://jsonplaceholder.typicode.com
 
 https://jsonplaceholder.typicode.com/users
 */
struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    struct Address: Codable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
    }
    let address: Address
    let phone: String
    let website: String
    struct Company: Codable {
        let name: String
        let catchPhrase: String
        let bs: String
    }
    let company: Company
}

APIService.getJSON(urlString: "https://jsonplaceholder.typicode.com/users") { (result: Result<[User], APIService.APIError>) in
    switch result {
    case.success(let users):
        for user in users {
            print("""
\(user.username)
   \(user.address.city)
   \(user.company.catchPhrase)
""")
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
