//
//  ConfigurationsWireframe.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import UIKit

struct ConfigurationsWireframe {
   
   static func presentConfigurationsModule(_ window: UIWindow) {
      
      let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ConfigurationsViewController") as! ConfigurationsView
      
      let apiService = TmdbApiService()
      let apiDataManager = TmdbApiDataManager(apiService: apiService)
      let interactor = ConfigurationsInteractor(dataManager: apiDataManager)
      let presenter = ConfigurationsPresenter(interactor: interactor, wireframe: ConfigurationsWireframe())
      
      if let navController = window.rootViewController as? UINavigationController {
         vc.presenter = presenter
         navController.isNavigationBarHidden = true
         navController.pushViewController(vc, animated: false)
      }
      
   }
   
   func showMainMoviesList() {
      MainMoviesListWireframe.presentMainMoviesListModule(UIApplication.shared.keyWindow!)
   }
   
}
