//
//  NetworkDataManager.swift
//  MyMusic
//
//  Created by anoopm on 17/05/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import UIKit

class NetworkDataManager: NSObject, URLSessionTaskDelegate {

    // Singleton instance
    static let sharedNetworkmanager = NetworkDataManager()

    // Save images in cache
    static let sharedCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.name = "MyImageCache"
        cache.countLimit = 20 // Max 20 images in memory.
        cache.totalCostLimit = 10*1024*1024 // Max 10MB used.
        return cache
    }()
    // Create a session
    let session: URLSession = {

        let config = URLSessionConfiguration.default
        config.urlCache = nil

        return URLSession(configuration: config)
    }()

    // Method to fetch data from URL
    func fetchDataWithUrlRequest(_ urlRequest: URLRequest, completion:@escaping (_ success: Bool, _ fetchedData:Any) -> Void) {

        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    let jsonObject:Any = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                    completion(true, jsonObject)
                } catch {
                    print("Error")
                }
            }
        })
        task.resume()

    }
}
extension URL {

    typealias ImageCacheCompletion = (UIImage) -> Void

    /// Retrieves a pre-cached image, or nil if it isn't cached.
    /// You should call this before calling fetchImage.
    var cachedImage: UIImage? {
        return NetworkDataManager.sharedCache.object(
            forKey: absoluteString as NSString)
    }
    func isValidUrl() -> Bool {

        if(self.scheme!.hasPrefix("http") || (self.scheme?.hasPrefix("https"))!) {
            return true
        }
        return false
    }
    /// Fetches the image from the network.
    /// Stores it in the cache if successful.
    /// Only calls completion on successful image download.
    /// Completion is called on the main thread.
    func fetchImage(_ completion: @escaping ImageCacheCompletion) {
        let task = URLSession.shared.dataTask(with: self, completionHandler: {
            data, response, error in
            if error == nil {
                if let  data = data,
                    let image = UIImage(data: data) {
                        NetworkDataManager.sharedCache.setObject(
                            image,
                            forKey: self.absoluteString as NSString,
                            cost: data.count)
                        DispatchQueue.main.async {
                            completion(image)
                        }
                }
            }
        })
        task.resume()
    }

}

extension String {

    func isValidForUrl() -> Bool {

        if(self.hasPrefix("http") || self.hasPrefix("https")) {
            return true
        }
        return false
    }
}
