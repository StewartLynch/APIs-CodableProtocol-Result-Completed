/*:
 [< Previous](@previous)           [Home](Introduction)

 ## Challenge
 https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/

 All Albums by The Beatles: https://itunes.apple.com/lookup?id=136975&entity=album

*/
import Foundation

// print out a list of albums (collectionName), trackCount and relaseDate for the Beatles
struct Band: Codable {
    let resultCount: Int
    struct Result: Codable {
        let wrapperType: String
        let artistType: String?
        let artistName: String
        let artistLinkUrl: URL?
        let artistId: Int
        let amgArtistId: Int
        let primaryGenreName: String
        let primaryGenreId: Int?
        let collectionType: String?
        let collectionId: Int?
        let collectionName: String?
        let collectionCensoredName: String?
        let artistViewUrl: URL?
        let collectionViewUrl: URL?
        let artworkUrl60: URL?
        let artworkUrl100: URL?
        let collectionPrice: Double?
        let collectionExplicitness: String?
        let trackCount: Int?
        let copyright: String?
        let country: String?
        let currency: String?
        let releaseDate: Date?
    }
    let results: [Result]
}

let dateFormatter = DateFormatter()
// 1973-04-02T08:00:00Z
dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

APIService.getJSON(urlString: "https://itunes.apple.com/lookup?id=136975&entity=album",
                   dateDecodingStategy: .formatted(dateFormatter)) { (result: Result<Band,APIService.APIError>) in
    dateFormatter.dateStyle = .medium
    switch result {
    case .success(let band):
        let albums = band.results
        for album in albums {
            if let collectionName = album.collectionName {
                print("\(collectionName) - \(album.trackCount ?? 0) tracks.")
                if let releaseDate = album.releaseDate {
                    print("   Released on: \(dateFormatter.string(from:releaseDate))")
                }
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

 [< Previous](@previous)           [Home](Introduction)
 */
