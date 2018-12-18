import UIKit
//定义一个字典
var dictionary = ["zhangsan":18,"lisi":17,"wangwu":20]
//将字典里面的values提取出来
var restore = Array( dictionary.values)
//用map函数将整数数组转换为字符串数组
let arry2 = restore.map{
    "\($0)"
}
print(arry2)
var string = ["12","ty45","89","yhd","67rt","20"]
let chooseData = string.filter{ Int($0) != nil}
print(chooseData)
let connectString = string.reduce(""){connectString,letter in "\(connectString),\(letter)"}
print("合并成一句话为：\(connectString)")
var integer = [1,2,3,456,0]
let result = integer.reduce((max:Int.min,min:Int.max,sum:0)){
    (result,i) in return (max(result.max,i),min(result.min,i),result.sum+i)
}
print("最大值：\(result.max)")
print("最小值：\(result.min)")
print("总数之和：\(result.sum)")
var funcarry = [Any]()
func add(number1: Int) ->Int{
    return number1+1
}
func stringconn(string:String) ->String{
    return string+"1"
}
funcarry.append(add)
funcarry.append(stringconn)
for i in 0...1{
    if funcarry[i] is ((Int)->(Int)){
        print("第\(i+1)个func is type:(Int)->(Int)")
    }
    
}
extension Int{
    func sqrt1 () -> Double{
        return sqrt(Double(self))
    }
}
let extenresult = 16.sqrt1()
print("输出结果（扩展了Int）：\(extenresult)")
//let result = integer.reduce((max:Int.min,min:Int.max,sum:0)){
//    (result,i) in return (max(result.max,i),min(result.min,i),result.sum+i)
//}
func comMaxMin <T: Comparable>(number:T...) ->(max:T,min:T){
    var max = number[0]
    var min = number[0]
    for i in number{
        if i < min {
            min = i
        }
        if i>max {
            max = i
        }
    }
    return (max,min)
}
let tempInt = comMaxMin(number:2,3,4,5,6)
print("最大值：\(tempInt.max)")
print("最小值：\(tempInt.min)")

