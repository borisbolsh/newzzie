import UIKit

final class FeedViewController: UIViewController {
  private let output: FeedViewOutput
  private let collectionView: UICollectionView

  private var viewModels = [FeedCardViewModel]()

  init(output: FeedViewOutput) {
    self.output = output
    let collectionViewLayout = UICollectionViewFlowLayout()
    self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    let view = UIView()
    view.addSubview(collectionView)
    setupCollectionView()
    self.view = view
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.output.viewDidLoad()
  }

  override func viewDidLayoutSubviews() {
    collectionView.frame = view.bounds
  }
}

extension FeedViewController: FeedViewInput {
  func set(viewModels: [FeedCardViewModel]) {
    self.viewModels = viewModels
    self.collectionView.reloadData()
  }
}

extension FeedViewController {
  private func setupCollectionView() {
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(FeedViewCell<FeedCardView>.self)
    collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
  }
}

extension FeedViewController:UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModels.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let viewModel = self.viewModels[indexPath.item]
    let cell = collectionView.dequeueCell(cellType: FeedViewCell<FeedCardView>.self, for: indexPath)
    cell.containerView.update(with: viewModel)
    return cell
  }

}

extension FeedViewController:UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let ratio: CGFloat = 1.2
    let width = collectionView.frame.width - collectionView.contentInset.left - collectionView.contentInset.right
    let height = width * ratio
    return CGSize(width: width, height: height)
  }
}
