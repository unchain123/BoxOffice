//
//  BoxOfficeListViewModel.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/16.
//

import Foundation

protocol BoxOfficeListViewModelInput {
    func viewDidLoad()
}

protocol BoxOfficeListViewModelOutput {
    var boxOfficeList: Observable<[BoxOfficeList]> { get }
}

protocol BoxOfficeListDelegate: AnyObject {
    func applySnapshot(input: [BoxOfficeList])
}

final class BoxOfficeListViewModel: BoxOfficeListViewModelOutput {
    //MARK: OutPut
    var boxOfficeList: Observable<[BoxOfficeList]> = Observable([])
    weak var delegate: BoxOfficeListDelegate?

}

extension BoxOfficeListViewModel: BoxOfficeListViewModelInput {
    func viewDidLoad() {
        NetworkService.shared.fetch()
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BoxOfficeDTO.self) { [weak self] (response) in
                guard let self = self else { return }
                self.boxOfficeList.value.append(contentsOf: response.value?.boxOfficeResult.dailyBoxOfficeList ?? [BoxOfficeList(rank: "", movieName: "", openDate: "", audienceAttendance: "", rankIncrease: "", isNewRanked: "", movieCode: "")])
                self.delegate?.applySnapshot(input: self.boxOfficeList.value)
            }
    }
}
