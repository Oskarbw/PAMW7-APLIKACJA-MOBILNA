import Foundation

class IndexViewModel {
    let dataAccess = RealmDataAccess()
    
    init() {

    }
    
    
    func getPeople() -> [Person] {
        return dataAccess.getPeople()
    }
    
    func addPerson(_ person: Person) {
        dataAccess.addPerson(person)
    }
    
}
