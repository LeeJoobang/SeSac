import UIKit

import SnapKit

class SearchViewCell: BaseViewCell {
    
    let searchImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .green
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        [searchImageView].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        searchImageView.snp.makeConstraints { make in
            make.width.height.equalTo(115)
        }
    }
    
}

