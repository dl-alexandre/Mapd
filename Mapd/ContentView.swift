//
//  ContentView.swift
//  Mapd
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CimisView()
    }
}


import Combine

struct CimisView: View {
//	@ObservedObject var data: Cimis
//	@State var data: Record
	
	
//
	var body: some View {
		VStack {
			Button(action: {
				
				//infultrategovsystems()
				print("Button action")
			}) {
				HStack {
					//Image(systemName: "plus.fill")
					Text("Add Unit")
				}
			}
			Text("Data will go here")
				//			Text(data.date)
		}
	}
}




//extension Bundle {
//	func decode<T: Decodable>(_ type: T.Type, from file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
//		guard let url = self.url(forResource: file, withExtension: nil) else {
//			fatalError("Failed to locate \(file) in bundle.")
//		}
//
//		guard let data = try? Data(contentsOf: url) else {
//			fatalError("Failed to load \(file) from bundle.")
//		}
//
//		let decoder = JSONDecoder()
//
//		decoder.dateDecodingStrategy = dateDecodingStrategy
//		decoder.keyDecodingStrategy = keyDecodingStrategy
//
//		do {
//			return try decoder.decode(T.self, from: data)
//		} catch DecodingError.keyNotFound(let key, let context) {
//			fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
//		} catch DecodingError.typeMismatch(_, let context) {
//			fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
//		} catch DecodingError.valueNotFound(let type, let context) {
//			fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
//		} catch DecodingError.dataCorrupted(_) {
//			fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
//		} catch {
//			fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
//		}
//	}
//}

//struct StationLoader {
//	var urlSession = URLSession.shared
//
//	func loadStation(withID id: MyRecords.Station) -> AnyPublisher<MyData, Error> {
//		urlSession.dataTaskPublisher(for: resolveURL(forID: Station))
//	  .map(\.data)
//	  .decode(type: MyData.NetworkResponse.self, decoder: JSONDecoder())
//	  .map(\.result)
//	  .eraseToAnyPublisher()
//	}
//}
//
//

import Combine

class Store: ObservableObject {
	@Published var name: String = ""
	@Published var age: Int = 0

	func stationPull() {
		let qiappKey = URLQueryItem(name: "appKey", value: "bb4f71ac-f2a0-4da9-b3aa-dd7cc2417b83")
		let qitarget = URLQueryItem(name: "targets", value: "259")
		let qistartDate = URLQueryItem(name: "startDate", value: "2020-01-05")
		let qiendDate = URLQueryItem(name: "endDate", value: "2020-01-07")
		
		var components = URLComponents()
		components.scheme = "http"
		components.host = "et.water.ca.gov"
//		components.path = "/api/station"
		components.path = "/api/data"
		//components.password = "bb4f71ac-f2a0-4da9-b3aa-dd7cc2417b83"
		components.queryItems = [qiappKey,qitarget,qistartDate,qiendDate]
		guard let url = components.url else { return }
		
	let session = URLSession.shared.dataTaskPublisher(for: url)
			.map { data, _ in data }
   .decode(type: Cimis.self, decoder: JSONDecoder())
   // Proper error handling omitted
   .mapError { error in fatalError("\(error)") }
   .sink { station in
	print(station)
   }
		
		
		let decoder = JSONDecoder()
		decoder.dataDecodingStrategy = .deferredToData
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		
		session.cancel()
	
		
//		let task = session.dataTask(with: url, completionHandler: { data, response, error in
//			guard let data = data, error == nil else {
//				print("something went wrong")
//				return
//			}
//			print("data: \(data)")
//			print(response ?? "o respose")
//
//		})
	}
}

extension URLSession {
  func decodeJson <T:Decodable> (_ type : T.Type , urlString : String ,
	 completion: @escaping (Result<T, Error>)->Void,
	 dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
	 keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys)  {

	 guard let url = URL(string: urlString) else {
		return
	 }

	 let task = self.dataTask(with: url, completionHandler: { data, response, error in

		if let error = error {
			completion(.failure(error))
		}
		else {
			do {
			   let decoder = JSONDecoder()
			   decoder.dateDecodingStrategy = dateDecodingStrategy
			   decoder.keyDecodingStrategy = keyDecodingStrategy

			   let results = try decoder.decode(T.self, from: data!)
			   completion(.success(results))
			}
			catch {
			   completion(.failure(error))
			}
		}
	 })
	 task.resume()
  }
}



func dailyPull() {
	//	let items = []?
	let session = URLSession.shared
	
	let qiappKey = URLQueryItem(name: "appKey", value: "bb4f71ac-f2a0-4da9-b3aa-dd7cc2417b83")
	let qitarget = URLQueryItem(name: "targets", value: "259")
	let qistartDate = URLQueryItem(name: "startDate", value: "2020-01-05")
	let qiendDate = URLQueryItem(name: "endDate", value: "2020-01-07")
	
	let decoder = JSONDecoder()
	decoder.dataDecodingStrategy = .deferredToData
	decoder.keyDecodingStrategy = .convertFromSnakeCase
	
	
	
	
	var components = URLComponents()
	components.scheme = "http"
	components.host = "et.water.ca.gov"
	components.path = "/api/data"
	//components.password = "bb4f71ac-f2a0-4da9-b3aa-dd7cc2417b83"
	components.queryItems = [qiappKey,qitarget,qistartDate,qiendDate]
	
	guard let url = components.url else { return }
	
	//guard let url = URL(string: "http://et.water.ca.gov/api/data?appKey=bb4f71ac-f2a0-4da9-b3aa-dd7cc2417b83&targets=259&startDate=2019-08-05&endDate=2020-04-01") else { return }
	
	//	let publisher = URLSession.shared.dataTaskPublisher(for: url)
	
	//	let cancellable = publisher.sink(
	//		receiveCompletion: { completion in
	//			switch completion {
	//			case .failure(let error):
	//				print(error)
	//			case .finished:
	//				print("Success")
	//			}
	//		},
	//		receiveValue: { value in
	//			let decoder = JSONDecoder()
	//
	//			do {
	//				let station = try decoder.decode(Station.self, from: value.data)
	//				print(station)
	//			} catch {
	//				print(error)
	//			}
	//		}
	//	)
	
	
	let task = session.dataTask(with: url, completionHandler: { data, response, error in
		guard let data = data, error == nil else {
			print("something went wrong")
			return
		}
		print("data: \(data)")
	
//	let task = session.cimisTask(with: url, completionHandler: { data, response, error in
//		guard let data = data, error == nil else {
//			print("something went wrong")
//			return
//		}
	//	print("data: \(data)")
	
		//var result: weatherStoreService?
//		do {
//			result = Bundle.main.decode(NetworkResponse.self, from: "data")
//			let result = try decoder.decode([weatherStoreService].self, from: data)
//
//
//		} catch let DecodingError.dataCorrupted(context) {
//			print(context)
//		} catch let DecodingError.keyNotFound(key, context) {
//			print("Key '\(key)' not found:", context.debugDescription)
//			print("codingPath:", context.codingPath)
//		} catch let DecodingError.valueNotFound(value, context) {
//			print("Value '\(value)' not found:", context.debugDescription)
//			print("codingPath:", context.codingPath)
//		} catch let DecodingError.typeMismatch(type, context)  {
//			print("Type '\(type)' mismatch:", context.debugDescription)
//			print("codingPath:", context.codingPath)
//		} catch {
//			print("error: ", error)
//		}
//		guard let json = result else {
//			return
//		}
//
		//		DispatchQueue.main.async {
		//				if let data = data {
		//					Item = String(decoding: data, as: UTF8.self)
		//				} else {
		//					Item = error?.localizedDescription
		//				}
		//			}
		
		
	//	print(data.with())
	//	print(data.data.providers)
		print(response ?? "no response")
//		print(result ?? "result error")
		print(error ?? "no error error")
		print(data)
	//	print(json.Providers.count)
		
		
	})
	
	task.resume()
	
	//	if error != nil {
	//		// OH NO! An error occurred...
	//		self.handleClientError(error)
	//		return
	//	}
	
}

//struct CimisView_Previews: PreviewProvider {
//	static var previews: some View {
//		CimisView()
//	}
//}
////
//extension URLSession {
//	func publisher<T: Decodable>(
//		for url: URL,
//		responseType: T.Type = T.self,
//		decoder: JSONDecoder = .init()
//	) -> AnyPublisher<T, Error> {
//		dataTaskPublisher(for: url)
//			.map(\.data)
//			.decode(type: NetworkResponse<T>.self, decoder: decoder)
//			.map(\.result)
//			.eraseToAnyPublisher()
//	}
//}

//extension NetworkResponse {
//	struct CodingData: Codable {
//		struct Container: Codable {
//			struct MyProviders: Codable {
//				struct MyRecords: Codable {
//
//				}
//
//				var Name: String
//				var `Type`: String
//				var Owner: String
//				var Records: [MyRecords]
//			}
//			var Providers: [MyProviders]
//		}
//		var Data: Container
//	}
//}

//extension NetworkResponse.CodingData.Container.MyProviders.MyRecords {
//	var record: NetworkResponse {
//		return NetworkResponse(
//
//		)
//	}
//}
//
//struct weatherStoreService: Decodable {
//	let Providers: [Provider]
//
//	struct Provider: Decodable {
//		let Name: String
//		let `Type`: String
//		let Owner: String
//		let Records: [Record]
//
//		struct Record: Decodable {
//			let Date: String
//			var Julian: String
//			var Station: String
//			var ZipCodes: String
//			var Scope: String
//			var DayAirTmpAvg: weatherStore.VQU
//			var DayAirTmpMax: weatherStore.VQU
//			var DayAirTmpMin: weatherStore.VQU
//			var DayDewPnt: weatherStore.VQU
//			var DayAsceEto: weatherStore.VQU
//			var DayPrecip: weatherStore.VQU
//			var DayRelHumAvg: weatherStore.VQU
//			var DayRelHumMax: weatherStore.VQU
//			var DayRelHumMin: weatherStore.VQU
//			var DaySoilTmpAvg: weatherStore.VQU
//			var DaySolRadAvg: weatherStore.VQU
//			var DayVapPresAvg: weatherStore.VQU
//			var DayWindRun: weatherStore.VQU
//			var DayWindSpdAvg: weatherStore.VQU
//		}
//	}
//}
//
//	struct weatherStore {
//		var Date: String
//		var Julian: String
//		var Station: String
//		var ZipCodes: String
//		var Scope: String
//		var DayAirTmpAvg: [VQU]
//		var DayAirTmpMax: [VQU]
//		var DayAirTmpMin: [VQU]
//		var DayDewPnt: [VQU]
//		var DayAsceEto: [VQU]
//		var DayPrecip: [VQU]
//		var DayRelHumAvg: [VQU]
//		var DayRelHumMax: [VQU]
//		var DayRelHumMin: [VQU]
//		var DaySoilTmpAvg: [VQU]
//		var DaySolRadAvg: [VQU]
//		var DayVapPresAvg: [VQU]
//		var DayWindRun: [VQU]
//		var DayWindSpdAvg: [VQU]
//
//		struct VQU: Codable {
//			var Value: String
//			var Qc: String
//			var Unit: String
//		}
//	}
//
//
//extension weatherStore {
//	init(from service: weatherStoreService.Provider.Record) {
//		Date = service.Date
//		Julian = service.Julian
//		Scope = service.Scope
//		ZipCodes = service.ZipCodes
//		Scope = service.Scope
//		//Data.Providers = service.provider
//		DayAirTmpAvg = []
//		DayAirTmpMax = []
//		DayAirTmpMin = []
//		DayDewPnt = []
//		DayAsceEto = []
//		DayPrecip = []
//		DayRelHumAvg = []
//		DayRelHumMax = []
//		DayRelHumMin = []
//		DaySoilTmpAvg = []
//		DaySolRadAvg = []
//		DayVapPresAvg = []
//		DayWindRun = []
//		DayWindSpdAvg = []
//
//		for record in service.DayAirTmpAvg {
//				DayAirTmpAvg.append(record.DayAirTmpAvg)
//				DayAirTmpMax.append(record.DayAirTmpMax)
//		}
//	}
//}



//struct Provider {
//	var Name: String
//	var `Type`: String
//	var Owner: String
//	var Records: [Record]
//}


//	struct Provider {
//		struct MyData: Codable { // Data
//			var Providers = [MyProviders]()
//			struct MyProviders: Codable { // Providers
//				struct MyRecords: Codable { // Records
//					//				struct MyZips: Codable {
//					//					let Zips: String
//					//				}
//
//					struct VQU: Codable {
//						var Value: String
//						var Qc: String
//						var Unit: String
//					}
//
//					var Date: String
//					var Julian: String
//					var Station: String
//					var ZipCodes: String
//					var Scope: String
//					var DayAirTmpAvg: VQU
//					var DayAirTmpMax: VQU
//					var DayAirTmpMin: VQU
//					var DayDewPnt: VQU
//					var DayAsceEto: VQU
//					var DayPrecip: VQU
//					var DayRelHumAvg: VQU
//					var DayRelHumMax: VQU
//					var DayRelHumMin: VQU
//					var DaySoilTmpAvg: VQU
//					var DaySolRadAvg: VQU
//					var DayVapPresAvg: VQU
//					var DayWindRun: VQU
//					var DayWindSpdAvg: VQU
//				}
//
//				var Name: String
//				var `Type`: String
//				var Owner: String
//				var Records: [MyRecords]
//			}
//
//
//		}
//		var Data: MyData!
//	}
//}

//struct NetworkResponse<Wrapped: Decodable>: Decodable {
//	var result: MyData
//}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
