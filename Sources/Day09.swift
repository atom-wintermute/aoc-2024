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

	struct Space {
		let isFile: Bool
		let length: Int
		let weight: Int
	}

	// Replace this with your solution for the second part of the day's challenge.
	func part2() -> Any {
		var isFile = true

		var spaces: [Space] = []
		for (index, symbol) in symbols.enumerated() {
			if symbol == "\n" {
				break
			}
			let length = Int(String(symbol))!
			if isFile {
				let ID = index / 2
				spaces.append(Space(isFile: true, length: length, weight: ID))
			} else {
				spaces.append(Space(isFile: false, length: length, weight: -1))
			}

			isFile.toggle()
		}

		for i in stride(from: spaces.count - 1, to: 0, by: -1) {
			if !spaces[i].isFile {
				continue
			}
			let file = spaces[i]

			for j in stride(from: 0, to: i, by: 1) {
				if spaces[j].isFile {
					continue
				}

				let freeSpace = spaces[j]
				if freeSpace.length == file.length {
					spaces[j] = file
					spaces[i] = freeSpace
					break
				} else if freeSpace.length > file.length {
					let newFreeSpace = Space(isFile: false, length: file.length, weight: -1)
					spaces[i] = newFreeSpace

					spaces[j] = file

					let newEmptySpace = Space(isFile: false, length: freeSpace.length - file.length, weight: -1)
					spaces.insert(contentsOf: [newEmptySpace], at: j + 1)
					break
				}
			}
		}

		var disc = [Int]()
		for space in spaces {
			for _ in 0..<space.length {
				disc.append(space.weight)
			}
		}

		var checksum = 0

		for (index, symbol) in disc.enumerated() {
			if symbol == -1 {
				continue
			}
			checksum += index * Int(String(symbol))!
		}

		return checksum
	}
}
