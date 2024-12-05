import Algorithms
import Foundation

struct Day05: AdventDay {
	// Save your data in a corresponding text file in the `Data` directory.
	var data: String

	// Splits input data into its component parts and convert from string.
	var entities: [String] {
		data.split(separator: "\n").map {
			return String($0)
		}
	}

	struct Rule {
		let first: Int
		let second: Int
	}

	// Replace this with your solution for the first part of the day's challenge.
	func part1() -> Any {

		var sum = 0
		var rulesParsed = false
		var rules = [Rule]()
		var rulesDict = [Int: [Int]]()

		for entity in entities {
			if entity.count == 5 {
				let splitted = entity.split(separator: "|")

				rules.append(Rule(first: Int(splitted[0])!, second: Int(splitted[1])!))
			} else {
				if !rulesParsed {
					for rule in rules {
						if rulesDict[rule.second] != nil {
							rulesDict[rule.second]!.append(rule.first)
						} else {
							rulesDict[rule.second] = [rule.first]
						}
					}
					rulesParsed = true
				}

				let splitted = entity.split(separator: ",")
				let sequence = splitted.map { Int($0)! }
				if isValud(sequence: sequence, rules: rulesDict) {
					sum += sequence[(sequence.count - 1) / 2]
				}
			}
		}

		return sum
	}

	private func isValud(sequence: [Int], rules: [Int: [Int]]) -> Bool {
		for (index, number) in sequence.enumerated() {
			if let rules = rules[number] {
				for next in index + 1 ..< sequence.count {
					if rules.contains(sequence[next]) {
						return false
					}
				}
			}
		}
		return true
	}

	// Replace this with your solution for the second part of the day's challenge.
	func part2() -> Any {
		return false
	}
}
