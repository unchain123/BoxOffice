//
//  CalendarView.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/24.
//

import UIKit

final class CalendarViewController: UIViewController, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        print(dateComponents?.date?.today)
    }

    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        return nil
    }

    private let calendarView: UICalendarView = {
        let calendarView = UICalendarView()
        calendarView.backgroundColor = .systemBackground
        calendarView.calendar = .current
        calendarView.locale = Locale(identifier: "KOR")
        calendarView.fontDesign = .rounded
        calendarView.availableDateRange = DateInterval(start: .distantPast, end: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date())
        return calendarView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view = calendarView
        calendarView.delegate = self
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = dateSelection
    }
}
