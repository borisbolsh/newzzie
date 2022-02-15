import Foundation

struct URLFactory {
  private static let apiKey = "61abbfc82cd54f868bd043915601fbfd"
  private static var baseUrl: URL {
    return baseUrlComponents.url!
  }
  private static let baseUrlComponents: URLComponents = {
    let url = URL(string: "https://newsapi.org/v2/")!
    let queryItem = URLQueryItem(name: "apiKey", value: URLFactory.apiKey)
    var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
    urlComponents.queryItems = [queryItem]
    return urlComponents
  }()

  static func articles(params: ArticlesRequestParams) -> String {
    let params = [URLQueryItem(name: "pageSize", value: "\(params.pageSize)"),
                  URLQueryItem(name: "page", value: "\(params.page)"),
                  URLQueryItem(name: "q", value: params.search)]
    var urlComponents = baseUrlComponents
    urlComponents.queryItems?.append(contentsOf: params)
    return urlComponents.url!.appendingPathComponent("everything").absoluteString
  }
}

