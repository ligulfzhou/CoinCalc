/*
 * DO NOT EDIT.
 *
 * Generated by the protocol buffer compiler.
 * Source: proto/coin_calc.proto
 *
 */

/*
 * Copyright 2018, gRPC Authors All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import Foundation
import Dispatch
import gRPC
import SwiftProtobuf

/// Type for errors thrown from generated client code.
internal enum Coincalc_CoinCalcClientError : Error {
  case endOfStream
  case invalidMessageReceived
  case error(c: CallResult)
}

/// GetCoins (Unary)
internal class Coincalc_CoinCalcGetCoinsCall {
  private var call : Call

  /// Create a call.
  fileprivate init(_ channel: Channel) {
    self.call = channel.makeCall("/CoinCalc.CoinCalc/GetCoins")
  }

  /// Run the call. Blocks until the reply is received.
  fileprivate func run(request: CoinCalc_CoinListRequest,
                       metadata: Metadata) throws -> CoinCalc_CoinListResponse {
    let sem = DispatchSemaphore(value: 0)
    var returnCallResult : CallResult!
    var returnResponse : CoinCalc_CoinListResponse?
    _ = try start(request:request, metadata:metadata) {response, callResult in
      returnResponse = response
      returnCallResult = callResult
      sem.signal()
    }
    _ = sem.wait(timeout: DispatchTime.distantFuture)
    if let returnResponse = returnResponse {
      return returnResponse
    } else {
      throw Coincalc_CoinCalcClientError.error(c: returnCallResult)
    }
  }

  /// Start the call. Nonblocking.
  fileprivate func start(request: CoinCalc_CoinListRequest,
                         metadata: Metadata,
                         completion: @escaping (CoinCalc_CoinListResponse?, CallResult)->())
    throws -> Coincalc_CoinCalcGetCoinsCall {

      let requestData = try request.serializedData()
      try call.start(.unary,
                     metadata:metadata,
                     message:requestData)
      {(callResult) in
        if let responseData = callResult.resultData,
          let response = try? CoinCalc_CoinListResponse(serializedData:responseData) {
          completion(response, callResult)
        } else {
          completion(nil, callResult)
        }
      }
      return self
  }

  /// Cancel the call.
  internal func cancel() {
    call.cancel()
  }
}

/// GetCoinPrices (Unary)
internal class Coincalc_CoinCalcGetCoinPricesCall {
  private var call : Call

  /// Create a call.
  fileprivate init(_ channel: Channel) {
    self.call = channel.makeCall("/CoinCalc.CoinCalc/GetCoinPrices")
  }

  /// Run the call. Blocks until the reply is received.
  fileprivate func run(request: CoinCalc_PriceRequest,
                       metadata: Metadata) throws -> CoinCalc_CoinPriceResponse {
    let sem = DispatchSemaphore(value: 0)
    var returnCallResult : CallResult!
    var returnResponse : CoinCalc_CoinPriceResponse?
    _ = try start(request:request, metadata:metadata) {response, callResult in
      returnResponse = response
      returnCallResult = callResult
      sem.signal()
    }
    _ = sem.wait(timeout: DispatchTime.distantFuture)
    if let returnResponse = returnResponse {
      return returnResponse
    } else {
      throw Coincalc_CoinCalcClientError.error(c: returnCallResult)
    }
  }

  /// Start the call. Nonblocking.
  fileprivate func start(request: CoinCalc_PriceRequest,
                         metadata: Metadata,
                         completion: @escaping (CoinCalc_CoinPriceResponse?, CallResult)->())
    throws -> Coincalc_CoinCalcGetCoinPricesCall {

      let requestData = try request.serializedData()
      try call.start(.unary,
                     metadata:metadata,
                     message:requestData)
      {(callResult) in
        if let responseData = callResult.resultData,
          let response = try? CoinCalc_CoinPriceResponse(serializedData:responseData) {
          completion(response, callResult)
        } else {
          completion(nil, callResult)
        }
      }
      return self
  }

  /// Cancel the call.
  internal func cancel() {
    call.cancel()
  }
}

/// SetUserCoin (Unary)
internal class Coincalc_CoinCalcSetUserCoinCall {
  private var call : Call

  /// Create a call.
  fileprivate init(_ channel: Channel) {
    self.call = channel.makeCall("/CoinCalc.CoinCalc/SetUserCoin")
  }

  /// Run the call. Blocks until the reply is received.
  fileprivate func run(request: CoinCalc_SetUserCoinRequest,
                       metadata: Metadata) throws -> CoinCalc_SetUserCoinResponse {
    let sem = DispatchSemaphore(value: 0)
    var returnCallResult : CallResult!
    var returnResponse : CoinCalc_SetUserCoinResponse?
    _ = try start(request:request, metadata:metadata) {response, callResult in
      returnResponse = response
      returnCallResult = callResult
      sem.signal()
    }
    _ = sem.wait(timeout: DispatchTime.distantFuture)
    if let returnResponse = returnResponse {
      return returnResponse
    } else {
      throw Coincalc_CoinCalcClientError.error(c: returnCallResult)
    }
  }

  /// Start the call. Nonblocking.
  fileprivate func start(request: CoinCalc_SetUserCoinRequest,
                         metadata: Metadata,
                         completion: @escaping (CoinCalc_SetUserCoinResponse?, CallResult)->())
    throws -> Coincalc_CoinCalcSetUserCoinCall {

      let requestData = try request.serializedData()
      try call.start(.unary,
                     metadata:metadata,
                     message:requestData)
      {(callResult) in
        if let responseData = callResult.resultData,
          let response = try? CoinCalc_SetUserCoinResponse(serializedData:responseData) {
          completion(response, callResult)
        } else {
          completion(nil, callResult)
        }
      }
      return self
  }

  /// Cancel the call.
  internal func cancel() {
    call.cancel()
  }
}

/// GetUserCoins (Unary)
internal class Coincalc_CoinCalcGetUserCoinsCall {
  private var call : Call

  /// Create a call.
  fileprivate init(_ channel: Channel) {
    self.call = channel.makeCall("/CoinCalc.CoinCalc/GetUserCoins")
  }

  /// Run the call. Blocks until the reply is received.
  fileprivate func run(request: CoinCalc_GetUserCoinRequest,
                       metadata: Metadata) throws -> CoinCalc_GetUserCoinsResponse {
    let sem = DispatchSemaphore(value: 0)
    var returnCallResult : CallResult!
    var returnResponse : CoinCalc_GetUserCoinsResponse?
    _ = try start(request:request, metadata:metadata) {response, callResult in
      returnResponse = response
      returnCallResult = callResult
      sem.signal()
    }
    _ = sem.wait(timeout: DispatchTime.distantFuture)
    if let returnResponse = returnResponse {
      return returnResponse
    } else {
      throw Coincalc_CoinCalcClientError.error(c: returnCallResult)
    }
  }

  /// Start the call. Nonblocking.
  fileprivate func start(request: CoinCalc_GetUserCoinRequest,
                         metadata: Metadata,
                         completion: @escaping (CoinCalc_GetUserCoinsResponse?, CallResult)->())
    throws -> Coincalc_CoinCalcGetUserCoinsCall {

      let requestData = try request.serializedData()
      try call.start(.unary,
                     metadata:metadata,
                     message:requestData)
      {(callResult) in
        if let responseData = callResult.resultData,
          let response = try? CoinCalc_GetUserCoinsResponse(serializedData:responseData) {
          completion(response, callResult)
        } else {
          completion(nil, callResult)
        }
      }
      return self
  }

  /// Cancel the call.
  internal func cancel() {
    call.cancel()
  }
}

/// Call methods of this class to make API calls.
internal class Coincalc_CoinCalcService {
  public var channel: Channel

  /// This metadata will be sent with all requests.
  internal var metadata : Metadata

  /// This property allows the service host name to be overridden.
  /// For example, it can be used to make calls to "localhost:8080"
  /// appear to be to "example.com".
  internal var host : String {
    get {
      return self.channel.host
    }
    set {
      self.channel.host = newValue
    }
  }

  /// Create a client.
  internal init(address: String, secure: Bool = true) {
    gRPC.initialize()
    channel = Channel(address:address, secure:secure)
    metadata = Metadata()
  }

  /// Create a client that makes secure connections with a custom certificate and (optional) hostname.
  internal init(address: String, certificates: String, host: String?) {
    gRPC.initialize()
    channel = Channel(address:address, certificates:certificates, host:host)
    metadata = Metadata()
  }

  /// Synchronous. Unary.
  internal func getcoins(_ request: CoinCalc_CoinListRequest)
    throws
    -> CoinCalc_CoinListResponse {
      return try Coincalc_CoinCalcGetCoinsCall(channel).run(request:request, metadata:metadata)
  }
  /// Asynchronous. Unary.
  internal func getcoins(_ request: CoinCalc_CoinListRequest,
                  completion: @escaping (CoinCalc_CoinListResponse?, CallResult)->())
    throws
    -> Coincalc_CoinCalcGetCoinsCall {
      return try Coincalc_CoinCalcGetCoinsCall(channel).start(request:request,
                                                 metadata:metadata,
                                                 completion:completion)
  }
  /// Synchronous. Unary.
  internal func getcoinprices(_ request: CoinCalc_PriceRequest)
    throws
    -> CoinCalc_CoinPriceResponse {
      return try Coincalc_CoinCalcGetCoinPricesCall(channel).run(request:request, metadata:metadata)
  }
  /// Asynchronous. Unary.
  internal func getcoinprices(_ request: CoinCalc_PriceRequest,
                  completion: @escaping (CoinCalc_CoinPriceResponse?, CallResult)->())
    throws
    -> Coincalc_CoinCalcGetCoinPricesCall {
      return try Coincalc_CoinCalcGetCoinPricesCall(channel).start(request:request,
                                                 metadata:metadata,
                                                 completion:completion)
  }
  /// Synchronous. Unary.
  internal func setusercoin(_ request: CoinCalc_SetUserCoinRequest)
    throws
    -> CoinCalc_SetUserCoinResponse {
      return try Coincalc_CoinCalcSetUserCoinCall(channel).run(request:request, metadata:metadata)
  }
  /// Asynchronous. Unary.
  internal func setusercoin(_ request: CoinCalc_SetUserCoinRequest,
                  completion: @escaping (CoinCalc_SetUserCoinResponse?, CallResult)->())
    throws
    -> Coincalc_CoinCalcSetUserCoinCall {
      return try Coincalc_CoinCalcSetUserCoinCall(channel).start(request:request,
                                                 metadata:metadata,
                                                 completion:completion)
  }
  /// Synchronous. Unary.
  internal func getusercoins(_ request: CoinCalc_GetUserCoinRequest)
    throws
    -> CoinCalc_GetUserCoinsResponse {
      return try Coincalc_CoinCalcGetUserCoinsCall(channel).run(request:request, metadata:metadata)
  }
  /// Asynchronous. Unary.
  internal func getusercoins(_ request: CoinCalc_GetUserCoinRequest,
                  completion: @escaping (CoinCalc_GetUserCoinsResponse?, CallResult)->())
    throws
    -> Coincalc_CoinCalcGetUserCoinsCall {
      return try Coincalc_CoinCalcGetUserCoinsCall(channel).start(request:request,
                                                 metadata:metadata,
                                                 completion:completion)
  }
}


/// Type for errors thrown from generated server code.
internal enum Coincalc_CoinCalcServerError : Error {
  case endOfStream
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Coincalc_CoinCalcProvider {
  func getcoins(request : CoinCalc_CoinListRequest, session : Coincalc_CoinCalcGetCoinsSession) throws -> CoinCalc_CoinListResponse
  func getcoinprices(request : CoinCalc_PriceRequest, session : Coincalc_CoinCalcGetCoinPricesSession) throws -> CoinCalc_CoinPriceResponse
  func setusercoin(request : CoinCalc_SetUserCoinRequest, session : Coincalc_CoinCalcSetUserCoinSession) throws -> CoinCalc_SetUserCoinResponse
  func getusercoins(request : CoinCalc_GetUserCoinRequest, session : Coincalc_CoinCalcGetUserCoinsSession) throws -> CoinCalc_GetUserCoinsResponse
}

/// Common properties available in each service session.
internal class Coincalc_CoinCalcSession {
  fileprivate var handler : gRPC.Handler
  internal var requestMetadata : Metadata { return handler.requestMetadata }

  internal var statusCode : Int = 0
  internal var statusMessage : String = "OK"
  internal var initialMetadata : Metadata = Metadata()
  internal var trailingMetadata : Metadata = Metadata()

  fileprivate init(handler:gRPC.Handler) {
    self.handler = handler
  }
}

// GetCoins (Unary)
internal class Coincalc_CoinCalcGetCoinsSession : Coincalc_CoinCalcSession {
  private var provider : Coincalc_CoinCalcProvider

  /// Create a session.
  fileprivate init(handler:gRPC.Handler, provider: Coincalc_CoinCalcProvider) {
    self.provider = provider
    super.init(handler:handler)
  }

  /// Run the session. Internal.
  fileprivate func run(queue:DispatchQueue) throws {
    try handler.receiveMessage(initialMetadata:initialMetadata) {(requestData) in
      if let requestData = requestData {
        let requestMessage = try CoinCalc_CoinListRequest(serializedData:requestData)
        let replyMessage = try self.provider.getcoins(request:requestMessage, session: self)
        try self.handler.sendResponse(message:replyMessage.serializedData(),
                                      statusCode:self.statusCode,
                                      statusMessage:self.statusMessage,
                                      trailingMetadata:self.trailingMetadata)
      }
    }
  }
}

// GetCoinPrices (Unary)
internal class Coincalc_CoinCalcGetCoinPricesSession : Coincalc_CoinCalcSession {
  private var provider : Coincalc_CoinCalcProvider

  /// Create a session.
  fileprivate init(handler:gRPC.Handler, provider: Coincalc_CoinCalcProvider) {
    self.provider = provider
    super.init(handler:handler)
  }

  /// Run the session. Internal.
  fileprivate func run(queue:DispatchQueue) throws {
    try handler.receiveMessage(initialMetadata:initialMetadata) {(requestData) in
      if let requestData = requestData {
        let requestMessage = try CoinCalc_PriceRequest(serializedData:requestData)
        let replyMessage = try self.provider.getcoinprices(request:requestMessage, session: self)
        try self.handler.sendResponse(message:replyMessage.serializedData(),
                                      statusCode:self.statusCode,
                                      statusMessage:self.statusMessage,
                                      trailingMetadata:self.trailingMetadata)
      }
    }
  }
}

// SetUserCoin (Unary)
internal class Coincalc_CoinCalcSetUserCoinSession : Coincalc_CoinCalcSession {
  private var provider : Coincalc_CoinCalcProvider

  /// Create a session.
  fileprivate init(handler:gRPC.Handler, provider: Coincalc_CoinCalcProvider) {
    self.provider = provider
    super.init(handler:handler)
  }

  /// Run the session. Internal.
  fileprivate func run(queue:DispatchQueue) throws {
    try handler.receiveMessage(initialMetadata:initialMetadata) {(requestData) in
      if let requestData = requestData {
        let requestMessage = try CoinCalc_SetUserCoinRequest(serializedData:requestData)
        let replyMessage = try self.provider.setusercoin(request:requestMessage, session: self)
        try self.handler.sendResponse(message:replyMessage.serializedData(),
                                      statusCode:self.statusCode,
                                      statusMessage:self.statusMessage,
                                      trailingMetadata:self.trailingMetadata)
      }
    }
  }
}

// GetUserCoins (Unary)
internal class Coincalc_CoinCalcGetUserCoinsSession : Coincalc_CoinCalcSession {
  private var provider : Coincalc_CoinCalcProvider

  /// Create a session.
  fileprivate init(handler:gRPC.Handler, provider: Coincalc_CoinCalcProvider) {
    self.provider = provider
    super.init(handler:handler)
  }

  /// Run the session. Internal.
  fileprivate func run(queue:DispatchQueue) throws {
    try handler.receiveMessage(initialMetadata:initialMetadata) {(requestData) in
      if let requestData = requestData {
        let requestMessage = try CoinCalc_GetUserCoinRequest(serializedData:requestData)
        let replyMessage = try self.provider.getusercoins(request:requestMessage, session: self)
        try self.handler.sendResponse(message:replyMessage.serializedData(),
                                      statusCode:self.statusCode,
                                      statusMessage:self.statusMessage,
                                      trailingMetadata:self.trailingMetadata)
      }
    }
  }
}


/// Main server for generated service
internal class Coincalc_CoinCalcServer {
  private var address: String
  private var server: gRPC.Server
  private var provider: Coincalc_CoinCalcProvider?

  /// Create a server that accepts insecure connections.
  internal init(address:String,
              provider:Coincalc_CoinCalcProvider) {
    gRPC.initialize()
    self.address = address
    self.provider = provider
    self.server = gRPC.Server(address:address)
  }

  /// Create a server that accepts secure connections.
  internal init?(address:String,
               certificateURL:URL,
               keyURL:URL,
               provider:Coincalc_CoinCalcProvider) {
    gRPC.initialize()
    self.address = address
    self.provider = provider
    guard
      let certificate = try? String(contentsOf: certificateURL, encoding: .utf8),
      let key = try? String(contentsOf: keyURL, encoding: .utf8)
      else {
        return nil
    }
    self.server = gRPC.Server(address:address, key:key, certs:certificate)
  }

  /// Start the server.
  internal func start(queue:DispatchQueue = DispatchQueue.global()) {
    guard let provider = self.provider else {
      fatalError() // the server requires a provider
    }
    server.run {(handler) in
      print("Server received request to " + handler.host
        + " calling " + handler.method
        + " from " + handler.caller
        + " with " + String(describing:handler.requestMetadata) )

      do {
        switch handler.method {
        case "/CoinCalc.CoinCalc/GetCoins":
          try Coincalc_CoinCalcGetCoinsSession(handler:handler, provider:provider).run(queue:queue)
        case "/CoinCalc.CoinCalc/GetCoinPrices":
          try Coincalc_CoinCalcGetCoinPricesSession(handler:handler, provider:provider).run(queue:queue)
        case "/CoinCalc.CoinCalc/SetUserCoin":
          try Coincalc_CoinCalcSetUserCoinSession(handler:handler, provider:provider).run(queue:queue)
        case "/CoinCalc.CoinCalc/GetUserCoins":
          try Coincalc_CoinCalcGetUserCoinsSession(handler:handler, provider:provider).run(queue:queue)
        default:
          break // handle unknown requests
        }
      } catch (let error) {
        print("Server error: \(error)")
      }
    }
  }
}
