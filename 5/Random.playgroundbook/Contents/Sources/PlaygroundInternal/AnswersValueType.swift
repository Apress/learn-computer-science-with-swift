//  AnswersValueType.swift

import PlaygroundSupport

enum AnswersValueType {
    case string
    case number
    case decimal
    case date
    case choice([String])
}

extension AnswersValueType {
    init?(_ playgroundValue: PlaygroundValue) {
        switch playgroundValue {
        case .string("string"):
            self = .string
        case .string("number"):
            self = .number
        case .string("decimal"):
            self = .decimal
        case .string("date"):
            self = .date
        case .array(let options):
            self = .choice(options.flatMap({ (value) -> String? in
                if case .string(let string) = value {
                    return string
                }
                else {
                    return nil
                }
            }))
        default:
            return nil
        }
    }
    
    var playgroundValue: PlaygroundValue {
        switch self {
        case .string:
            return .string("string")
        case .number:
            return .string("number")
        case .decimal:
            return .string("decimal")
        case .date:
            return .string("date")
        case .choice(let options):
            return  .array(options.map({ (string) -> PlaygroundValue in
                return .string(string)
            }))
        }
    }
}
