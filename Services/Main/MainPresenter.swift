//
//  MainPresenter.swift
//  Super easy dev
//
//  Created by Александр Горелкин on 26.03.2024
//
import Foundation
protocol MainPresenterProtocol: AnyObject {
    func fetchServices()
    func didFetch()
    func didFail(with error: String)
    func numberOfSections() -> Int
    func numberOfPosts(in section: Int) -> Int
    func service(for indexPath: IndexPath) -> ServiceModel?
    func didSelectRowAt(_ indexPath: IndexPath)
}

class MainPresenter {
    weak var view: MainViewProtocol?
    var router: MainRouterProtocol
    var interactor: MainInteractorProtocol
    
    init(interactor: MainInteractorProtocol, router: MainRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension MainPresenter: MainPresenterProtocol {
    func didSelectRowAt(_ indexPath: IndexPath) {
        router.openApp(link: interactor.services[indexPath.row].link)
    }
    
    func fetchServices() {
        Task(priority: .background) {
            await interactor.fetchServices()
        }
    }
    
    func didFetch() {
        view?.displayFetchedServices()
    }
    
    func didFail(with error: String) {
        view?.displayError(error: error)
    }
    
    func numberOfSections() -> Int  {
        return 1
    }
    
    func numberOfPosts(in section: Int) -> Int {
        return interactor.services.count
    }
    
    func service(for indexPath: IndexPath) -> ServiceModel? {
        return interactor.services[indexPath.row]
    }
    
}
