import Foundation

enum LoadingDataType {
    case nextPage
    case reload
}

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
  func willDisplay(at index: Int)
}

protocol FeedInteractorInput: AnyObject {
  func reload()
  func loadNext()
}

protocol FeedInteractorOutput: AnyObject {
  func didEncounterError(_ error: Error)
  func didLoad(_ articles: [Article], loadType: LoadingDataType)
}

protocol FeedRouterInput: AnyObject {
}
