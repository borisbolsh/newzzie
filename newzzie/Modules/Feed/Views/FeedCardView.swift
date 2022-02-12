import UIKit

class FeedCardView: UIView {

  private let titleLabel = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(titleLabel)
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    titleLabel.frame.origin = CGPoint(x: 16, y: 16)
    titleLabel.sizeToFit()
  }

  func update(with viewModel: FeedCardViewModel) {
    titleLabel.text = viewModel.title
    self.setNeedsLayout()
  }
}
