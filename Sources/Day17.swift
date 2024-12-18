import Algorithms
import Foundation

struct Day17: AdventDay {
	// Save your data in a corresponding text file in the `Data` directory.
	var data: String

	// Splits input data into its component parts and convert from string.
	var entities: [String] {
		data.split(separator: "\n").map {
			String($0)
		}
	}

	struct Command {
		let oper: Int
		let operand: Int
	}

	// Replace this with your solution for the first part of the day's challenge.
	func part1() -> Any {

		var registerA = Int(String(entities[0].split(separator: ": ").last!))!
		var registerB = Int(String(entities[1].split(separator: ": ").last!))!
		var registerC = Int(String(entities[2].split(separator: ": ").last!))!

		let programRaw = String(entities[3].split(separator: ": ").last!)
		let program: [Int] = programRaw.split(separator: ",").map {
			Int($0)!
		}

		var oper = 0
		var commands = [Command]()
		for (index, symbol) in program.enumerated() {
			if index % 2 == 0 {
				oper = symbol
			} else {
				commands.append(Command(oper: oper, operand: symbol))
			}
		}

		var output = [Int]()

		var pointer = 0
		while true {
			if pointer > commands.count - 1 {
				break
			}
			let command = commands[pointer]

			switch command.oper {
			case 0:
				let comboOperand = getComboOperand(
					operand: command.operand,
					registerA: registerA,
					registerB: registerB,
					registerC: registerC
				)
				if comboOperand == -1 {
					break
				}
				let result = registerA / powInt(base: 2, power: comboOperand)
				registerA = result
			case 1:
				let result = registerB ^ command.operand
				registerB = result
			case 2:
				let comboOperand = getComboOperand(
					operand: command.operand,
					registerA: registerA,
					registerB: registerB,
					registerC: registerC
				)
				if comboOperand == -1 {
					break
				}
				let result = comboOperand % 8
				registerB = result
			case 3:
				if registerA == 0 {
					pointer += 1
					continue
				} else {
					pointer = command.operand / 2
					continue
				}
			case 4:
				let result = registerB ^ registerC
				registerB = result
			case 5:
				let comboOperand = getComboOperand(
					operand: command.operand,
					registerA: registerA,
					registerB: registerB,
					registerC: registerC
				)
				if comboOperand == -1 {
					break
				}
				let result = comboOperand % 8
				output.append(result)
			case 6:
				let comboOperand = getComboOperand(
					operand: command.operand,
					registerA: registerA,
					registerB: registerB,
					registerC: registerC
				)
				if comboOperand == -1 {
					break
				}
				let result = registerA / powInt(base: 2, power: comboOperand)
				registerB = result
			case 7:
				let comboOperand = getComboOperand(
					operand: command.operand,
					registerA: registerA,
					registerB: registerB,
					registerC: registerC
				)
				if comboOperand == -1 {
					break
				}
				let result = registerA / powInt(base: 2, power: comboOperand)
				registerC = result
			default:
				break
			}
			pointer += 1
		}

		var outputString = ""
		for number in output {
			outputString += String(number)
		}

		return outputString
	}

	private func getComboOperand(operand: Int, registerA: Int, registerB: Int, registerC: Int) -> Int {
		switch operand {
		case 0...3:
			return operand
		case 4:
			return registerA
		case 5:
			return registerB
		case 6:
			return registerC
		default:
			return -1
		}
	}

	private func powInt(base: Int, power: Int) -> Int {
		if power == 0 {
			return 1
		} else if power == 1 {
			return base
		}
		var result = base
		for _ in 1...power-1 {
			result *= base
		}
		return result
	}

	// Replace this with your solution for the second part of the day's challenge.
	func part2() -> Any {
		return false
	}
}
