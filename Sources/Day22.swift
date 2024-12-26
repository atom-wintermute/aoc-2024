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

    private struct Changes: Hashable {
        let first: Int
        let second: Int
        let third: Int
        let fourth: Int
    }

    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        var buyers = [Int]()

        for entity in entities {
            buyers.append(Int(entity)!)
        }

        var globalDict = [Changes: Int]()
        for buyer in buyers {
            var currentSecret = buyer

            var dict = [Changes: Int]()
            var prices = [Int]()
            prices.append(currentSecret)
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

                prices.append(currentSecret)
            }

            var changes = [Int]()
            var previousPrice = prices.first! % 10
            for (i, price) in prices.enumerated() {
                let priceEnd = price % 10
                if i == 0 {
                    continue
                }
                changes.append(priceEnd - previousPrice)

                previousPrice = priceEnd
            }

            for (i, change) in changes.enumerated() {
                if i > 3 {
                    let changes = Changes(
                        first: changes[i - 3],
                        second: changes[i - 2],
                        third: changes[i - 1],
                        fourth: change
                    )
                    let price = prices[i+1] % 10
                    if dict[changes] == nil {
                        dict[changes] = price
                    }
                }
            }

            for (changes, price) in dict {
                if let savedPrice = globalDict[changes] {
                    globalDict[changes] = savedPrice + price
                } else {
                    globalDict[changes] = price
                }
            }
        }

        var max = 0
        for (_, price) in globalDict {
            if price > max {
                max = price
            }
        }

        return max
    }
}
