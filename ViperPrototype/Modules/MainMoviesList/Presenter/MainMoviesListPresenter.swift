//
//  MainMoviesListPresenter.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct MainMoviesListPresenter {
   
   private let disposeBag = DisposeBag()
   private var interactor: MainMoviesListInteractor
   
   init(interactor: MainMoviesListInteractor) {
      self.interactor = interactor
   }
   
   //MARK: Input
   
   func handleDetailButtonTap(event: ControlEvent<Void>) {
      event.subscribeNext { _ -> Void in
         print("TAPPED")
      }.addDisposableTo(disposeBag)
   }
   
   //MARK: Output
   
   func getAllMovies() -> Observable<MainMoviesListViewModel> {

      return Observable.create { observer in
         
         self.interactor.getAllMovies().subscribeNext({ (movies) -> Void in
            
            let viewModel = MainMoviesListViewModel(movies: movies)
            observer.onNext(viewModel)
            
         }).addDisposableTo(self.disposeBag)
         
         return AnonymousDisposable {}
         
      }

   }
   
}
