//
//  WebService.swift
//  Reto_Tecnico_Jose_QR
//
//  Created by Jose Leoncio Quispe Rodriguez on 4/05/22.
//

import Foundation
import RxSwift
import UIKit

typealias LoadClosure = ()

internal enum WebServiceError: Error {
    case badStatus(Int, Data)
    case api(Int, String)
}

private struct Status: Decodable {
    let code: Int
    let message: String

    enum CodingKeys: String, CodingKey {
        case code = "status_code"
        case message = "status_message"
    }
}
extension Decodable {
  
    func validate(success: (() -> Void) ) {
        /*
        -->Validate TimeOut
        */
        success()
    }

}

final internal class WebService {
    private let session = URLSession(configuration: .default)
    private lazy var baseURL: URL = URL(string: Constant.URL.Base)!
    
    private let decoder = JSONDecoder()

    init() {
        decoder.dateDecodingStrategy = .deferredToDate
    }

    func load<T>(modelType type: T.Type, from endpoint: Endpoint, showLoader:LoadClosure? = nil, hideLoader:LoadClosure? = nil, base:URL? = nil) -> Observable<T> where T: Decodable {
    
        var request: URLRequest
        request = endpoint.request(with: baseURL)
        
        let decoder = self.decoder

        let vc = UIApplication.topViewController()
  
        let timerValue = false
        
        if timerValue {
            return Observable<T>.empty()
        } else {
           
            if showLoader == nil {
                vc?.hideLoader()
            } else { showLoader }
        
          print("request: \(request)")
            return session.rx.data(request: request)
                .map {
                    
                    if hideLoader == nil {
                        vc?.hideLoader()
                    } else { hideLoader }
                   
                    let result = try decoder.decode(T.self, from: $0)
                   
                    return result
                }
                .catchError { error in
                    
                    if hideLoader == nil {
                        vc?.hideLoader()
                    } else { hideLoader }
                    
                    guard let webServiceError = error as? WebServiceError else {
                        throw error
                    }

                    guard case let .badStatus(_, data) = webServiceError else {
                        throw error
                    }

                    guard let status = try? decoder.decode(Status.self, from: data) else {
                        throw error
                    }

                    throw WebServiceError.api(status.code, status.message)
                }
            }
        }

    }



private extension Reactive where Base: URLSession {
    func data(request: URLRequest) -> Observable<Data> {
        return Observable.create { observer in
            let task = self.base.dataTask(with: request) { data, response, error in
                if let error = error {
                    observer.onError(error)
                } else {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        fatalError("Unsupported protocol")
                    }

                    if 200..<300 ~= httpResponse.statusCode {
                        if let data = data {
                            observer.onNext(data)
                        }
                        observer.onCompleted()
                    } else {
                        observer.onError(WebServiceError.badStatus(httpResponse.statusCode, data ?? Data()))
                    }
                }
            }

            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}



public extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
