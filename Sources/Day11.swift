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

    private let iterationCount: Int64 = 75

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
                        let newStones = splitStone(stone: stone, count: count)
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
        if input < 10 {
            return 1
        }
        if input < 100 {
            return 2
        }
        if input < 1000 {
            return 3
        }
        if input < 10000 {
            return 4
        }
        if input < 100000 {
            return 5
        }
        if input < 1000000 {
            return 6
        }
        if input < 10000000 {
            return 7
        }
        if input < 100000000 {
            return 8
        }
        if input < 1000000000 {
            return 9
        }
        if input < 10000000000 {
            return 10
        }
        if input < 100000000000 {
            return 11
        }
        return input == 0 ? 1 : Int64(log10(Double(input))) + 1
    }

    private func splitStone(stone: Int64, count: Int64) -> (Int64, Int64) {
        let halfCount = count / 2
        let delimeter = Int64(pow(10.0, Double(halfCount)))
        let left = stone / delimeter
        let right = stone % delimeter
        return (left, right)
    }

    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        var stones = [Int64]()

        let splitted = entities[0].split(separator: " ")
        for i in splitted {
            stones.append(Int64(i)!)
        }

        var cache: [Int64: [Int64: Int64]] = [:]

        var sum: Int64 = 0
        for stone in stones {
            print("calc stone \(stone)")
            let result = getStones(input: stone, depth: iterationCount, cache: &cache)
            sum += result
        }

        return sum
    }

    private func getStones(input: Int64, depth: Int64, cache: inout [Int64: [Int64: Int64]]) -> Int64 {

        if let number = cache[input], let value = number[depth] {
            return value
        }

        var nextStones = [Int64]()
        if input == 0 {
            nextStones.append(1)
        } else {
            let count = digitCount(input: input)
            if count % 2 == 0 {
                let newStones = splitStone(stone: input, count: count)
                nextStones.append(newStones.0)
                nextStones.append(newStones.1)
            } else {
                nextStones.append(input * 2024)
            }
        }

        if depth == 1 {
            let result = Int64(nextStones.count)
            if var depths = cache[input] {
                depths[depth] = result
                cache[input] = depths
            } else {
                cache[input] = [depth: result]
            }
            return result
        } else {
            var sum: Int64 = 0
            for stone in nextStones {
                let result = getStones(input: stone, depth: depth - 1, cache: &cache)
                sum += result
            }

            if var depths = cache[input] {
                depths[depth] = sum
                cache[input] = depths
            } else {
                cache[input] = [depth: sum]
            }

            return sum
        }
    }
}
