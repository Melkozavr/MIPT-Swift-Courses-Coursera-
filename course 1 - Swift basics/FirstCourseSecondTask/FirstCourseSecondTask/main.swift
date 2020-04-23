//
//  main.swift
//  FirstCourseSecondTask
//
//  Copyright © 2017 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseSecondTaskChecker


let checker = Checker()


checker.checkFirstFunction { (arr: [Int]) -> (Int, Int) in
    var a = 0; var b = 0
    for elem in arr {
        if elem % 2 == 0 {
            a += 1
        } else {
            b += 1
        }
    }
    return (a, b)
    
}


checker.checkSecondFunction { (arr: [Checker.Circle]) -> [Checker.Circle] in
    var result = [Checker.Circle]()
    
    for elem in arr {
        if elem.color == .white {
            result.append(elem)
        }
    }
    for var elem in arr {
        if elem.color == .black {
            elem.radius *= 2
            result.append(elem)
        }
    }
    for var elem in arr {
        if elem.color == .green {
            elem.color = .blue
        }
        if elem.color == .blue {
            result.append(elem)
        }
    }
    return result
}


checker.checkThirdFunction { (arr: [Checker.EmployeeData]) -> [Checker.Employee] in
    var result: [Checker.Employee] = []
    for elem in arr {
        if elem["salary"] != nil && elem["fullName"] != nil && elem["company"] != nil && elem["age"] == nil{
//            if Array(elem.keys)[0] == "fullName" && Array(elem.keys)[1] == "salary" {
                let add: Checker.Employee = Checker.Employee(fullName: elem["fullName"]!, salary: elem["salary"]!, company: elem["company"]!)
                result.append(add)
            //}
        }
    }
    return result
}


checker.checkFourthFunction { (arr: [String]) -> [String : [String]] in
    var result = [String: [String]]()
    var sortedArr = [String: [String]]()

    for elem in arr {
        let start = String(elem.prefix(1))
        if  result[start] == nil {
            result[start] = [elem]
        } else {
            result[start]?.append(elem)
        }
    }
    for (elem, names) in result {
        if names.count < 2 {
            result.removeValue(forKey: elem)
        }
    }
    for var elem in result {
        let sorted = elem.value.sorted {$0 > $1}
        let start = String(elem.key)
        elem.value = sorted
        sortedArr[start] = elem.value
    }
    return sortedArr
}
