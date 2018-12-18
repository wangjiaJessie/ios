//: Playground - noun: a place where people can play

import UIKit
import Foundation
let currentDate = Date()
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy年MM月dd日 EEEE aa HH:mm"
dateFormatter.locale = Locale.current
dateFormatter.timeZone = TimeZone(abbreviation: "UTC+8:00")
dateFormatter.locale = NSLocale(localeIdentifier: "zh_cn" ) as Locale
let Beijing = dateFormatter.string(from: currentDate)
print("北京时间：\(Beijing)")
dateFormatter.timeZone = TimeZone(abbreviation: "UTC+9:00")
dateFormatter.locale = NSLocale(localeIdentifier: "ja_jp" ) as Locale
let dongJing = dateFormatter.string(from: currentDate)
print("东京时间：\(dongJing)")
dateFormatter.timeZone = TimeZone(abbreviation: "UTC+1:00")
dateFormatter.locale = NSLocale(localeIdentifier: "en_gb" ) as Locale
let lunDun = dateFormatter.string(from: currentDate)
print("伦敦时间：\(lunDun)")
dateFormatter.timeZone = TimeZone(abbreviation: "UTC-4:00")
dateFormatter.locale = NSLocale(localeIdentifier: "en_us" ) as Locale
let niuYue = dateFormatter.string(from: currentDate)
print("纽约时间：\(niuYue)")
var newStr = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."
//let substr = newStr[newStr.index(newStr.startIndex, offsetBy: 6)..<newStr.index(newStr.startIndex, offsetBy: 21)]
//print(substr)
var str = "abcdef"
//let subStr1 = newStr.removeSubrange(newStr.range(of:  "OS")!)
//将时间和字符串newStr放在字典里
var dictionnary1 = [["time": Beijing,"String": newStr],["time":dongJing,"String":newStr],["time": lunDun,"String":newStr],["time": niuYue,"String":newStr]] as AnyObject
let fileManager = FileManager.default  //当前工作目录
var url = fileManager.urls(for: .documentDirectory,in: .userDomainMask).first!
url.appendPathComponent("text.txt")
dictionnary1.write(toFile:url.path,atomically:true)
print(url.path)
let imageUrl = URL(string:"http://picm.photophoto.cn/111/054/012/0540120079.jpg")!
let imageData = try! Data(contentsOf: imageUrl)
   let image = UIImage(data: imageData)
    var imageLocalUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    imageLocalUrl.appendPathComponent("test.jpg")
try? imageData.write(to: imageLocalUrl)










