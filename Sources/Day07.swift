import Algorithms
import Foundation

struct Day07: AdventDay {
	// Save your data in a corresponding text file in the `Data` directory.
	var data: String

	// Splits input data into its component parts and convert from string.
	var entities: [String] {
		data.split(separator: "\n").map {
			return String($0)
		}
	}

	enum Operation {
		case multiply
		case add
	}

	// Replace this with your solution for the first part of the day's challenge.
	func part1() -> Any {
		var sum = 0

		for entity in entities {
			let splitted = entity.split(separator: ":")
			let result = Int(splitted[0])!

			let numbers = splitted[1].split(separator: " ").map { Int($0)! }

			let results = getPossibleResults(for: numbers.reversed(), operation: .add)
			let results2 = getPossibleResults(for: numbers.reversed(), operation: .multiply)

			if results.contains(result) || results2.contains(result) {
				sum += result
			}
		}

		return sum
	}

	private func getPossibleResults(for numbers: [Int], operation: Operation) -> [Int] {

		if numbers.count == 2 {
			switch operation {
			case .multiply:
				return [numbers[0] * numbers[1]]
			case .add:
				return [numbers[0] + numbers[1]]
			}
		} else {
			let first = numbers[0]
			var results = [Int]()
			switch operation {
			case .multiply:
				let remainNumbers = Array(numbers.dropFirst())
				var others = [Int]()
				others += getPossibleResults(for: remainNumbers, operation: .multiply)
				others += getPossibleResults(for: remainNumbers, operation: .add)
				for other in others {
					results.append(other * first)
				}
				return results
			case .add:
				let remainNumbers = Array(numbers.dropFirst())
				var others = [Int]()
				others += getPossibleResults(for: remainNumbers, operation: .multiply)
				others += getPossibleResults(for: remainNumbers, operation: .add)
				for other in others {
					results.append(other + first)
				}
				return results
			}
		}
	}

	// Replace this with your solution for the second part of the day's challenge.
	func part2() -> Any {
		return false
	}
}
