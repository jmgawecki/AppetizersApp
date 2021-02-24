//
//  NetworkManager.swift
//  Appetizers (iOS)
//
//  Created by Jakub Gawecki on 23/02/2021.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getAppetizers(completed: @escaping(Result<[Appetizer],APErrors>) -> Void) {
        let stringURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
        
        guard let url = URL(string: stringURL) else {
            return completed(.failure(.invalidUsername))
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let appetizers = try decoder.decode(AppetizerResponse.self, from: data)
                
                completed(.success(appetizers.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        dataTask.resume()
    }
    
    func downloadImage(with imageUrlStr: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: imageUrlStr)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: imageUrlStr) else {
            completed(nil)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            
            completed(image)
        }
 
        
        dataTask.resume()
    }
}
