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

	enum Operation2 {
		case multiply
		case add
		case concatenation
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
		var sum = 0

		for entity in entities {
			let splitted = entity.split(separator: ":")
			let result = Int(splitted[0])!

			let numbers = splitted[1].split(separator: " ").map { Int($0)! }

			let results = getPossibleResults2(for: numbers, operation: .add)
			let results2 = getPossibleResults2(for: numbers, operation: .multiply)
			let results3 = getPossibleResults2(for: numbers, operation: .concatenation)

			if results.contains(result) || results2.contains(result) || results3.contains(result) {
				sum += result
			}
		}

		return sum
	}

	private func getPossibleResults2(for numbers: [Int], operation: Operation2) -> [Int] {
		if numbers.count == 2 {
			switch operation {
			case .multiply:
				return [numbers[0] * numbers[1]]
			case .add:
				return [numbers[0] + numbers[1]]
			case .concatenation:
				let left = String(numbers[0])
				let right = String(numbers[1])
				return [Int(left + right)!]
			}
		} else {
			let last = numbers.last!
			var results = [Int]()
			switch operation {
			case .multiply:
				let remainNumbers = Array(numbers.dropLast())
				var others = [Int]()
				others += getPossibleResults2(for: remainNumbers, operation: .multiply)
				others += getPossibleResults2(for: remainNumbers, operation: .add)
				others += getPossibleResults2(for: remainNumbers, operation: .concatenation)
				for other in others {
					results.append(other * last)
				}
				return results
			case .add:
				let remainNumbers = Array(numbers.dropLast())
				var others = [Int]()
				others += getPossibleResults2(for: remainNumbers, operation: .multiply)
				others += getPossibleResults2(for: remainNumbers, operation: .add)
				others += getPossibleResults2(for: remainNumbers, operation: .concatenation)
				for other in others {
					results.append(other + last)
				}
				return results
			case .concatenation:
				let remainNumbers = Array(numbers.dropLast())
				var others = [Int]()
				others += getPossibleResults2(for: remainNumbers, operation: .multiply)
				others += getPossibleResults2(for: remainNumbers, operation: .add)
				others += getPossibleResults2(for: remainNumbers, operation: .concatenation)
				for other in others {
					let left = String(other)
					let right = String(last)
					results.append(Int(left + right)!)
				}
				return results
			}
		}
	}
}
