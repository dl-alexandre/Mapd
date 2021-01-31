import UIKit
import Combine

var str = "Hello, playground"


import Combine
import Foundation

struct User: Codable {
  var id: Int
  var name: String
  var email: String
}


//var components = URLComponents()
//components.scheme = "http"
//components.host = "et.water.ca.gov"
//components.path = "/api/station"
//guard let url = components.url else { return }
let url = "http://et.water.ca.gov/api/station"

let request = URLSession.shared.dataTaskPublisher(for: url)
  .map { data, _ in data }
  .decode(type: User.self, decoder: JSONDecoder())
  // Proper error handling omitted
  .mapError { error in fatalError("\(error)") }
  .sink { user in
	print(user)
  }

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
