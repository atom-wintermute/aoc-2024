import Algorithms
import Foundation

struct Day06: AdventDay {
	// Save your data in a corresponding text file in the `Data` directory.
	var data: String

	// Splits input data into its component parts and convert from string.
	var entities: [[Character]] {
		data.split(separator: "\n").map {
			return Array($0)
		}
	}

	private struct Position: Hashable {
		let x: Int
		let y: Int
	}

	private enum Direction {
		case up
		case down
		case left
		case right
	}

	// Replace this with your solution for the first part of the day's challenge.
	func part1() -> Any {
		var position = Position(x: 0, y: 0)
		var direction = Direction.right

		for (i, entity) in entities.enumerated() {
			for (j, char) in entity.enumerated() {
				if char == "<" {
					position = Position(x: j, y: i)
					direction = .left
					break
				} else if char == ">" {
					position = Position(x: j, y: i)
					direction = .left
					break
				} else if char == "^" {
					position = Position(x: j, y: i)
					direction = .up
					break
				} else if char == "v" {
					position = Position(x: j, y: i)
					direction = .left
					break
				}
			}
		}

		var path = Set<Position>()
		path.insert(position)
		var outOfBounds = false
		while(!outOfBounds) {

			switch direction {
			case .up:
				if position.y == 0 {
					outOfBounds = true
					continue
				}
				if entities[position.y - 1][position.x] == "#" {
					direction = .right
					continue
				}
				position = Position(x: position.x, y: position.y - 1)
				path.insert(position)
			case .down:
				if position.y == entities.count - 1 {
					outOfBounds = true
					continue
				}
				if entities[position.y + 1][position.x] == "#" {
					direction = .left
					continue
				}
				position = Position(x: position.x, y: position.y + 1)
				path.insert(position)
			case .left:
				if position.x == 0 {
					outOfBounds = true
					continue
				}
				if entities[position.y][position.x - 1] == "#" {
					direction = .up
					continue
				}
				position = Position(x: position.x - 1, y: position.y)
				path.insert(position)
			case .right:
				if position.x == entities[0].count - 1 {
					outOfBounds = true
					continue
				}
				if entities[position.y][position.x + 1] == "#" {
					direction = .down
					continue
				}
				position = Position(x: position.x + 1, y: position.y)
				path.insert(position)
			}
		}

		return path.count
	}

	// Replace this with your solution for the second part of the day's challenge.
	func part2() -> Any {
		return false
	}
}
