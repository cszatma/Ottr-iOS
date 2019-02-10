//
//  API.swift
//  Ottr-iOS
//
//  Created by Christopher Szatmary on 2019-02-09.
//  Copyright © 2019 Christopher Szatmary. All rights reserved.
//

import Alamofire

struct RequestOptions {
    var parameters: Parameters?
    var encoding: ParameterEncoding = JSONEncoding.default
    var headers: HTTPHeaders?
}

struct API {
    private static let baseURL = "http://localhost:8000/api"
    private static let queue = DispatchQueue(
        label: "com.christopherszatmary.response-queue",
        qos: .utility,
        attributes: [.concurrent]
    )
    
    static func request<T: Decodable>(
        path: String,
        method: HTTPMethod = .get,
        options: RequestOptions = RequestOptions(),
        dataType: T.Type,
        callback: @escaping (T?, Error?) -> Void
    )  {
        Alamofire
            .request(
                "\(baseURL)\(path)",
                method: method,
                parameters: options.parameters,
                encoding: options.encoding,
                headers: options.headers
            ).responseData(queue: queue) { response in
                if let error = response.result.error {
                    return callback(nil, error)
                }
                
                guard let data = response.result.value else {
                    if let error = response.result.error {
                        callback(nil, error)
                    }
                    return
                }
                
                do {
                    let object = try JSONDecoder().decode(dataType, from: data)
                    callback(object, nil)
                } catch {
                    callback(nil, error)
                }
            }
    }
}

//Alamofire.request("http://httpbin.org/get", parameters: ["foo": "bar"])
//    .response(
//        queue: queue,
//        responseSerializer: DataRequest.jsonResponseSerializer(),
//        completionHandler: { response in
//            // You are now running on the concurrent `queue` you created earlier.
//            print("Parsing JSON on thread: \(Thread.current) is main thread: \(Thread.isMainThread)")
//
//            // Validate your JSON response and convert into model objects if necessary
//            print(response.result.value)
//
//            // To update anything on the main thread, just jump back on like so.
//            DispatchQueue.main.async {
//                print("Am I back on the main thread: \(Thread.isMainThread)")
//            }
//    }
//)
