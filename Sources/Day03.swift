import Algorithms
import Foundation

struct Day03: AdventDay {
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

		var sum = 0
		for entity in entities{

			let scanner = Scanner(string: entity)
			while !scanner.isAtEnd {

				if let _ = scanner.scanUpToString("ul("),
				   let _ = scanner.scanString("ul("),
					let first = scanner.scanInt() {

					if let _ = scanner.scanString(","),
					   let second = scanner.scanInt(),
					   let bracket = scanner.scanString(")") {
						sum += first * second
					}

				} else {
					break
				}
			}
		}

		return sum
	}

	// Replace this with your solution for the second part of the day's challenge.
	func part2() -> Any {
		return false
	}
}
