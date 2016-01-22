func minMax(numbers: Int...) -> (min: Int, max:Int){
    var min = numbers[0];
    var max = numbers[1];
    for number in numbers {
        if min > number{
            min = number
        }
        
        if max < number {
            max = number
        }
    }
    return (min,max)
}

let (min, max) = minMax(1, 2, 3, 4, 5, -1, 4);


var x = 5;
var y = 6;










