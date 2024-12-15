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

	private struct PositionDirection: Hashable {
		let x: Int
		let y: Int
		let direction: Direction
	}

	// Replace this with your solution for the second part of the day's challenge.
	func part2() -> Any {
		var initialPosition = PositionDirection(x: 0, y: 0, direction: .right)

		for (i, entity) in entities.enumerated() {
			for (j, char) in entity.enumerated() {
				if char == "<" {
					initialPosition = PositionDirection(x: j, y: i, direction: .left)
					break
				} else if char == ">" {
					initialPosition = PositionDirection(x: j, y: i, direction: .right)
					break
				} else if char == "^" {
					initialPosition = PositionDirection(x: j, y: i, direction: .up)
					break
				} else if char == "v" {
					initialPosition = PositionDirection(x: j, y: i, direction: .down)
					break
				}
			}
		}

		var position = Position(x: initialPosition.x, y: initialPosition.y)
		var direction = initialPosition.direction
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

		var sum = 0
		for location in path {

			var newObstacle = Position(x: 0, y: 0)
			if entities[location.y][location.x] == "." {
				newObstacle = Position(x: location.x, y: location.y)
			} else {
				continue
			}

			var position = initialPosition
			var path = Set<PositionDirection>()
			path.insert(position)

			var samePath = false
			var outOfBounds = false

			while(!samePath && !outOfBounds) {
				switch position.direction {
				case .up:
					if position.y == 0 {
						outOfBounds = true
						continue
					}
					if entities[position.y - 1][position.x] == "#" ||
						(position.y - 1 == newObstacle.y && position.x == newObstacle.x) {
						position = PositionDirection(x: position.x, y: position.y, direction: .right)
						continue
					}
					position = PositionDirection(x: position.x, y: position.y - 1, direction: position.direction)
					if path.contains(position) {
						samePath = true
						sum += 1
						continue
					}
					path.insert(position)
				case .down:
					if position.y == entities.count - 1 {
						outOfBounds = true
						continue
					}
					if entities[position.y + 1][position.x] == "#" ||
						(position.y + 1 == newObstacle.y && position.x == newObstacle.x) {
						position = PositionDirection(x: position.x, y: position.y, direction: .left)
						continue
					}
					position = PositionDirection(x: position.x, y: position.y + 1, direction: position.direction)
					if path.contains(position) {
						samePath = true
						sum += 1
						continue
					}
					path.insert(position)
				case .left:
					if position.x == 0 {
						outOfBounds = true
						continue
					}
					if entities[position.y][position.x - 1] == "#" ||
						(position.y == newObstacle.y && position.x - 1 == newObstacle.x) {
						position = PositionDirection(x: position.x, y: position.y, direction: .up)
						continue
					}
					position = PositionDirection(x: position.x - 1, y: position.y, direction: position.direction)
					if path.contains(position) {
						samePath = true
						sum += 1
						continue
					}
					path.insert(position)
				case .right:
					if position.x == entities[0].count - 1 {
						outOfBounds = true
						continue
					}
					if entities[position.y][position.x + 1] == "#" ||
						(position.y == newObstacle.y && position.x + 1 == newObstacle.x) {
						position = PositionDirection(x: position.x, y: position.y, direction: .down)
						continue
					}
					position = PositionDirection(x: position.x + 1, y: position.y, direction: position.direction)
					if path.contains(position) {
						samePath = true
						sum += 1
						continue
					}
					path.insert(position)
				}
			}
		}

		return sum
	}
}
