import Foundation

class AddViewModel {
    
    let dataAccess = RealmDataAccess()
    
    func addPerson(name: String, surname: String) {
        dataAccess.addPerson(Person(name: name, surname: surname))
    }
    
}
