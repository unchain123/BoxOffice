//
//  BoxOfficeListViewModel.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/16.
//

import Foundation

protocol BoxOfficeListViewModelInput {
    func viewDidLoad(targetDate: String)
}

protocol BoxOfficeListViewModelOutput {
    var boxOfficeList: Observable<[BoxOfficeList]> { get }
}

protocol BoxOfficeListDelegate: AnyObject {
    func applySnapshot(input: [BoxOfficeList])
}

protocol CalendarDelegate: AnyObject {
    func chooseDate(targetDate: String)
}

final class BoxOfficeListViewModel: BoxOfficeListViewModelOutput {

    //MARK: OutPut
    var boxOfficeList: Observable<[BoxOfficeList]> = Observable([])
    weak var boxOfficeDelegate: BoxOfficeListDelegate?
    weak var calendarDelegate: CalendarDelegate?
}

extension BoxOfficeListViewModel: BoxOfficeListViewModelInput {
    func viewDidLoad(targetDate: String = Calendar.current.date(byAdding: .day, value: -1, to: Date())?.today ?? "") {
        NetworkService.shared.fetch(targetDate: targetDate)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BoxOfficeDTO.self) { [weak self] (response) in
                guard let self = self else { return }
                self.boxOfficeList.value = response.value?.boxOfficeResult.dailyBoxOfficeList ?? [BoxOfficeList(rank: "", movieName: "", openDate: "", audienceAttendance: "", rankIncrease: "", isNewRanked: "", movieCode: "", todayAttendance: "")]

                self.boxOfficeDelegate?.applySnapshot(input: self.boxOfficeList.value)
            }
    }
}
