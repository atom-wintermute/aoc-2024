import Algorithms
import Foundation

struct Day04: AdventDay {
	// Save your data in a corresponding text file in the `Data` directory.
	var data: String

	// Splits input data into its component parts and convert from string.
	var entities: [[Character]] {
		data.split(separator: "\n").map {
			return Array($0)
		}

	}

	// Replace this with your solution for the first part of the day's challenge.
	func part1() -> Any {
		var sum = 0

		for (y, entity) in entities.enumerated() {
			for x in 0...entities.count-1 {

				if x <= entity.count - 4 {
					if checkRight(x: x, y: y) {
						sum += 1
					}
					if y <= entities.count - 4 {
						if checkDownRight(x: x, y: y) {
							sum += 1
						}
					}
					if y >= 3 {
						if checkUpRight(x: x, y: y) {
							sum += 1
						}
					}
				}
				if x >= 3 {

					if checkLeft(x: x, y: y) {
						sum += 1
					}

					if y <= entities.count - 4 {
						if checkDownLeft(x: x, y: y) {
							sum += 1
						}
					}
					if y >= 3 {
						if checkUpLeft(x: x, y: y) {
							sum += 1
						}
					}
				}
				if y <= entities.count - 4 {
					if checkDown(x: x, y: y) {
						sum += 1
					}
				}
				if y >= 3 {
					if checkUp(x: x, y: y) {
						sum += 1
					}
				}
			}
		}

		return sum
	}

	// MARK: - Private

	private func checkRight(x: Int, y: Int) -> Bool {
		if entities[y][x] != "X" {
			return false
		}
		if entities[y][x+1] != "M" {
			return false
		}
		if entities[y][x+2] != "A" {
			return false
		}
		if entities[y][x+3] != "S" {
			return false
		}
		return true
	}

	private func checkLeft(x: Int, y: Int) -> Bool {
		if entities[y][x] != "X" {
			return false
		}
		if entities[y][x-1] != "M" {
			return false
		}
		if entities[y][x-2] != "A" {
			return false
		}
		if entities[y][x-3] != "S" {
			return false
		}
		return true
	}

	private func checkDown(x: Int, y: Int) -> Bool {
		if entities[y][x] != "X" {
			return false
		}
		if entities[y+1][x] != "M" {
			return false
		}
		if entities[y+2][x] != "A" {
			return false
		}
		if entities[y+3][x] != "S" {
			return false
		}
		return true
	}

	private func checkUp(x: Int, y: Int) -> Bool {
		if entities[y][x] != "X" {
			return false
		}
		if entities[y-1][x] != "M" {
			return false
		}
		if entities[y-2][x] != "A" {
			return false
		}
		if entities[y-3][x] != "S" {
			return false
		}
		return true
	}

	private func checkUpRight(x: Int, y: Int) -> Bool {
		if entities[y][x] != "X" {
			return false
		}
		if entities[y-1][x+1] != "M" {
			return false
		}
		if entities[y-2][x+2] != "A" {
			return false
		}
		if entities[y-3][x+3] != "S" {
			return false
		}
		return true
	}

	private func checkUpLeft(x: Int, y: Int) -> Bool {
		if entities[y][x] != "X" {
			return false
		}
		if entities[y-1][x-1] != "M" {
			return false
		}
		if entities[y-2][x-2] != "A" {
			return false
		}
		if entities[y-3][x-3] != "S" {
			return false
		}
		return true
	}

	private func checkDownRight(x: Int, y: Int) -> Bool {
		if entities[y][x] != "X" {
			return false
		}
		if entities[y+1][x+1] != "M" {
			return false
		}
		if entities[y+2][x+2] != "A" {
			return false
		}
		if entities[y+3][x+3] != "S" {
			return false
		}
		return true
	}

	private func checkDownLeft(x: Int, y: Int) -> Bool {
		if entities[y][x] != "X" {
			return false
		}
		if entities[y+1][x-1] != "M" {
			return false
		}
		if entities[y+2][x-2] != "A" {
			return false
		}
		if entities[y+3][x-3] != "S" {
			return false
		}
		return true
	}

	// Replace this with your solution for the second part of the day's challenge.
	func part2() -> Any {
		var sum = 0
		for y in 1...entities.count-2 {
			for x in 1...entities[y].count-2 {
				if checkFirst(x: x, y: y) {
					sum += 1
				}
				if checkSecond(x: x, y: y) {
					sum += 1
				}
				if checkThird(x: x, y: y) {
					sum += 1
				}
				if checkFourth(x: x, y: y) {
					sum += 1
				}
			}
		}
		return sum
	}

	// MARK: - Private

	private func checkFirst(x: Int, y: Int) -> Bool {
		if entities[y][x] != "A" {
			return false
		}
		if entities[y-1][x-1] != "M" {
			return false
		}
		if entities[y-1][x+1] != "S" {
			return false
		}
		if entities[y+1][x-1] != "M" {
			return false
		}
		if entities[y+1][x+1] != "S" {
			return false
		}
		return true
	}

	private func checkSecond(x: Int, y: Int) -> Bool {
		if entities[y][x] != "A" {
			return false
		}
		if entities[y-1][x-1] != "M" {
			return false
		}
		if entities[y-1][x+1] != "M" {
			return false
		}
		if entities[y+1][x-1] != "S" {
			return false
		}
		if entities[y+1][x+1] != "S" {
			return false
		}
		return true
	}

	private func checkThird(x: Int, y: Int) -> Bool {
		if entities[y][x] != "A" {
			return false
		}
		if entities[y-1][x-1] != "S" {
			return false
		}
		if entities[y-1][x+1] != "S" {
			return false
		}
		if entities[y+1][x-1] != "M" {
			return false
		}
		if entities[y+1][x+1] != "M" {
			return false
		}
		return true
	}

	private func checkFourth(x: Int, y: Int) -> Bool {
		if entities[y][x] != "A" {
			return false
		}
		if entities[y-1][x-1] != "S" {
			return false
		}
		if entities[y-1][x+1] != "M" {
			return false
		}
		if entities[y+1][x-1] != "S" {
			return false
		}
		if entities[y+1][x+1] != "M" {
			return false
		}
		return true
	}
}
