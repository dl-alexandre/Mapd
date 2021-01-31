//
//  MapdApp.swift
//  Mapd
//
//

import SwiftUI

@main
struct MapdApp: App {
	@Environment(\.scenePhase) private var scenePhase
	@StateObject private var store = Store()
	
	var body: some Scene {
		WindowGroup {
			ContentView()
		}.onChange(of: scenePhase) { phase in
			switch phase {
			case .active:
				dailyPull()
				store.stationPull()
				print("active")
			case .inactive:
				print("inactive")
			case .background:
				print("background")
				
			//		persistenceController.saveViewContext()
			@unknown default:
				print("unknown default 🤷🏼")
			}
		}
		
	}
}
