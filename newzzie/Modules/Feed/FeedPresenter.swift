import Foundation

final class FeedPresenter {
  weak var view: FeedViewInput?
  weak var moduleOutput: FeedModuleOutput?

  private let router: FeedRouterInput
  private let interactor: FeedInteractorInput

  init(router: FeedRouterInput, interactor: FeedInteractorInput) {
    self.router = router
    self.interactor = interactor
  }

}

extension FeedPresenter: FeedModuleInput {
}

extension FeedPresenter: FeedViewOutput {
  func viewDidLoad() {
    self.view?.set(viewModels: self.makeViewModels())
  }
}

extension FeedPresenter: FeedInteractorOutput {
}

extension FeedPresenter {
  func makeViewModels() -> [FeedCardViewModel] {
    return [
      FeedCardViewModel(
        info: "test info 1",
        title: "lorem ipsum 111",
        shortDescription: "Test descr 1 descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr",
        imageName: "feed1"
      ),
      FeedCardViewModel(
        info: "test info 2",
        title: "lorem ipsum 222",
        shortDescription: "Test descr 2 descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr",
        imageName: "feed2"
      ),
      FeedCardViewModel(
        info: "test info 3",
        title: "lorem ipsum 333",
        shortDescription: "Test descr 3 descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr descr",
        imageName: "feed3"
      )
    ]
  }
}
