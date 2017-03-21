class Power {
    let name: String
    
    init(withName name: String) {
        self.name = name
    }
}

protocol HasFlyingPower {
    func fly()
}

protocol HasSuperStrengthPower {
    func hit()
}

class Superhero {
    var name:String
    let powers: [Power]
    
    
    convenience init(withName name: String,
        andPowers powers: Power...) {
            self.init(withName: name, andPowers: powers)
    }
    
    init(withName name: String, andPowers powers: [Power]){
        self.name = name
        self.powers = powers
    }
    
    func usePower(power: String) -> String{
        //check if power is available
        let hasPower = self.powers.contains {p in p.name == power }
        
        
        if !hasPower {
            return "\(self.name) cannot use \(power)";
        }
        
        return "\(self.name) used \(power)!";
    }
}

class FlyingSuperStrongSuperhero: Superhero, HasFlyingPower, HasSuperStrengthPower {
    func fly() {
        
    }
    
    func hit() {
        
    }
}

class UltraHero: Superhero {
    let ultimate: String
    
    init(withName name: String,
        powers: [Power],
        andUltimate ultimate: String) {
            
            self.ultimate = ultimate
            super.init(withName: name, andPowers: powers)
    }
    
    override func usePower(power: String) -> String {
        if(self.ultimate == power){
            return "\(self.name) used ultimate \(power)!";
        }
        return super.usePower(power);
    }
}

let batman = UltraHero(withName: "Batman",
    powers: [Power(withName: "Utility belt"),
        Power(withName: "Martial Arts")],
    andUltimate: "Throw batarang")

let supergirl = Superhero(withName: "Supergirl",
    andPowers: Power(withName: "Super strength"),
    Power(withName: "Laser eyes"),
    Power(withName: "Flying"))

batman.usePower("Martial Arts")
supergirl.usePower("Flying")
supergirl.usePower("Martial Arts")

batman.usePower("Throw batarang")

//extension Superhero
extension Superhero {
    func sayName() -> String{
        return "Hi! I am \(self.name)";
    }
}

func superheroSayName(sh: Superhero) -> String{
    return "Hi! I am \(sh.name)";
}


supergirl.sayName()
batman.sayName()

superheroSayName(batman)










