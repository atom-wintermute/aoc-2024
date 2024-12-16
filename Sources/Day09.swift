import Algorithms
import Foundation

struct Day09: AdventDay {
	// Save your data in a corresponding text file in the `Data` directory.
	var data: String

	// Splits input data into its component parts and convert from string.
	var symbols: [Character] {
		return Array(data)
	}

	// Replace this with your solution for the first part of the day's challenge.
	func part1() -> Any {
		var disc = [Int]()
		var isFile = true
		for (index, symbol) in symbols.enumerated() {
			if symbol == "\n" {
				break
			}
			let length = Int(String(symbol))!
			if isFile {
				let ID = index / 2
				for _ in 0..<length {
					disc.append(ID)
				}
			} else {
				for _ in 0..<length {
					disc.append(-1)
				}
			}

			isFile.toggle()
		}

		for (index, symbol) in disc.enumerated() {
			if symbol != -1 {
				continue
			} else {
				for i in stride(from: disc.count - 1, to: index, by: -1) {
					if disc[i] != -1 {
						disc[index] = disc[i]
						disc[i] = -1
						break
					}
				}

			}
		}

		var checksum = 0

		for (index, symbol) in disc.enumerated() {
			if symbol == -1 {
				break
			}
			checksum += index * Int(String(symbol))!
		}

		return checksum
	}

	// Replace this with your solution for the second part of the day's challenge.
	func part2() -> Any {
		return false
	}

}
