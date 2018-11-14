//Observer

import Foundation

protocol Subject {
    
    func add(observer: PropertyObserver)
    func remove(observer: PropertyObserver)
    func notify(withString string: String)
    
}

class Professor: Subject {
    
    var observerCollection = NSMutableSet()
    var homeTask = "" {
        didSet {
            notify(withString: homeTask)
        }
    }
    
    func add(observer: PropertyObserver) {
        observerCollection.add(observer)
    }
    
    func remove(observer: PropertyObserver) {
        observerCollection.remove(observer)
    }
    
    func notify(withString string: String) {
        for observer in observerCollection {
            (observer as! PropertyObserver).didGet(newTask: string)
        }
    }

}

protocol PropertyObserver {
    
    func didGet(newTask task: String)
    
}

class Student: NSObject, PropertyObserver {
    
    var homeTask = ""
    
    func didGet(newTask task: String) {
        homeTask = task
        print("New home task to be done")
    }
    
}

let professor = Professor()
let student = Student()

professor.add(observer: student)
professor.homeTask = "New task"

student.homeTask

