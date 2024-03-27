//
//  MainInteractor.swift
//  Super easy dev
//
//  Created by Александр Горелкин on 26.03.2024
//
import UIKit
protocol MainInteractorProtocol: AnyObject {
    var services: [ServiceModel] { get }
    func fetchServices() async
}

class MainInteractor: MainInteractorProtocol {
    weak var presenter: MainPresenterProtocol?
    var services: [ServiceModel] = []
    private let networkService = NetworkService()
    private let coreDataManager = CoreDataManager()
    func fetchServices() async {
        do {
            self.services = try await networkService.fetchServices()
            presenter?.didFetch()
            Task(priority: .background) {
                await saveServicesToCoreData(services)
            }
        } catch {
            if coreDataManager.savedServices.isEmpty {
                self.presenter?.didFail(with: error.localizedDescription)
            }
            self.services = entityToModel()
            presenter?.didFetch()
        }
    }
    private func entityToModel() -> [ServiceModel] {
        coreDataManager.savedServices.compactMap { entity in
            return ServiceModel(name: entity.name!,
                                description: entity.descriptionService!,
                                link: entity.link!,
                                iconURL: entity.iconURL!)
        }
    }
    private func saveServicesToCoreData(_ services: [ServiceModel]) async {
        services.forEach { service in
            coreDataManager.add(service)
        }
    }
}
