import SnapKit
import UIKit

class AddViewController: UIViewController {

    private let viewModel = AddViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "Add person"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var surnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Surname"
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .brown
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)
        return button
    }()
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        view.addSubview(label)
        view.addSubview(nameTextField)
        view.addSubview(surnameTextField)
        view.addSubview(addButton)
    }
    
    private func setupConstraints() {
        label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(20)
        }
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        surnameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        addButton.snp.makeConstraints { make in
            make.top.equalTo(surnameTextField.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    @objc
    private func addButtonTap() {
        guard let name = nameTextField.text, let surname = surnameTextField.text, name != "", surname != "" else { return }
        viewModel.addPerson(name: name, surname: surname)
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }

}
