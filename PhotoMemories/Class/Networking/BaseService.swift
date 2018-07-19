//
//  BaseService.swift
//  PhotoMemories
//
//  Created by nguyen.manh.tuanb on 7/17/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import Foundation
import RxAlamofire
import Alamofire
import RxSwift

protocol BaseService {
    static func request(api: API, params: [String: Any]) -> Observable<DataRequest>
}

extension BaseService {
    
    static func request(api: API, params: [String: Any]) -> Observable<DataRequest> {
        let url = api.path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return SessionManager.default
            .rx
            .request(api.medthod, url, parameters: params, encoding: JSONEncoding.default, headers: nil)
    }
    
}
