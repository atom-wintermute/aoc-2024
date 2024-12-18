import Testing

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
struct Day17Tests {
	// Smoke test data provided in the challenge question
	let testData = """
Register A: 729
Register B: 0
Register C: 0

Program: 0,1,5,4,3,0
"""

	let testData2 = """
Register A: 10
Register B: 0
Register C: 0

Program: 5,0,5,1,5,4
"""

	let testData3 = """
Register A: 2024
Register B: 0
Register C: 0

Program: 0,1,5,4,3,0
"""

	@Test func testPart1() async throws {
		let challenge = Day17(data: testData)
		#expect(String(describing: challenge.part1()) == "4635635210")

		let challenge2 = Day17(data: testData2)
		#expect(String(describing: challenge2.part1()) == "012")

		let challenge3 = Day17(data: testData3)
		#expect(String(describing: challenge3.part1()) == "42567777310")
	}

	@Test func testPart2() async throws {
		let challenge = Day17(data: testData)
		#expect(String(describing: challenge.part2()) == "2858")
	}
}
