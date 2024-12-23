import Testing

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
struct Day11Tests {
    // Smoke test data provided in the challenge question
    let testData = """
125 17
"""

    @Test func testPart1() async throws {
        let challenge = Day11(data: testData)
        #expect(String(describing: challenge.part1()) == "55312")
    }

    @Test func testPart2() async throws {
        let challenge = Day11(data: testData)
        #expect(String(describing: challenge.part2()) == "55312")
    }
}
