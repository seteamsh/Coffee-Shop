import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private let decoder = JSONDecoder()
    
    private init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    func getProducts() async throws -> [ProductModel] {
        guard let url = URL(string: URLConstans.urlProducts) else {
            throw NetworkError.invalidURL
        }
        print(url)
        let (data, response) = try await URLSession.shared.data(from: url)
        print("Data: \(String(describing: String(data: data, encoding: .utf8)))")
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        do {
            return try decoder.decode([ProductModel].self, from: data)
        }  catch {
            throw NetworkError.invalidData
        }
    }
    func getCategories() async throws -> [Category] {
        guard let url = URL(string: URLConstans.urlCategories) else {
            throw NetworkError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        do {
            return try decoder.decode([Category].self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
}
