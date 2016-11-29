import Foundation

//: Playground - noun: a place where people can play

import UIKit
import RxSwift
import RxCocoa
import RxGesture
import RxSegue
import FeatherweightRouter

public typealias UIPresenter = Presenter<UIViewController>

public func tabBarPresenter() -> UIPresenter {
    
    let tabBarController = UITabBarController()
    
    return Presenter(
        getPresentable: { tabBarController },
        setChild: { tabBarController.selectedViewController = $0 },
        setChildren: { tabBarController.setViewControllers($0, animated: true) })
}

public func navigationPresenter(title: String) -> UIPresenter {
    
    let navigationController = UINavigationController()
    navigationController.tabBarItem.title = title
    navigationController.tabBarItem.image = UIImage(named: "pencil-icon-30x30")
    
    return Presenter(
        getPresentable: { navigationController },
        setChild: { _ in },
        setChildren: { navigationController.setViewControllers($0, animated: true) })
}

public func segueViewPresenter(store: AppStore) -> UIPresenter {
    let mainViewController = SegueViewController(store: store)
    return Presenter(getPresentable: { mainViewController })
}

public func secondViewPresenter(store: AppStore) -> UIPresenter {
    let secondViewController = SecondViewController(store: store)
    return Presenter(getPresentable: { secondViewController })
}

public func rootViewPresenter(store: AppStore) -> UIPresenter {
    let rootViewController = RootViewController(store: store)
    return Presenter(getPresentable: { rootViewController })
}
