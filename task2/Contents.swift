import UIKit
var  primes = [Int]() //定义一个数组用来存储1到10000的质数
for i in 2...10000{
    var isPrime = true
    for j in 2..<i{
        if i%j==0{
            isPrime = false
        }
    }
    if isPrime {
        primes.append(i)
    }
}
print("1到10000的质数如下：")
print(primes)
//first method
//func compare(x:Int,y:Int) ->Bool{
//    return x > y; //return x<y 从小到大的顺序
//}
print("按照从大到小的顺序排序为")
//primes.sort(by:compare)
//print(primes)
//second method
//primes.sort(by:{(x:Int,y:Int)->Bool in return x>y})
//print(primes)
//third method
//primes.sort(by:{(x,y)in x>y})
//print(primes)
//forth method
//primes.sort(by:{$0>$1}) //从大到小的顺序
//primes.sort(by:{$0<$1}) 从小到大的顺序
//print(primes)
//five method
//primes.sort(by:>)
//primes.sort(by:<)
//six method
primes.sort{ $0 > $1 }
//primes.sort{ $0< $1 }
print(primes)
enum Gender{
    case male
    case female
    
}
//定义协议
enum Department {
    case Math
    case Computer
    case Chinese
}
protocol SchoolProtocol {
    var department : Department {get}
    func lendBook()
}
class Person: CustomStringConvertible {
    var firstName: String
    var lastName: String
    var age: Int
    var gender: Gender
    var fullName: String{ get{return firstName + lastName }}
    //初始化
    init(firstName: String, lastName: String, age: Int, gender: Gender){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    //便利初始化
    convenience init(firstName: String, age: Int, gender: Gender) {
        self.init(firstName: firstName, lastName: "", age: age, gender: gender)
    }
    var description: String{
        return "name:\(self.fullName) age:\(self.age) gender:\(self.gender)"
    }
    //重载==
    static func ==(x:Person,y:Person) ->Bool{
        return x.fullName==y.fullName&&x.age==y.age&&x.gender==y.gender
    }
    //重载！=
    static func != (x:Person,y:Person) ->Bool
    {
        return !(x == y)
    }
    func run(){
        print("Person \(self.fullName) is running")
    }
}

var person2 = Person(firstName:"wang",age:40,gender:Gender.male)
var person1 = Person(firstName: "Li", lastName: " guiyang", age: 18, gender: Gender.female)
print("person1==person2:")
print(person1==person2)
print("person1!=person2:")
print(person1 != person2)
//继承Person，SchoolProtocol
class Teacher: Person,SchoolProtocol{
    var title : String
    var department: Department //= Department.Computer
    func lendBook(){
        print("\(self.fullName) teacher lended a related \(self.department) book")
    }
    //初始化
    init(title: String, firstName: String, lastName: String, age: Int, gender: Gender,department:Department){
        self.title = title
        self.department = department
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    override var description: String{
        return "title:\(title) name:\(fullName) age:\(age) gender:\(gender) department:\(department)"
    }
    override func run(){
        print("Teacher \(self.fullName) is running")
    }
}
//Student继承Person，协议SchoolProtocol
class Student: Person,SchoolProtocol{
    var stuNo: String
    var department: Department //= Department.Math
    func lendBook(){
        print("student \(fullName) lended a related \(department) book")
    }
    //初始化
    init(stuNo:String, firstName: String,lastName: String, age: Int, gender: Gender,department:Department){
        self.stuNo = stuNo
        self.department = department
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    override var description: String{
        return "stuNo:\(stuNo) name:\(fullName) age:\(age) gender:\(gender) department:\(department) "
    }
    override func run(){
        print("Student \(self.fullName) is running")
    }
}
var student1 = Student(stuNo:"2016110001", firstName: "wang",lastName: " yu", age: 18, gender: Gender.male,department:Department.Math)
print(student1)
var teacher = Teacher(title: "Listenning", firstName: "wang", lastName: " feng", age: 23, gender: Gender.female,department:Department.Computer)
print(teacher)
//对象数组
var arry = [person1,person2,teacher,student1]
for i in 0...2{
    let temp = Person(firstName:"li",lastName:" si",age: 18+i,gender:Gender.female)
    arry.append(temp)
}
//声明一个字典并对其初始化
var countDate = ["Person": 0,"Teacher":0,"Student":0]
//判断各种类的个数
for item in arry {
    if item is Teacher {  //是否是Teacher类
        countDate["Teacher"]! += 1
    } else if item is Student {  //是否是Student
        countDate["Student"]! += 1
    } else {  //Person类
        countDate["Person"]! += 1
    }
}
//输出字典内容
print(countDate)
//对数组按以下要求排序并输出：age、fullName、gender+age
//按照age
arry.sort{return $0.age>$1.age}
print("按照age排序")
for i in 0...arry.count-1
{
    print(arry[i])
}
//按照fullName
arry.sort{return $0.fullName>$1.fullName}
print("按照fullName排序")
for i in 0...arry.count-1
{
    print(arry[i])
}
//按照gender+age
func compareGender(x:Gender,y:Gender) ->Bool
{
    return x.hashValue > y.hashValue
}
func compare(x:Person,y:Person) ->Bool {
    return compareGender(x:x.gender,y:y.gender) && x.age>y.age
}
arry.sort(by:compare)
print("按照gender+age排序")
for i in 0...arry.count-1
{
    print(arry[i])
}
//对数组进行穷举。
//调用每个对象的run方法,满足协议SchoolProtocol对象的lendBook
for item in arry
{
    item.run()
    if let teacher = item as? Teacher{
        teacher.lendBook()
    }
    else if let student = item as? Student{
        student.lendBook()
    }
}





