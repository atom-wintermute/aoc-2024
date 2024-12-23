import Algorithms
import Foundation

struct Day22: AdventDay {
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
        var buyers = [Int]()

        for entity in entities {
            buyers.append(Int(entity)!)
        }

        var sum = 0
        for buyer in buyers {
            var currentSecret = buyer
            for _ in 1...2000 {

                // 1
                var value = currentSecret * 64
                var calculatation = 0
                calculatation = mix(value: value, secret: currentSecret)
                currentSecret = prune(secret: calculatation)

                // 2
                value = currentSecret / 32
                calculatation = mix(value: value, secret: currentSecret)
                currentSecret = prune(secret: calculatation)

                // 3
                value = currentSecret * 2048
                calculatation = mix(value: value, secret: currentSecret)
                currentSecret = prune(secret: calculatation)

            }
            sum += currentSecret
        }

        return sum
    }

    private func mix(value: Int, secret: Int) -> Int {
        return value ^ secret
    }

    private func prune(secret: Int) -> Int {
        return secret % 16777216
    }

    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        return false
    }
}
