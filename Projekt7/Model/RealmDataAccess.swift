import Foundation
import RealmSwift

class RealmDataAccess {

    private let realm = try! Realm()

    enum Constants {
        static let maxNumberOfRecentCities = 3
        static let recentCitiesKey = "recentCities"
    }

    func getPeople() -> [Person] {
        var people: [Person] = realm.objects(PersistedPerson.self).compactMap { persistedPerson -> Person in
            return Person(from: persistedPerson)
        }

        return people
    }

    func addPerson(_ person: Person) {
        try? realm.write {
            realm.add(PersistedPerson(from: person))
        }
    }
    
    func editPerson(_ person: Person, index: Int) {
        var people = realm.objects(PersistedPerson.self)
        if index < people.count {
            try! realm.write {
                people[index].name = person.name
                people[index].surname = person.surname
            }
        }
    }

    func deletePerson(index: Int) {
        var people = realm.objects(PersistedPerson.self)
        if index < people.count {
            try! realm.write {
                realm.delete(people[index])
            }
        }
    }
    
}
