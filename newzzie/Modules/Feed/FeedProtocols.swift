import Foundation

protocol FeedModuleInput {
	var moduleOutput: FeedModuleOutput? { get }
}

protocol FeedModuleOutput: AnyObject {
}

protocol FeedViewInput: AnyObject {
  func set(viewModels: [FeedCardViewModel])
}

protocol FeedViewOutput: AnyObject {
  func viewDidLoad()
}

protocol FeedInteractorInput: AnyObject {
  func loadArticles()
}

protocol FeedInteractorOutput: AnyObject {
  func didEncounterError(_ error: Error)
  func didLoad(_ articles: [Article])
}

protocol FeedRouterInput: AnyObject {
}
