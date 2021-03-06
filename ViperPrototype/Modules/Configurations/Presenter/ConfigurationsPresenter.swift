//
//  ConfigurationsPresenter.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import Foundation
import RxSwift

struct ConfigurationsPresenter {
   
   fileprivate let disposeBag = DisposeBag()
   fileprivate let interactor: ConfigurationsInteractor
   fileprivate let wireframe: ConfigurationsWireframe
   
   init(interactor: ConfigurationsInteractor, wireframe: ConfigurationsWireframe) {
      self.interactor = interactor
      self.wireframe = wireframe
   }
   
   func gotConfigurations() -> Observable<Bool> {
      
      return Observable.create { observer in
         
         self.interactor.getConfigurations()
            .throttle(1, scheduler: MainScheduler.instance)
            .subscribe(onNext: { (result) -> Void in
            
               if result {
                  self.wireframe.showMainMoviesList()
                  observer.onNext(true)
               } else {
                  observer.onNext(false)
               }
               
            }).addDisposableTo(self.disposeBag)
         
        return Disposables.create { }
        
      }
      
   }
   
}
