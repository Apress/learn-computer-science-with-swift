//  AnswersPlayground.swift

import Foundation

private let answersLiveViewClient = AnswersLiveViewClient()

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
}()

/// Shows a string in the current playground page's live view.
public func show(_ string: String) {
    answersLiveViewClient.show(string)
}

/// Shows a number in the current playground page's live view.
public func show(_ number: Int) {
    answersLiveViewClient.show(String(number))
}

/// Shows a decimal in the current playground page's live view.
public func show(_ decimal: Double) {
    answersLiveViewClient.show(String(decimal))
}

/// Shows a date in the current playground page's live view.
public func show(_ date: Date) {
    answersLiveViewClient.show(dateFormatter.string(for: date) ?? "")
}

/// Asks for a string in the current playground page's live view.
public func ask(_ placeholder: String? = nil) -> String {
    return answersLiveViewClient.ask(forType: .string, placeholder: placeholder ?? "Input")
}

/// Asks for a number in the current playground page's live view.
public func askForNumber(_ placeholder: String? = nil) -> Int {
    return Int(answersLiveViewClient.ask(forType: .number, placeholder: placeholder ?? "Number")) ?? 0
}

/// Asks for a decimal in the current playground page's live view.
public func askForDecimal(_ placeholder: String? = nil) -> Double {
    return Double(answersLiveViewClient.ask(forType: .decimal, placeholder: placeholder ?? "Decimal")) ?? 0
}

/// Asks for a date in the current playground page's live view.
public func askForDate(_ placeholder: String? = nil) -> Date {
    let dateString = answersLiveViewClient.ask(forType: .date, placeholder: placeholder ?? "Date")
    return dateFormatter.date(from:dateString) ?? Date()
}

/// Asks for a choice of string in the current playground page's live view, chosen from the array of options provided.
public func askForChoice(_ placeholder: String? = nil, options: [String]) -> String {
    return answersLiveViewClient.ask(forType: .choice(options), placeholder: placeholder ?? "Choice")
}
