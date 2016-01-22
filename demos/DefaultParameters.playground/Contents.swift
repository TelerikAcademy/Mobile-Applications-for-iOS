func complex(scalar scalar: Int, numbers: Int...) -> Int {
    var s = 0;
    for number in numbers {
        s += number;
    }
    return scalar * s;
}

complex(scalar: 2, numbers: 1, 2, 3, 4);


func multiplyByTwo(inout obj: Int) {
    obj *= 2;
}

var number = 5;
multiplyByTwo(&number);
number