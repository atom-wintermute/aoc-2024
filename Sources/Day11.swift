import Algorithms
import Foundation

struct Day11: AdventDay {
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
        var stones = [Int64]()

        let splitted = entities[0].split(separator: " ")
        for i in splitted {
            stones.append(Int64(i)!)
        }

        for _ in 1...25 {
            var nextStones = [Int64]()
            for stone in stones {
                if stone == 0 {
                    nextStones.append(1)
                } else {
                    let count = digitCount(input: stone)
                    if count % 2 == 0 {
                        let newStones = splitStone(stone: stone)
                        nextStones.append(newStones.0)
                        nextStones.append(newStones.1)
                    } else {
                        nextStones.append(stone * 2024)
                    }
                }
            }
            stones = nextStones
        }

        return stones.count
    }

    private func digitCount(input: Int64) -> Int64 {
        var result = input
        var count: Int64 = 0
        while result > 9 {
            count += 1
            result /= 10
        }
        return count + 1
    }

    private func splitStone(stone: Int64) -> (Int64, Int64) {
        let count = digitCount(input: stone)
        let halfCount = count / 2
        let delimeter = Int64(pow(10.0, Double(halfCount)))
        let left = stone / delimeter
        let right = stone % delimeter
        return (left, right)
    }

    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        return false
    }
}
