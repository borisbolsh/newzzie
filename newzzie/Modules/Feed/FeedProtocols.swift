import Foundation

protocol FeedModuleInput {
	var moduleOutput: FeedModuleOutput? { get }
}

protocol FeedModuleOutput: AnyObject {
}

protocol FeedViewInput: AnyObject {
}

protocol FeedViewOutput: AnyObject {
}

protocol FeedInteractorInput: AnyObject {
}

protocol FeedInteractorOutput: AnyObject {
}

protocol FeedRouterInput: AnyObject {
}
