import Algorithms

struct Day01: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String

    // Splits input data into its component parts and convert from string.
    var entities: [[Int]] {
        data.split(separator: "\n").map {
            return $0.split(separator: " ").compactMap {
                return Int($0)
            }
        }
    }

    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
		var safeReports = 0

		for entity in entities {
			if chechEntity(entity: entity) {
				safeReports += 1
			}
		}

        return safeReports
    }

    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
		var safeReports = 0

		for entity in entities {
			for (index, _) in entity.enumerated() {
				var updatedEntity = entity
				updatedEntity.remove(at: index)
				if chechEntity(entity: updatedEntity) {
					safeReports += 1
					break
				}
			}
		}

		return safeReports
    }

	private func chechEntity(entity: [Int]) -> Bool {
		var isAsc = true
		var isSafe = true

		var prev = 0

		for (index, num) in entity.enumerated() {
			if index == 0 {
				prev = num
				continue
			} else {
				if index == 1 {
					if num < prev {
						isAsc = false
					}
				}

				if isAsc {
					if num < prev {
						isSafe = false
						break
					}
					if num > prev + 3 || num == prev {
						isSafe = false
						break
					}
				} else {
					if num > prev {
						isSafe = false
						break
					}
					if prev - 3 > num || num == prev {
						isSafe = false
						break
					}
				}

				prev = num
			}
		}
		return isSafe
	}
}
