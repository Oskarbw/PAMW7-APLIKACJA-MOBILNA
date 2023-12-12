import SnapKit
import UIKit

class EditViewController: UIViewController {

    private let viewModel: EditViewModel
    
    init(index: Int) {
        viewModel = EditViewModel(index: index)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "Edit or delete person"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.text = viewModel.name
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var surnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Surname"
        textField.text = viewModel.surname
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var editButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .brown
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(editButtonTap), for: .touchUpInside)
        return button
    }()
    
    var deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(deleteButtonTap), for: .touchUpInside)
        return button
    }()
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        view.addSubview(label)
        view.addSubview(nameTextField)
        view.addSubview(surnameTextField)
        view.addSubview(editButton)
        view.addSubview(deleteButton)
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
        editButton.snp.makeConstraints { make in
            make.top.equalTo(surnameTextField.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        deleteButton.snp.makeConstraints { make in
            make.top.equalTo(editButton.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    @objc
    private func editButtonTap() {
        guard let name = nameTextField.text, let surname = surnameTextField.text, name != "", surname != "" else { return }
        viewModel.editPerson(name: name, surname: surname)
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc
    private func deleteButtonTap() {
        viewModel.deletePerson()
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }

}
