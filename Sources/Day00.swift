import Algorithms

struct Day00: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String

    // Splits input data into its component parts and convert from string.
    var entities: [[Int]] {
        data.split(separator: "\n").map {
            return $0.split(separator: "   ").compactMap {
                return Int($0)
            }
        }
    }

    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        var firstList = [Int]()
        var secondList = [Int]()

        for entity in entities {
            firstList.append(entity[0])
            secondList.append(entity[1])
        }

        firstList.sort()
        secondList.sort()

        var sum = 0
        for (index, dist) in firstList.enumerated() {
            sum += abs(dist - secondList[index])
        }

        return sum
    }

    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        var firstList = [Int]()
        var secondList = [Int]()

        for entity in entities {
            firstList.append(entity[0])
            secondList.append(entity[1])
        }

        var dict = [Int: Int]()
        for elem in secondList {
            if dict[elem] != nil {
                dict[elem]! += 1
            } else {
                dict[elem] = 1
            }
        }

        var sum = 0
        for elem in firstList {
            if dict[elem] != nil {
                sum += elem * dict[elem]!
            }
        }

        return sum
    }
}
