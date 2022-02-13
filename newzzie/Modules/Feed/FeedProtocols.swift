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
}

protocol FeedInteractorOutput: AnyObject {
}

protocol FeedRouterInput: AnyObject {
}
