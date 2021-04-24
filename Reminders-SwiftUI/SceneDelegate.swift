//
//  SceneDelegate.swift
//  Reminders
//
//  Created by Surasak Wattanapradit on 25/4/2564 BE.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
        }
        
        let context = appDelegate.persistantContainer.viewContext
        let contentView = ContentView().environment(\.managedObjectContext, context)
        
        if let windowScene = scene as? UIWindowScene {
          let window = UIWindow(windowScene: windowScene)
          window.rootViewController = UIHostingController(rootView: contentView)
          self.window = window
          window.makeKeyAndVisible()
        }
      }

}

