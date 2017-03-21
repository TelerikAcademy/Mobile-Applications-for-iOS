class Rect {
    let x:Int;
    let y:Int;
    private var _side: Int;
    
    var side: Int {
        get {
            return self._side;
        }
        set(newSide){
            self._side = newSide;
        }
    }
    
    init(withX x:Int, y: Int, andSide side: Int){
        self._side = side;
        self.x = x;
        self.y = y;
    }
}

var rect = Rect(withX: 5, y: 6, andSide: 100)
print(rect.x, rect.y, rect.side);

print(rect.x, rect.y, rect.side);


