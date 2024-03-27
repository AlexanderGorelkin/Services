//
//  IconService.swift
//  Services
//
//  Created by Александр Горелкин on 27.03.2024.
//

import UIKit
final class IconService {
    private static let localFileManager = LocalFileManager.shared
    static func getCoinImage(imageName: String) async -> UIImage {
        if let savedImage = LocalFileManager.shared.getImage(imageName: imageName.fromURLToString(), folderName: "appImage") {
            return savedImage
        } else {
            return await downloadCoinImage(imageName: imageName)
        }
    }
    private static func downloadCoinImage(imageName: String) async -> UIImage {
        do {
            let imageData = try await NetworkManager().fetchData(.icon(url: imageName))
            let downloadedImage = UIImage(data: imageData)!
            localFileManager.saveImage(image: downloadedImage, imageName: imageName.fromURLToString(), folderName: "appImage")
            return downloadedImage
        } catch {
            return UIImage(systemName: "flame")!
        }
    }
}
