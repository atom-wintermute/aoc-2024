import Testing

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
struct Day06Tests {
  // Smoke test data provided in the challenge question
	let testData = """
....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#...
"""

	@Test func testPart1() async throws {
		let challenge = Day06(data: testData)
		#expect(String(describing: challenge.part1()) == "41")
	}

	@Test func testPart2() async throws {
		let challenge = Day06(data: testData)
		#expect(String(describing: challenge.part2()) == "9")
	}
}
