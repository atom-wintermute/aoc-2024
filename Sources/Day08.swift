import Algorithms
import Foundation

struct Day08: AdventDay {
	// Save your data in a corresponding text file in the `Data` directory.
	var data: String

	// Splits input data into its component parts and convert from string.
	var rows: [[Character]] {
		data.split(separator: "\n").map {
			return Array($0)
		}
	}

	private struct Position: Hashable {
		let x: Int
		let y: Int
	}

	// Replace this with your solution for the first part of the day's challenge.
	func part1() -> Any {
		var antennas = [Character: [Position]]()
		for (y, row) in rows.enumerated() {
			for (x, symbol) in row.enumerated() {
				if symbol != "." {
					if antennas[symbol] == nil {
						antennas[symbol] = [Position(x: x, y: y)]
					} else {
						antennas[symbol]!.append(Position(x: x, y: y))
					}
				}
			}
		}

		var antinodes = Set<Position>()
		for (_, positions) in antennas {
			if positions.count > 1 {

				for (i, position) in positions.enumerated() {
					for j in i + 1 ..< positions.count {

						let position2 = positions[j]
						let difX = abs(position.x - position2.x)
						let difY = abs(position.y - position2.y)

						if position.x > position2.x {
							if position.y > position2.y {

								let antinodePosition1 = Position(x: position.x + difX, y: position.y + difY)
								if validateAntinode(antinodePosition1) {
									antinodes.insert(antinodePosition1)
								}

								let antinodePosition2 = Position(x: position2.x - difX, y: position2.y - difY)
								if validateAntinode(antinodePosition2) {
									antinodes.insert(antinodePosition2)
								}
							} else {

								let antinodePosition1 = Position(x: position.x + difX, y: position.y - difY)
								if validateAntinode(antinodePosition1) {
									antinodes.insert(antinodePosition1)
								}

								let antinodePosition2 = Position(x: position2.x - difX, y: position2.y + difY)
								if validateAntinode(antinodePosition2) {
									antinodes.insert(antinodePosition2)
								}
							}
						} else {
							if position.y > position2.y {

								let antinodePosition1 = Position(x: position.x - difX, y: position.y + difY)
								if validateAntinode(antinodePosition1) {
									antinodes.insert(antinodePosition1)
								}

								let antinodePosition2 = Position(x: position2.x + difX, y: position2.y - difY)
								if validateAntinode(antinodePosition2) {
									antinodes.insert(antinodePosition2)
								}
							} else {

								let antinodePosition1 = Position(x: position.x - difX, y: position.y - difY)
								if validateAntinode(antinodePosition1) {
									antinodes.insert(antinodePosition1)
								}

								let antinodePosition2 = Position(x: position2.x + difX, y: position2.y + difY)
								if validateAntinode(antinodePosition2) {
									antinodes.insert(antinodePosition2)
								}
							}
						}
					}
				}
			}
		}

		return antinodes.count
	}

	private func validateAntinode(_ position: Position) -> Bool {
		if position.x < 0 || position.x >= rows[0].count {
			return false
		}
		if position.y < 0 || position.y >= rows.count {
			return false
		}
		return true
	}

	// Replace this with your solution for the second part of the day's challenge.
	func part2() -> Any {
		return false
	}

}
