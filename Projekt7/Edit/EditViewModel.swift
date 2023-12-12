import Foundation

class EditViewModel {
    
    private let index: Int
    private let dataAccess = RealmDataAccess()
    let name: String
    let surname: String
    
    init(index: Int) {
        self.index = index
        self.name = dataAccess.getPeople()[index].name
        self.surname = dataAccess.getPeople()[index].surname
    }
    
    func editPerson(name: String, surname: String) {
        dataAccess.editPerson(Person(name: name, surname: surname), index: index)
    }
    
    func deletePerson() {
        dataAccess.deletePerson(index: index)
    }
}
