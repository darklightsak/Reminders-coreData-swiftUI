//
//  AppDelegate.swift
//  Reminders
//
//  Created by Surasak Wattanapradit on 25/4/2564 BE.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: - UISceneSession Lifecycle -
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
      // Called when a new scene session is being created.
      // Use this method to select a configuration to create the new scene with.
      return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    // MARK: - Core Data Stack -
    
    lazy var persistantContainer: NSPersistentContainer = {
      let container = NSPersistentContainer(name: "Reminders")
      container.loadPersistentStores { (storeDescription, error) in
        if let error = error as NSError? {
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }
        
      }
      return container
    }()
}

