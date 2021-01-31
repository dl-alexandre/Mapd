//
//{
//	"Data": {
//		"Providers": [
//			{
//				"Name": "cimis",
//				"Type": "station",
//				"Owner": "water.ca.gov",
//				"Records": [
//					{
//						"Date": "2020-04-01",
//						"Julian": "92",
//						"Station": "259",
//						"Standard": "english",
//						"ZipCodes": "95536, 95540, 95551",
//						"Scope": "daily",
//						"DayAirTmpAvg": {
//							"Value": "45.3",
//							"Qc": " ",
//							"Unit": "(F)"
//						},
//						"DayAirTmpMax": {
//							"Value": "52.3",
//							"Qc": " ",
//							"Unit": "(F)"
//						},
//						"DayAirTmpMin": {
//							"Value": "35.2",
//							"Qc": " ",
//							"Unit": "(F)"
//						},
//						"DayDewPnt": {
//							"Value": "39.7",
//							"Qc": " ",
//							"Unit": "(F)"
//						},
//						"DayAsceEto": {
//							"Value": "0.11",
//							"Qc": " ",
//							"Unit": "(in)"
//						},
//						"DayPrecip": {
//							"Value": "0.02",
//							"Qc": "H",
//							"Unit": "(in)"
//						},
//						"DayRelHumAvg": {
//							"Value": "81",
//							"Qc": " ",
//							"Unit": "(%)"
//						},
//						"DayRelHumMax": {
//							"Value": "99",
//							"Qc": " ",
//							"Unit": "(%)"
//						},
//						"DayRelHumMin": {
//							"Value": "62",
//							"Qc": " ",
//							"Unit": "(%)"
//						},
//						"DaySoilTmpAvg": {
//							"Value": "53.9",
//							"Qc": " ",
//							"Unit": "(F)"
//						},
//						"DaySolRadAvg": {
//							"Value": "561",
//							"Qc": " ",
//							"Unit": "(Ly/day)"
//						},
//						"DayVapPresAvg": {
//							"Value": "8.3",
//							"Qc": " ",
//							"Unit": "(mBars)"
//						},
//						"DayWindRun": {
//							"Value": "161.2",
//							"Qc": " ",
//							"Unit": "(MPH)"
//						},
//						"DayWindSpdAvg": {
//							"Value": "6.7",
//							"Qc": " ",
//							"Unit": "(MPH)"
//						}
//					},
//					{
//						"Date": "2020-04-02",
//						"Julian": "93",
//						"Station": "259",
//						"Standard": "english",
//						"ZipCodes": "95536, 95540, 95551",
//						"Scope": "daily",
//						"DayAirTmpAvg": {
//							"Value": "43.4",
//							"Qc": "Y",
//							"Unit": "(F)"
//						},
//						"DayAirTmpMax": {
//							"Value": "53.6",
//							"Qc": " ",
//							"Unit": "(F)"
//						},
//						"DayAirTmpMin": {
//							"Value": "30.3",
//							"Qc": "Y",
//							"Unit": "(F)"
//						},
//						"DayDewPnt": {
//							"Value": "38.8",
//							"Qc": "Y",
//							"Unit": "(F)"
//						},
//						"DayAsceEto": {
//							"Value": "0.1",
//							"Qc": "R",
//							"Unit": "(in)"
//						},
//						"DayPrecip": {
//							"Value": "0",
//							"Qc": " ",
//							"Unit": "(in)"
//						},
//						"DayRelHumAvg": {
//							"Value": "84",
//							"Qc": "Y",
//							"Unit": "(%)"
//						},
//						"DayRelHumMax": {
//							"Value": "100",
//							"Qc": " ",
//							"Unit": "(%)"
//						},
//						"DayRelHumMin": {
//							"Value": "69",
//							"Qc": " ",
//							"Unit": "(%)"
//						},
//						"DaySoilTmpAvg": {
//							"Value": "52.8",
//							"Qc": " ",
//							"Unit": "(F)"
//						},
//						"DaySolRadAvg": {
//							"Value": "497",
//							"Qc": " ",
//							"Unit": "(Ly/day)"
//						},
//						"DayVapPresAvg": {
//							"Value": "8",
//							"Qc": " ",
//							"Unit": "(mBars)"
//						},
//						"DayWindRun": {
//							"Value": "164.9",
//							"Qc": " ",
//							"Unit": "(MPH)"
//						},
//						"DayWindSpdAvg": {
//							"Value": "6.9",
//							"Qc": " ",
//							"Unit": "(MPH)"
//						}
//					}
//				]
//			}
//		]
//	}
//}
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cimis = try Cimis(json)

import Foundation

// MARK: - Cimis
public class Cimis: Codable {
	public let data: DataClass?

	enum CodingKeys: String, CodingKey {
		case data = "Data"
	}

	public init(data: DataClass?) {
		self.data = data
	}
}

// MARK: Cimis convenience initializers and mutators

public extension Cimis {
	convenience init(data: Data) throws {
		let me = try newJSONDecoder().decode(Cimis.self, from: data)
		self.init(data: me.data)
	}

	convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
		guard let data = json.data(using: encoding) else {
			throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
		}
		try self.init(data: data)
	}

	convenience init(fromURL url: URL) throws {
		try self.init(data: try Data(contentsOf: url))
	}

	func with(
		data: DataClass?? = nil
	) -> Cimis {
		return Cimis(
			data: data ?? self.data
		)
	}

	func jsonData() throws -> Data {
		return try newJSONEncoder().encode(self)
	}

	func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
		return String(data: try self.jsonData(), encoding: encoding)
	}
}

// MARK: - DataClass
public class DataClass: Codable {
	public let providers: [Provider]?

	enum CodingKeys: String, CodingKey {
		case providers = "Providers"
	}

	public init(providers: [Provider]?) {
		self.providers = providers
	}
}

// MARK: DataClass convenience initializers and mutators

public extension DataClass {
	convenience init(data: Data) throws {
		let me = try newJSONDecoder().decode(DataClass.self, from: data)
		self.init(providers: me.providers)
	}

	convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
		guard let data = json.data(using: encoding) else {
			throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
		}
		try self.init(data: data)
	}

	convenience init(fromURL url: URL) throws {
		try self.init(data: try Data(contentsOf: url))
	}

	func with(
		providers: [Provider]?? = nil
	) -> DataClass {
		return DataClass(
			providers: providers ?? self.providers
		)
	}

	func jsonData() throws -> Data {
		return try newJSONEncoder().encode(self)
	}

	func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
		return String(data: try self.jsonData(), encoding: encoding)
	}
}

// MARK: - Provider
public class Provider: Codable {
	public let name, type, owner: String?
	public let records: [Record]?

	enum CodingKeys: String, CodingKey {
		case name = "Name"
		case type = "Type"
		case owner = "Owner"
		case records = "Records"
	}

	public init(name: String?, type: String?, owner: String?, records: [Record]?) {
		self.name = name
		self.type = type
		self.owner = owner
		self.records = records
	}
}

// MARK: Provider convenience initializers and mutators

public extension Provider {
	convenience init(data: Data) throws {
		let me = try newJSONDecoder().decode(Provider.self, from: data)
		self.init(name: me.name, type: me.type, owner: me.owner, records: me.records)
	}

	convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
		guard let data = json.data(using: encoding) else {
			throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
		}
		try self.init(data: data)
	}

	convenience init(fromURL url: URL) throws {
		try self.init(data: try Data(contentsOf: url))
	}

	func with(
		name: String?? = nil,
		type: String?? = nil,
		owner: String?? = nil,
		records: [Record]?? = nil
	) -> Provider {
		return Provider(
			name: name ?? self.name,
			type: type ?? self.type,
			owner: owner ?? self.owner,
			records: records ?? self.records
		)
	}

	func jsonData() throws -> Data {
		return try newJSONEncoder().encode(self)
	}

	func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
		return String(data: try self.jsonData(), encoding: encoding)
	}
}

// MARK: - Record
public class Record: Codable {
	public let date, julian, station, standard: String?
	public let zipCodes, scope: String?
	public let dayAirTmpAvg, dayAirTmpMax, dayAirTmpMin, dayDewPnt: Day?
	public let dayAsceEto, dayPrecip, dayRelHumAvg, dayRelHumMax: Day?
	public let dayRelHumMin, daySoilTmpAvg, daySolRADAvg, dayVapPresAvg: Day?
	public let dayWindRun, dayWindSpdAvg: Day?

	enum CodingKeys: String, CodingKey {
		case date = "Date"
		case julian = "Julian"
		case station = "Station"
		case standard = "Standard"
		case zipCodes = "ZipCodes"
		case scope = "Scope"
		case dayAirTmpAvg = "DayAirTmpAvg"
		case dayAirTmpMax = "DayAirTmpMax"
		case dayAirTmpMin = "DayAirTmpMin"
		case dayDewPnt = "DayDewPnt"
		case dayAsceEto = "DayAsceEto"
		case dayPrecip = "DayPrecip"
		case dayRelHumAvg = "DayRelHumAvg"
		case dayRelHumMax = "DayRelHumMax"
		case dayRelHumMin = "DayRelHumMin"
		case daySoilTmpAvg = "DaySoilTmpAvg"
		case daySolRADAvg = "DaySolRadAvg"
		case dayVapPresAvg = "DayVapPresAvg"
		case dayWindRun = "DayWindRun"
		case dayWindSpdAvg = "DayWindSpdAvg"
	}

	public init(date: String?, julian: String?, station: String?, standard: String?, zipCodes: String?, scope: String?, dayAirTmpAvg: Day?, dayAirTmpMax: Day?, dayAirTmpMin: Day?, dayDewPnt: Day?, dayAsceEto: Day?, dayPrecip: Day?, dayRelHumAvg: Day?, dayRelHumMax: Day?, dayRelHumMin: Day?, daySoilTmpAvg: Day?, daySolRADAvg: Day?, dayVapPresAvg: Day?, dayWindRun: Day?, dayWindSpdAvg: Day?) {
		self.date = date
		self.julian = julian
		self.station = station
		self.standard = standard
		self.zipCodes = zipCodes
		self.scope = scope
		self.dayAirTmpAvg = dayAirTmpAvg
		self.dayAirTmpMax = dayAirTmpMax
		self.dayAirTmpMin = dayAirTmpMin
		self.dayDewPnt = dayDewPnt
		self.dayAsceEto = dayAsceEto
		self.dayPrecip = dayPrecip
		self.dayRelHumAvg = dayRelHumAvg
		self.dayRelHumMax = dayRelHumMax
		self.dayRelHumMin = dayRelHumMin
		self.daySoilTmpAvg = daySoilTmpAvg
		self.daySolRADAvg = daySolRADAvg
		self.dayVapPresAvg = dayVapPresAvg
		self.dayWindRun = dayWindRun
		self.dayWindSpdAvg = dayWindSpdAvg
	}
}

// MARK: Record convenience initializers and mutators

public extension Record {
	convenience init(data: Data) throws {
		let me = try newJSONDecoder().decode(Record.self, from: data)
		self.init(date: me.date, julian: me.julian, station: me.station, standard: me.standard, zipCodes: me.zipCodes, scope: me.scope, dayAirTmpAvg: me.dayAirTmpAvg, dayAirTmpMax: me.dayAirTmpMax, dayAirTmpMin: me.dayAirTmpMin, dayDewPnt: me.dayDewPnt, dayAsceEto: me.dayAsceEto, dayPrecip: me.dayPrecip, dayRelHumAvg: me.dayRelHumAvg, dayRelHumMax: me.dayRelHumMax, dayRelHumMin: me.dayRelHumMin, daySoilTmpAvg: me.daySoilTmpAvg, daySolRADAvg: me.daySolRADAvg, dayVapPresAvg: me.dayVapPresAvg, dayWindRun: me.dayWindRun, dayWindSpdAvg: me.dayWindSpdAvg)
	}

	convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
		guard let data = json.data(using: encoding) else {
			throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
		}
		try self.init(data: data)
	}

	convenience init(fromURL url: URL) throws {
		try self.init(data: try Data(contentsOf: url))
	}

	func with(
		date: String?? = nil,
		julian: String?? = nil,
		station: String?? = nil,
		standard: String?? = nil,
		zipCodes: String?? = nil,
		scope: String?? = nil,
		dayAirTmpAvg: Day?? = nil,
		dayAirTmpMax: Day?? = nil,
		dayAirTmpMin: Day?? = nil,
		dayDewPnt: Day?? = nil,
		dayAsceEto: Day?? = nil,
		dayPrecip: Day?? = nil,
		dayRelHumAvg: Day?? = nil,
		dayRelHumMax: Day?? = nil,
		dayRelHumMin: Day?? = nil,
		daySoilTmpAvg: Day?? = nil,
		daySolRADAvg: Day?? = nil,
		dayVapPresAvg: Day?? = nil,
		dayWindRun: Day?? = nil,
		dayWindSpdAvg: Day?? = nil
	) -> Record {
		return Record(
			date: date ?? self.date,
			julian: julian ?? self.julian,
			station: station ?? self.station,
			standard: standard ?? self.standard,
			zipCodes: zipCodes ?? self.zipCodes,
			scope: scope ?? self.scope,
			dayAirTmpAvg: dayAirTmpAvg ?? self.dayAirTmpAvg,
			dayAirTmpMax: dayAirTmpMax ?? self.dayAirTmpMax,
			dayAirTmpMin: dayAirTmpMin ?? self.dayAirTmpMin,
			dayDewPnt: dayDewPnt ?? self.dayDewPnt,
			dayAsceEto: dayAsceEto ?? self.dayAsceEto,
			dayPrecip: dayPrecip ?? self.dayPrecip,
			dayRelHumAvg: dayRelHumAvg ?? self.dayRelHumAvg,
			dayRelHumMax: dayRelHumMax ?? self.dayRelHumMax,
			dayRelHumMin: dayRelHumMin ?? self.dayRelHumMin,
			daySoilTmpAvg: daySoilTmpAvg ?? self.daySoilTmpAvg,
			daySolRADAvg: daySolRADAvg ?? self.daySolRADAvg,
			dayVapPresAvg: dayVapPresAvg ?? self.dayVapPresAvg,
			dayWindRun: dayWindRun ?? self.dayWindRun,
			dayWindSpdAvg: dayWindSpdAvg ?? self.dayWindSpdAvg
		)
	}

	func jsonData() throws -> Data {
		return try newJSONEncoder().encode(self)
	}

	func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
		return String(data: try self.jsonData(), encoding: encoding)
	}
}

// MARK: - Day
public class Day: Codable {
	public let value: String?
	public let qc: Qc?
	public let unit: String?

	enum CodingKeys: String, CodingKey {
		case value = "Value"
		case qc = "Qc"
		case unit = "Unit"
	}

	public init(value: String?, qc: Qc?, unit: String?) {
		self.value = value
		self.qc = qc
		self.unit = unit
	}
}

// MARK: Day convenience initializers and mutators

public extension Day {
	convenience init(data: Data) throws {
		let me = try newJSONDecoder().decode(Day.self, from: data)
		self.init(value: me.value, qc: me.qc, unit: me.unit)
	}

	convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
		guard let data = json.data(using: encoding) else {
			throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
		}
		try self.init(data: data)
	}

	convenience init(fromURL url: URL) throws {
		try self.init(data: try Data(contentsOf: url))
	}

	func with(
		value: String?? = nil,
		qc: Qc?? = nil,
		unit: String?? = nil
	) -> Day {
		return Day(
			value: value ?? self.value,
			qc: qc ?? self.qc,
			unit: unit ?? self.unit
		)
	}

	func jsonData() throws -> Data {
		return try newJSONEncoder().encode(self)
	}

	func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
		return String(data: try self.jsonData(), encoding: encoding)
	}
}

public enum Qc: String, Codable {
	case empty = " "
	case h = "H"
	case r = "R"
	case y = "Y"
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
	let decoder = JSONDecoder()
	if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
		decoder.dateDecodingStrategy = .iso8601
	}
	return decoder
}

func newJSONEncoder() -> JSONEncoder {
	let encoder = JSONEncoder()
	if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
		encoder.dateEncodingStrategy = .iso8601
	}
	return encoder
}


//  Model.swift
//  Mapd
//
//
/*
{
  "Stations": [
	{
	  "StationNbr": "259",
	  "Name": "Ferndale Plain",
	  "City": "Ferndale",
	  "RegionalOffice": "Northern Region Office",
	  "County": "Humboldt",
	  "ConnectDate": "8/5/2019",
	  "DisconnectDate": "12/30/2050",
	  "IsActive": "True",
	  "IsEtoStation": "True",
	  "Elevation": "21",
	  "GroundCover": "Grass",
	  "HmsLatitude": "40º36'16N / 40.604467",
	  "HmsLongitude": "-124º14'35W / -124.243186",
	  "ZipCodes": [
		"95536",
		"95540",
		"95551"
	  ],
	  "SitingDesc": ""
	}
  ]
}
*/

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cimis = try Cimis(json)

//import Foundation
//
//// MARK: - Cimis
//public class Cimis: Codable {
//	public let stations: [Station]?
//
//	enum CodingKeys: String, CodingKey {
//		case stations = "Stations"
//	}
//
//	public init(stations: [Station]?) {
//		self.stations = stations
//	}
//}
//
//// MARK: Cimis convenience initializers and mutators
//
//public extension Cimis {
//	convenience init(data: Data) throws {
//		let me = try newJSONDecoder().decode(Cimis.self, from: data)
//		self.init(stations: me.stations)
//	}
//
//	convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//		guard let data = json.data(using: encoding) else {
//			throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//		}
//		try self.init(data: data)
//	}
//
//	convenience init(fromURL url: URL) throws {
//		try self.init(data: try Data(contentsOf: url))
//	}
//
//	func with(
//		stations: [Station]?? = nil
//	) -> Cimis {
//		return Cimis(
//			stations: stations ?? self.stations
//		)
//	}
//
//	func jsonData() throws -> Data {
//		return try newJSONEncoder().encode(self)
//	}
//
//	func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//		return String(data: try self.jsonData(), encoding: encoding)
//	}
//}
//
//// MARK: - Station
//public class Station: Codable {
//	public let stationNbr, name, city, regionalOffice: String?
//	public let county, connectDate, disconnectDate, isActive: String?
//	public let isEtoStation, elevation, groundCover, hmsLatitude: String?
//	public let hmsLongitude: String?
//	public let zipCodes: [String]?
//	public let sitingDesc: String?
//
//	enum CodingKeys: String, CodingKey {
//		case stationNbr = "StationNbr"
//		case name = "Name"
//		case city = "City"
//		case regionalOffice = "RegionalOffice"
//		case county = "County"
//		case connectDate = "ConnectDate"
//		case disconnectDate = "DisconnectDate"
//		case isActive = "IsActive"
//		case isEtoStation = "IsEtoStation"
//		case elevation = "Elevation"
//		case groundCover = "GroundCover"
//		case hmsLatitude = "HmsLatitude"
//		case hmsLongitude = "HmsLongitude"
//		case zipCodes = "ZipCodes"
//		case sitingDesc = "SitingDesc"
//	}
//
//	public init(stationNbr: String?, name: String?, city: String?, regionalOffice: String?, county: String?, connectDate: String?, disconnectDate: String?, isActive: String?, isEtoStation: String?, elevation: String?, groundCover: String?, hmsLatitude: String?, hmsLongitude: String?, zipCodes: [String]?, sitingDesc: String?) {
//		self.stationNbr = stationNbr
//		self.name = name
//		self.city = city
//		self.regionalOffice = regionalOffice
//		self.county = county
//		self.connectDate = connectDate
//		self.disconnectDate = disconnectDate
//		self.isActive = isActive
//		self.isEtoStation = isEtoStation
//		self.elevation = elevation
//		self.groundCover = groundCover
//		self.hmsLatitude = hmsLatitude
//		self.hmsLongitude = hmsLongitude
//		self.zipCodes = zipCodes
//		self.sitingDesc = sitingDesc
//	}
//}
//
//// MARK: Station convenience initializers and mutators
//
//public extension Station {
//	convenience init(data: Data) throws {
//		let me = try newJSONDecoder().decode(Station.self, from: data)
//		self.init(stationNbr: me.stationNbr, name: me.name, city: me.city, regionalOffice: me.regionalOffice, county: me.county, connectDate: me.connectDate, disconnectDate: me.disconnectDate, isActive: me.isActive, isEtoStation: me.isEtoStation, elevation: me.elevation, groundCover: me.groundCover, hmsLatitude: me.hmsLatitude, hmsLongitude: me.hmsLongitude, zipCodes: me.zipCodes, sitingDesc: me.sitingDesc)
//	}
//
//	convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//		guard let data = json.data(using: encoding) else {
//			throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//		}
//		try self.init(data: data)
//	}
//
//	convenience init(fromURL url: URL) throws {
//		try self.init(data: try Data(contentsOf: url))
//	}
//
//	func with(
//		stationNbr: String?? = nil,
//		name: String?? = nil,
//		city: String?? = nil,
//		regionalOffice: String?? = nil,
//		county: String?? = nil,
//		connectDate: String?? = nil,
//		disconnectDate: String?? = nil,
//		isActive: String?? = nil,
//		isEtoStation: String?? = nil,
//		elevation: String?? = nil,
//		groundCover: String?? = nil,
//		hmsLatitude: String?? = nil,
//		hmsLongitude: String?? = nil,
//		zipCodes: [String]?? = nil,
//		sitingDesc: String?? = nil
//	) -> Station {
//		return Station(
//			stationNbr: stationNbr ?? self.stationNbr,
//			name: name ?? self.name,
//			city: city ?? self.city,
//			regionalOffice: regionalOffice ?? self.regionalOffice,
//			county: county ?? self.county,
//			connectDate: connectDate ?? self.connectDate,
//			disconnectDate: disconnectDate ?? self.disconnectDate,
//			isActive: isActive ?? self.isActive,
//			isEtoStation: isEtoStation ?? self.isEtoStation,
//			elevation: elevation ?? self.elevation,
//			groundCover: groundCover ?? self.groundCover,
//			hmsLatitude: hmsLatitude ?? self.hmsLatitude,
//			hmsLongitude: hmsLongitude ?? self.hmsLongitude,
//			zipCodes: zipCodes ?? self.zipCodes,
//			sitingDesc: sitingDesc ?? self.sitingDesc
//		)
//	}
//
//	func jsonData() throws -> Data {
//		return try newJSONEncoder().encode(self)
//	}
//
//	func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//		return String(data: try self.jsonData(), encoding: encoding)
//	}
//}
//
//// MARK: - Helper functions for creating encoders and decoders
//
//func newJSONDecoder() -> JSONDecoder {
//	let decoder = JSONDecoder()
//	if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//		decoder.dateDecodingStrategy = .iso8601
//	}
//	return decoder
//}
//
//func newJSONEncoder() -> JSONEncoder {
//	let encoder = JSONEncoder()
//	if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//		encoder.dateEncodingStrategy = .iso8601
//	}
//	return encoder
//}
