import Algorithms
import Foundation

struct Day13: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String

    // Splits input data into its component parts and convert from string.
    var entities: [String] {
        data.split(separator: "\n").map {
            return String($0)
        }
    }

    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        var tokens = 0
        
        for i in 0..<entities.count/3 {
            let buttonAString = entities[i*3]
            
            let splitA = buttonAString.split(separator: "Button A: X+")
            let splitAx = splitA[0].split(separator: ", Y+")
            let buttonAx = Int(splitAx[0])!
            let buttonAy = Int(splitAx[1])!
            
            let splitB = entities[i*3+1].split(separator: "Button B: X+")
            let splitBx = splitB[0].split(separator: ", Y+")
            let buttonBx = Int(splitBx[0])!
            let buttonBy = Int(splitBx[1])!
            
            let splitPrize = entities[i*3+2].split(separator: "Prize: X=")
            let splitPrizex = splitPrize[0].split(separator: ", Y=")
            let prizeX = Int(splitPrizex[0])!
            let prizeY = Int(splitPrizex[1])!
            
            let numerator: Int = ((prizeY * buttonAx) - (buttonAy * prizeX))
            let denominator: Int = ((buttonBy * buttonAx) - (buttonBx * buttonAy))
            let pressB = numerator / denominator
            
            if pressB >= 0 && pressB <= 100 {
                let pressA = (prizeX - pressB * buttonBx) / buttonAx
                
                let diff = (pressA * buttonAx) - (prizeX - pressB * buttonBx)
                if pressA >= 0 && pressA <= 100 && diff == 0 {
                    tokens += 3 * pressA + pressB
                }
            }
        }
        
        return tokens
    }

    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        return false
    }
}
