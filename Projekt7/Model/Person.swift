import Foundation

struct Person {
    var name: String
    var surname: String
    
    init(from persistedPerson: PersistedPerson) {
        self.name = persistedPerson.name
        self.surname = persistedPerson.surname
    }
    init(name: String, surname: String)
    {
        self.name = name
        self.surname = surname
    }
    
}
