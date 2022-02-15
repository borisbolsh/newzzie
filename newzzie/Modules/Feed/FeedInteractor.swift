import Foundation

final class FeedInteractor {
  private enum Constants {
    static let initialPage = 1
  }

  private var page: Int = Constants.initialPage

  weak var output: FeedInteractorOutput?
  
  private let articlesNetworkService: ArticlesNetworkProtocol

  init(articlesNetworkService: ArticlesNetworkProtocol) {
    self.articlesNetworkService = articlesNetworkService
  }
}

extension FeedInteractor: FeedInteractorInput {
  func reload() {
      self.page = Constants.initialPage
      self.loadArticles()
    }

    func loadNext() {
      self.loadArticles()
    }
}

extension FeedInteractor {
  func loadArticles() {
    let params = ArticlesRequestParams(pageSize: 20, page: self.page, search: "world")
    self.articlesNetworkService.requestArticles(params: params) { [weak self] result in
      guard let self = self else { return }
      switch result {
      case .success(let response):
        self.output?.didLoad(response.articles, loadType: self.page == Constants.initialPage ? .reload : .nextPage)
        self.page += 1
      case .failure(let error):
        self.output?.didEncounterError(error)
      }
    }
  }
}
