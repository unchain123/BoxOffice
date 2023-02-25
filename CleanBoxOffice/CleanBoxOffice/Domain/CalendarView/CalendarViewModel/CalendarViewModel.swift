//
//  CalendarViewModel.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/24.
//

import Foundation

protocol CalendarViewModelOutput {
    var targetDate: Observable<String> { get }
}

final class CalendarViewModel : CalendarViewModelOutput {

    //MARK: Output
    var targetDate: Observable<String> = Observable("")
}
