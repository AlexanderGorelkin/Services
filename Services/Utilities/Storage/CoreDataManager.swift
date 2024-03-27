//
//  CoreDataManager.swift
//  Services
//
//  Created by Александр Горелкин on 26.03.2024.
//

import CoreData
final class CoreDataManager {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ServicesContainer")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    init() {
        getSavedServices()
    }
    var savedServices: [ServiceEntity] = []
    
    func add(_ service: ServiceModel) {
        if !savedServices.contains(where: {  $0.name == service.name }) {
            let entity = ServiceEntity(context: persistentContainer.viewContext)
            entity.name = service.name
            entity.descriptionService = service.description
            entity.iconURL = service.iconURL
            entity.link = service.link
            applyChanges()
        }
    }
    private func applyChanges() {
        save()
        getSavedServices()
    }
    private func save() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("error to save data in container: \(error.localizedDescription)")
        }
    }
    private func getSavedServices() {
        let request = NSFetchRequest<ServiceEntity>(entityName: "ServiceEntity")
        do {
            savedServices = try persistentContainer.viewContext.fetch(request)
        } catch {
            print("Error to fetch services: \(error.localizedDescription)")
        }
    }
}
