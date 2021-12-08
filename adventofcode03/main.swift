//
//  main.swift
//  adventofcode03
//
//  Created by Marcel Mravec on 08.12.2021.
//

import Foundation

func printLine() -> String {
    let file = "submarine.txt" //this is the file. we will write to and read from it
    var text: String
    do {
        text = try String(contentsOfFile: file)

        }
    catch {
        print("Chyba souboru.")
        return(error.localizedDescription)
        /* error handling here */}
    return text
}



var str : String
var i : Int
var count=0
str=printLine()

print(partOne())
//print(partTwo())

func partOne() -> Int {
    var x = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]  //jedničky
    var y = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]  //nuly
    var gammaRate = ""
    var epsilonRate = ""
    
    let lines=str.split(separator: "\n")
    print("Počet řádků je \(lines.count)")
    
    

    for line in 0..<lines.count {
        let znaky = lines[line]
        print("Line je \(line): znaky jsou \(znaky)")
        for i in 0...11 {
            let index = znaky.index(znaky.startIndex, offsetBy: i)
            if znaky[index]=="1" {
                x[i]+=1
            } else {
                y[i]+=1
            }
        }
        
    }
    for i in 0...11 {
        if x[i]>y[i] {
            gammaRate = gammaRate + "1"
            epsilonRate = epsilonRate + "0"
        } else {
            gammaRate = gammaRate + "0"
            epsilonRate = epsilonRate + "1"
        }
    }

    
    print("Gamma rate is \(gammaRate) : \(x) and epsilon rate is \(epsilonRate) : \(y)")
    
    let g = Int(gammaRate, radix: 2)!
    let e = Int(epsilonRate, radix: 2)!
    return g*e
}


//func partTwo() -> String {

//}
