import UIKit

final class FeedViewController: UIViewController {
  private let output: FeedViewOutput
  private let collectionView: UICollectionView

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
  }

  override func viewDidLayoutSubviews() {
    collectionView.frame = view.bounds
  }
}

extension FeedViewController: FeedViewInput {
}

extension FeedViewController {
  private func setupCollectionView() {
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(UICollectionViewCell.self)
  }
}

extension FeedViewController:UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueCell(cellType: UICollectionViewCell.self, for: indexPath)
    cell.backgroundColor = .green
    return cell
  }

}

extension FeedViewController:UICollectionViewDelegate {}
