import Foundation
import RealmSwift

class PersistedPerson: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var surname: String
    
    convenience init(from person: Person) {
        self.init()
        self.name = person.name
        self.surname = person.surname
    }
}
