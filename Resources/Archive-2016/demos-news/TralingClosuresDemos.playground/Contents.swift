class Person {
    let name:String;
    let age: Int;
    
    init(name: String, age: Int) {
        self.name = name;
        self.age = age;
    }
}

var people:[Person] = [];

for i in 0..<10 {
    people.append(Person(name: "Person #\(i)", age: i+10));
}
people

var mapAge = func (x:Person) -> Int{
    return x.age;
}

func mapAge(p: Person) -> Int {
    return p.age
}

let ages = people.map
            {$0.age}

func < (p1:Person, p2: Person) -> Bool {
    return p1.age > p2.age;
}

let sortedPeople = people.sort(<);
sortedPeople;

