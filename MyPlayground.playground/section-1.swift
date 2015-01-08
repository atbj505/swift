// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//变量，常量
var myVarible = 42
myVarible = 50
let myConstant = 42
let myFloat:Float = 42.0

//数据类型转换
let label = "The width is "
var width = 90
var widthLabel = label + String(width)
let widthLabel2 = "\(label)\(width)"

//数组，字典
var shoplist = ["catfish","water"]
shoplist[1] = "fish"
var dictionary = ["first":1,"second":2]
dictionary["third"] = 3

//数组，字典初始化
var emptyArray = [String]()
var emptyDic = [String:Int]()
shoplist = []
dictionary = [:]

//forin循环，if判断
let scores = [60, 70, 80 ,90]
var teamScore = 0
for score in scores{
    if score > 70{
        teamScore += 3
    } else{
        teamScore += 1
    }
}
teamScore

//for循环
var firstLoop = 0
for i in 0..<4{
    firstLoop += i
}
firstLoop

var secondLoop = 0
for i in 0...3{
    secondLoop += i
}
secondLoop

var thirdLoop = 0
for (var i = 0;i < 4;i++){
    thirdLoop += i
}
thirdLoop

//可选变量
var optionalString:String? = "Hello"
optionalString = nil

//switch判断
let vegetable = "red pepper"
var vegetableComment:String? = nil
switch vegetable{
case "celery":
    vegetableComment = "add some celery"
case "cucumber":
    vegetableComment = "add some cucumber"
case let x where x.hasSuffix("pepper"):
    vegetableComment = "add some pepper"
default:
    vegetableComment = "add anything you like"
}

//遍历字典
let interestingNumber = [
    "prime":[2,3,5,7,11,13],
    "fibonacci":[1,1,2,3,5,8],
    "square":[1,4,9,16,25]
]
var largest = 0
for (key, numbers) in interestingNumber{
    for number in numbers{
        if (number > largest){
            largest = number
        }
    }
}
largest

//while循环
var n = 2
while n < 100{
    n *= 2
}
n

var m = 2
do{
    m *= 2
}while m < 100
m

//函数
func greet(name:String,day:String) -> String{
    return "hello \(name),today is \(day)"
}
greet("yang","monday")

//函数（多个返回值）
func calculateStatistics(scores:[Int]) -> (min: Int, max: Int, sum: Int){
    var max = scores[0]
    var min = scores[0]
    var sum = 0
    
    for score in scores{
        if score > max{
            max = score
        }
        if score < min{
            min = score
        }
        sum += score
    }
    return (min,max,sum)
}
let result = calculateStatistics([5,3,100,3,9])
result.0
result.1
result.2

//函数（可变参数）
func sumOf(numbers:Int...) -> Int{
    var sum = 0
    for number in numbers{
        sum += number
    }
    return sum
}
sumOf()
sumOf(1,2,3)

//函数（嵌套）
func returnFiften() -> Int{
    var y = 10
    func add(){
        y += 5
    }
    return y
}
returnFiften()

//函数（返回值为另一函数）
func makeIncrementer() -> (Int -> Int){
    func addOne(number:Int) -> Int{
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

//函数（作为另一函数的参数）
func hasAnyMatches(list:[Int],condition:Int -> Bool) -> Bool{
    for item in list{
        if condition(item){
            return true
        }
    }
    return false
}
func lessThanTen(number:Int) -> Bool{
    return number < 10
}
var numbers = [20,19,7,12]
hasAnyMatches(numbers, lessThanTen)

//闭包
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

let mapNumbers = numbers.map({number in number * 3})
mapNumbers

let sortNumbers = sorted(numbers){$0 > $1}
sortNumbers

//类和对象
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String{
        return "A Sharp with \(numberOfSides) sides."
    }
}
var shape = Shape()
shape.numberOfSides = 8
var shapeDescription = shape.simpleDescription()

//类的构造函数
class NamesShape {
    var numberOfSides: Int = 0
    var name: String
    //构造函数
    init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String{
        return "A Shape with \(numberOfSides) sides."
    }
}

//类的继承
class Square: NamesShape{
    var sideLength: Double
    init (sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name: name)
        self.numberOfSides = 4
    }
    func area () -> Double{
        return sideLength * sideLength
    }
    override func simpleDescription() -> String {
        return "A Square with sides of length \(sideLength)."
    }
}
var test = Square(sideLength: 5, name: "test square")
test.area()
test.simpleDescription()

//类的setter和getter
class EquilateralTriangle: NamesShape{
    var sideLength: Double = 0.0
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    var periMeter: Double{
        get{
            return 3 * sideLength
        }
        set{
            sideLength = newValue / 3.0
        }
    }
    override func simpleDescription() -> String {
        return "An Equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3, name: "test triangle")
triangle.periMeter
triangle.periMeter = 10
triangle.sideLength

//willSet方法
class TriangleAndSquare{
    var triangle: EquilateralTriangle{
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square{
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String){
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "test triangleAndSquare")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 20, name: "test square")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength

//类中方法参数别名
class Counter{
    var count: Int = 0;
    func incrementBy(amount: Int, numberOfTimes times: Int){
        count += amount * times
    }
}
var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)

//变量可选值
let optionalSquare: Square? = Square(sideLength: 2.5, name: "test ?")
let sideLength = optionalSquare?.sideLength

//枚举和结构体
enum Rank: Int{
    case Ace = 1
    case Two, Three, Fore, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String{
        switch self{
        case .Ace:
            return "Ace"
        case .Jack:
            return "Jack"
        case .Queen:
            return "Queen"
        case .King:
            return "King"
        default:
            return String(self.rawValue)
        }
    }
    func compare(rank1: Rank,rank2: Rank) -> Rank{
        var max = rank1.rawValue
        if(rank2.rawValue > max){
            max = rank2.rawValue
        }
        let convertedRank = Rank(rawValue: max)
        return convertedRank!
    }
}
var ace = Rank.Ace
var aceRawValue = ace.rawValue
var compareResult = ace.compare(Rank.Ace, rank2: Rank.Jack)

//枚举类型与原始值的转换
if let convertedRank = Rank(rawValue: 3){
    let threeDescription = convertedRank.simpleDescription()
}

//枚举（默认原始值）
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

//枚举（实例值）
enum serverResponse{
    case Result(String,String)
    case error(String)
}
let success = serverResponse.Result("6:00am", "5:00pm")
let failure = serverResponse.error("timeout")
switch success{
case let .Result(sunrise,sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .error(error):
    let serverResponse = "Failure...  \(error)"
}

//结构体
struct Card{
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String{
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: Rank.Three, suit: Suit.Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//协议和拓展
protocol ExampleProtocol{
    var simpleDescription: String{get}
    mutating func adjust()
}
class simpleClass: ExampleProtocol{
    var simpleDescription: String = "A simple class"
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " +\(self.anotherProperty)"
    }
}
var a = simpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct simpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple struture"
    mutating func adjust() {
        simpleDescription += " adjust"
    }
}
var b = simpleStructure()
b.adjust()
let bDescription = b.simpleDescription

extension Int: ExampleProtocol{
    var simpleDescription: String{
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
7.simpleDescription

let protocolValue: ExampleProtocol = a
protocolValue.simpleDescription
// protocolValue.anotherProperty  //

//泛型
func repeat<ItemType>(item: ItemType, times: Int) -> [ItemType] {
    var result = [ItemType]()
    for i in 0..<times {
        result.append(item)
    }
    return result
}
repeat("knock", 4)