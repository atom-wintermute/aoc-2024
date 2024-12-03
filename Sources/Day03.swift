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
		for entity in entities {
			sum += calcSumIn(string: entity)
		}

		return sum
	}

	// Replace this with your solution for the second part of the day's challenge.
	func part2() -> Any {
		var sum = 0
		let fullString = entities.joined(by: "")

			let splitted = fullString.split(separator: "don't()")
			sum += calcSumIn(string: String(splitted[0]))

			for i in 1 ..< splitted.count {
				let newString = String(splitted[i])

				let enabled = newString.split(separator: "do()")
				if enabled.count > 1 {
					for j in 1 ..< enabled.count {
						sum += calcSumIn(string: String(enabled[j]))
					}
				}
			}

		return sum
	}

	private func calcSumIn(string: String) -> Int {
		var sum = 0

		let scanner = Scanner(string: string)
		while !scanner.isAtEnd {

			if let _ = scanner.scanUpToString("ul("),
			   let _ = scanner.scanString("ul("),
				let first = scanner.scanInt() {

				if let _ = scanner.scanString(","),
				   let second = scanner.scanInt(),
				   let _ = scanner.scanString(")") {
					sum += first * second
				}

			} else {
				break
			}
		}
		return sum
	}
}
