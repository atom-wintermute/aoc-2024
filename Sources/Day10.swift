import Algorithms
import Foundation

struct Day10: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String

    // Splits input data into its component parts and convert from string.
    var rows: [[Character]] {
        data.split(separator: "\n").map {
            return Array($0)
        }
    }

    struct Position: Hashable {
        let x: Int
        let y: Int
    }

    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        var trail = [[Int]]()
        for row in rows {
            var trailRow = [Int]()
            for symbol in row {
                if symbol == "." {
                    trailRow.append(-1)
                } else {
                    trailRow.append(Int(String(symbol))!)
                }
            }
            trail.append(trailRow)
        }

        var scores = 0
        for (y, row) in trail.enumerated() {
            for (x, height) in row.enumerated() {
                if height == 0 {
                    let trails = findTrailsFrom(trail: trail, height: 0, x: x, y: y)
                    scores += trails.count
                }
            }
        }

        return scores
    }

    private func findTrailsFrom(trail: [[Int]], height: Int, x: Int, y: Int) -> Set<Position> {

        if height == 9 {
            var set = Set<Position>()
            set.insert(Position(x: x, y: y))
            return set
        }

        var set = Set<Position>()

        // up
        if y > 0 {
            if trail[y - 1][x] == height + 1 {
                let trails = findTrailsFrom(trail: trail, height: height + 1, x: x, y: y - 1)
                set.formUnion(trails)
            }
        }

        // down
        if y < trail.count - 1 {
            if trail[y + 1][x] == height + 1 {
                let trails = findTrailsFrom(trail: trail, height: height + 1, x: x, y: y + 1)
                set.formUnion(trails)
            }
        }

        // left
        if x > 0 {
            if trail[y][x - 1] == height + 1 {
                let trails = findTrailsFrom(trail: trail, height: height + 1, x: x - 1, y: y)
                set.formUnion(trails)
            }
        }

        // right
        if x < trail[y].count - 1 {
            if trail[y][x + 1] == height + 1 {
                let trails = findTrailsFrom(trail: trail, height: height + 1, x: x + 1, y: y)
                set.formUnion(trails)
            }
        }

        return set
    }

    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        var trail = [[Int]]()
        for row in rows {
            var trailRow = [Int]()
            for symbol in row {
                if symbol == "." {
                    trailRow.append(-1)
                } else {
                    trailRow.append(Int(String(symbol))!)
                }
            }
            trail.append(trailRow)
        }

        var scores = 0
        for (y, row) in trail.enumerated() {
            for (x, height) in row.enumerated() {
                if height == 0 {
                    scores += findTrailsCountFrom(trail: trail, height: 0, x: x, y: y)
                }
            }
        }

        return scores
    }

    private func findTrailsCountFrom(trail: [[Int]], height: Int, x: Int, y: Int) -> Int {

        if height == 9 {
            return 1
        }

        var trailsCount = 0

        // up
        if y > 0 {
            if trail[y - 1][x] == height + 1 {
                trailsCount += findTrailsCountFrom(trail: trail, height: height + 1, x: x, y: y - 1)
            }
        }

        // down
        if y < trail.count - 1 {
            if trail[y + 1][x] == height + 1 {
                trailsCount += findTrailsCountFrom(trail: trail, height: height + 1, x: x, y: y + 1)
            }
        }

        // left
        if x > 0 {
            if trail[y][x - 1] == height + 1 {
                trailsCount += findTrailsCountFrom(trail: trail, height: height + 1, x: x - 1, y: y)
            }
        }

        // right
        if x < trail[y].count - 1 {
            if trail[y][x + 1] == height + 1 {
                trailsCount += findTrailsCountFrom(trail: trail, height: height + 1, x: x + 1, y: y)
            }
        }

        return trailsCount
    }
}
