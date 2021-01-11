/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## JSON Placeholder - ToDos
 https://jsonplaceholder.typicode.com
 
 https://jsonplaceholder.typicode.com/todos/

*/
struct ToDo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

APIService.getJSON(urlString: "https://jsonplaceholder.typicode.com/todos/") { (result: Result<[ToDo], APIService.APIError>) in
    switch result {
    case .success(let todos):
        for todo in todos {
            print(todo.title, "-", todo.completed)
        }
    case .failure(let error):
        switch error {
        case .error(let errorString):
            print(errorString)
        }
    }
}
