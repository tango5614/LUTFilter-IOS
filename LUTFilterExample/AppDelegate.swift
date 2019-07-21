//
//  AppDelegate.swift
//  LUTFilterExample
//
//  Created by 王文杰 on 2019/7/20.
//  Copyright © 2019 wangwenjie. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.window = self.window ?? UIWindow()
    self.window?.backgroundColor = .white
    self.window?.rootViewController = ViewController()
    self.window?.makeKeyAndVisible()
    return true
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }

}

