import Testing

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
struct Day07Tests {
  // Smoke test data provided in the challenge question
	let testData = """
190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20
"""

	@Test func testPart1() async throws {
		let challenge = Day07(data: testData)
		#expect(String(describing: challenge.part1()) == "3749")
	}

	@Test func testPart2() async throws {
		let challenge = Day07(data: testData)
		#expect(String(describing: challenge.part2()) == "6")
	}
}
