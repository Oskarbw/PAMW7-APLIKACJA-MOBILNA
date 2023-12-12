import SnapKit
import UIKit

class IndexViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "People"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    let tableView = UITableView()
    let viewModel = IndexViewModel()
    let nameHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        return label
    }()
    let surnameHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Surname"
        return label
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 100
        tableView.backgroundColor = .systemGray5
        
        
        setupView()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        view.addSubview(label)
        view.addSubview(nameHeaderLabel)
        view.addSubview(surnameHeaderLabel)
        view.addSubview(addButton)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(20)
        }
        nameHeaderLabel.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
        surnameHeaderLabel.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.left.equalTo(nameHeaderLabel).offset(100)
        }
        addButton.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-20)
            make.width.equalTo(60)
            make.height.equalTo(30)

        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(nameHeaderLabel.snp.bottom).offset(20)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getPeople().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        var person = viewModel.getPeople()[indexPath.row]
        cell.nameLabel.text = person.name
        cell.surnameLabel.text = person.surname
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.pushViewController(EditViewController(index: indexPath.row), animated: true)
        }

    }
    
    @objc
    private func addButtonTap() {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.pushViewController(AddViewController(), animated: true)
        }
    }
}
