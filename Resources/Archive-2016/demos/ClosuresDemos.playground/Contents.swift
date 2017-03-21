//func outer (x: Int) -> (Int) -> Int {
//    func inner(y: Int) -> Int{
//        return x + y;
//    }
//    
//    return inner;
//}
//
//let i1 = outer(6);
//i1(3)
//i1(6)
//
//let i2 = outer(7);
//i2(3)
//i2(6)

var numbers = [6, 1, -1,  2, 5, 3, 6, 4, 5, -1000];

func sortDescending(x:Int, y: Int) -> Bool {
    return  x > y;
}

numbers = numbers.sort (sortDescending);
numbers

let sum = ["A", "S", "D"].reduce("", combine: +);

sum

let r1 = [1, 1, 3, 2].sort(>);

let result = [1, 2, 1, 3, 5 ,4].sort({x, y in
    if x%3 == y%3 {
        return x > y;
    }
    return x%3 < y%3
})
result










