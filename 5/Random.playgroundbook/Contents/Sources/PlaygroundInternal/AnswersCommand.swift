//  AnswersCommand.swift

import PlaygroundSupport

enum AnswersCommand {
    case show(String)
    case ask(AnswersValueType, String)
    case submit(String)
    case clear
}

extension AnswersCommand {
    init?(_ playgroundValue: PlaygroundValue) {
        guard case let .dictionary(dict) = playgroundValue else {
            return nil
        }
        
        guard case let .string(command)? = dict["Command"] else {
            return nil
        }
        
        switch command {
        case "Show":
            guard case let .string(string)? = dict["String"] else {
                return nil
            }
            
            self = .show(string)
        case "Ask":
            guard let valueType = dict["ValueType"] != nil ? AnswersValueType(dict["ValueType"]!) : .string,
                  case let .string(placeholder)? = dict["Placeholder"] else {
                return nil
            }
            
            self = .ask(valueType, placeholder)
        case "Submit":
            guard case let .string(stringValue)? = dict["StringValue"] else {
                return nil
            }
            
            self = .submit(stringValue)
        case "Clear":
            self = .clear
        default:
            return nil
        }
    }
    
    fileprivate var playgroundValue: PlaygroundValue {
        switch self {
        case .show(let string):
            let dict: [String: PlaygroundValue] = [
                "Command": .string("Show"),
                "String": .string(string),
            ]
            return .dictionary(dict)
        case .ask(let valueType, let placeholder):
            let dict: [String: PlaygroundValue] = [
                "Command": .string("Ask"),
                "ValueType": valueType.playgroundValue,
                "Placeholder": .string(placeholder),
            ]
            return .dictionary(dict)
        case .submit(let stringValue):
            let dict: [String: PlaygroundValue] = [
                "Command": .string("Submit"),
                "StringValue": .string(stringValue),
            ]
            return .dictionary(dict)
        case .clear:
            let dict: [String: PlaygroundValue] = [
                "Command": .string("Clear")
            ]
            return .dictionary(dict)
        }
    }
}

extension PlaygroundLiveViewMessageHandler {
    func send(_ command: AnswersCommand) {
        self.send(command.playgroundValue)
    }
}
