class Base {
    let name: String;
    
    init(name: String) {
        self.name = name;
    }
    
    func printName() {
        print("My name is \(self.name)");
    }
}

class Derived: Base {
    let age: Int;
    
    init(name: String, age: Int) {
        self.age = age;
        super.init(name: name);
    }
    
    override func printName() {
        super.printName()
        print("and my age is \(self.age)")
    }
}


let d = Derived(name: "Gosho", age: 13)

d.name
d.age

d.printName()


