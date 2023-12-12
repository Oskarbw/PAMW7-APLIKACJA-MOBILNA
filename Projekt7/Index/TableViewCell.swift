import SnapKit
import UIKit

class TableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemGray5
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "tekskst"
        label.textColor = .brown
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    var surnameLabel: UILabel = {
        let label = UILabel()
        label.text = "aoefnaefno"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private func setupView() {
        addSubview(nameLabel)
        addSubview(surnameLabel)
    }
    
    private func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        surnameLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel).offset(100)
            make.centerY.equalToSuperview()
        }
    }
    
}
