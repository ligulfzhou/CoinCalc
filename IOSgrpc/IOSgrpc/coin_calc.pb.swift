// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: proto/coin_calc.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct CoinCalc_CoinListRequest: SwiftProtobuf.Message {
  static let protoMessageName: String = _protobuf_package + ".CoinListRequest"

  var page: Int32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.page)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.page != 0 {
      try visitor.visitSingularInt32Field(value: self.page, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }
}

struct CoinCalc_Coin: SwiftProtobuf.Message {
  static let protoMessageName: String = _protobuf_package + ".Coin"

  var id: String = String()

  var symbol: String = String()

  var name: String = String()

  var priceUsd: String = String()

  var priceBtc: String = String()

  var percentChangeOneHour: String = String()

  var percentChangeOneDay: String = String()

  var percentChangeOneWeek: String = String()

  var marketCapUsd: String = String()

  var oneDayVolumnUsd: String = String()

  var availableSupply: String = String()

  var totalSupply: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.id)
      case 2: try decoder.decodeSingularStringField(value: &self.symbol)
      case 3: try decoder.decodeSingularStringField(value: &self.name)
      case 4: try decoder.decodeSingularStringField(value: &self.priceUsd)
      case 5: try decoder.decodeSingularStringField(value: &self.priceBtc)
      case 6: try decoder.decodeSingularStringField(value: &self.percentChangeOneHour)
      case 7: try decoder.decodeSingularStringField(value: &self.percentChangeOneDay)
      case 8: try decoder.decodeSingularStringField(value: &self.percentChangeOneWeek)
      case 9: try decoder.decodeSingularStringField(value: &self.marketCapUsd)
      case 10: try decoder.decodeSingularStringField(value: &self.oneDayVolumnUsd)
      case 11: try decoder.decodeSingularStringField(value: &self.availableSupply)
      case 12: try decoder.decodeSingularStringField(value: &self.totalSupply)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.symbol.isEmpty {
      try visitor.visitSingularStringField(value: self.symbol, fieldNumber: 2)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 3)
    }
    if !self.priceUsd.isEmpty {
      try visitor.visitSingularStringField(value: self.priceUsd, fieldNumber: 4)
    }
    if !self.priceBtc.isEmpty {
      try visitor.visitSingularStringField(value: self.priceBtc, fieldNumber: 5)
    }
    if !self.percentChangeOneHour.isEmpty {
      try visitor.visitSingularStringField(value: self.percentChangeOneHour, fieldNumber: 6)
    }
    if !self.percentChangeOneDay.isEmpty {
      try visitor.visitSingularStringField(value: self.percentChangeOneDay, fieldNumber: 7)
    }
    if !self.percentChangeOneWeek.isEmpty {
      try visitor.visitSingularStringField(value: self.percentChangeOneWeek, fieldNumber: 8)
    }
    if !self.marketCapUsd.isEmpty {
      try visitor.visitSingularStringField(value: self.marketCapUsd, fieldNumber: 9)
    }
    if !self.oneDayVolumnUsd.isEmpty {
      try visitor.visitSingularStringField(value: self.oneDayVolumnUsd, fieldNumber: 10)
    }
    if !self.availableSupply.isEmpty {
      try visitor.visitSingularStringField(value: self.availableSupply, fieldNumber: 11)
    }
    if !self.totalSupply.isEmpty {
      try visitor.visitSingularStringField(value: self.totalSupply, fieldNumber: 12)
    }
    try unknownFields.traverse(visitor: &visitor)
  }
}

struct CoinCalc_UserCoin: SwiftProtobuf.Message {
  static let protoMessageName: String = _protobuf_package + ".UserCoin"

  var user: String {
    get {return _storage._user}
    set {_uniqueStorage()._user = newValue}
  }

  var symbol: String {
    get {return _storage._symbol}
    set {_uniqueStorage()._symbol = newValue}
  }

  var cnt: String {
    get {return _storage._cnt}
    set {_uniqueStorage()._cnt = newValue}
  }

  var coin: CoinCalc_Coin {
    get {return _storage._coin ?? CoinCalc_Coin()}
    set {_uniqueStorage()._coin = newValue}
  }
  /// Returns true if `coin` has been explicitly set.
  var hasCoin: Bool {return _storage._coin != nil}
  /// Clears the value of `coin`. Subsequent reads from it will return its default value.
  mutating func clearCoin() {_storage._coin = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularStringField(value: &_storage._user)
        case 2: try decoder.decodeSingularStringField(value: &_storage._symbol)
        case 3: try decoder.decodeSingularStringField(value: &_storage._cnt)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._coin)
        default: break
        }
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._user.isEmpty {
        try visitor.visitSingularStringField(value: _storage._user, fieldNumber: 1)
      }
      if !_storage._symbol.isEmpty {
        try visitor.visitSingularStringField(value: _storage._symbol, fieldNumber: 2)
      }
      if !_storage._cnt.isEmpty {
        try visitor.visitSingularStringField(value: _storage._cnt, fieldNumber: 3)
      }
      if let v = _storage._coin {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct CoinCalc_CoinListResponse: SwiftProtobuf.Message {
  static let protoMessageName: String = _protobuf_package + ".CoinListResponse"

  var coins: [CoinCalc_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.coins)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.coins.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.coins, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }
}

struct CoinCalc_PriceRequest: SwiftProtobuf.Message {
  static let protoMessageName: String = _protobuf_package + ".PriceRequest"

  var symbols: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedStringField(value: &self.symbols)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.symbols.isEmpty {
      try visitor.visitRepeatedStringField(value: self.symbols, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }
}

struct CoinCalc_CoinPriceResponse: SwiftProtobuf.Message {
  static let protoMessageName: String = _protobuf_package + ".CoinPriceResponse"

  var coins: [CoinCalc_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.coins)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.coins.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.coins, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }
}

struct CoinCalc_SetUserCoinRequest: SwiftProtobuf.Message {
  static let protoMessageName: String = _protobuf_package + ".SetUserCoinRequest"

  var uc: CoinCalc_UserCoin {
    get {return _storage._uc ?? CoinCalc_UserCoin()}
    set {_uniqueStorage()._uc = newValue}
  }
  /// Returns true if `uc` has been explicitly set.
  var hasUc: Bool {return _storage._uc != nil}
  /// Clears the value of `uc`. Subsequent reads from it will return its default value.
  mutating func clearUc() {_storage._uc = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._uc)
        default: break
        }
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._uc {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct CoinCalc_SetUserCoinResponse: SwiftProtobuf.Message {
  static let protoMessageName: String = _protobuf_package + ".SetUserCoinResponse"

  var uc: CoinCalc_UserCoin {
    get {return _storage._uc ?? CoinCalc_UserCoin()}
    set {_uniqueStorage()._uc = newValue}
  }
  /// Returns true if `uc` has been explicitly set.
  var hasUc: Bool {return _storage._uc != nil}
  /// Clears the value of `uc`. Subsequent reads from it will return its default value.
  mutating func clearUc() {_storage._uc = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._uc)
        default: break
        }
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._uc {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct CoinCalc_GetUserCoinRequest: SwiftProtobuf.Message {
  static let protoMessageName: String = _protobuf_package + ".GetUserCoinRequest"

  var user: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.user)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.user.isEmpty {
      try visitor.visitSingularStringField(value: self.user, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }
}

struct CoinCalc_GetUserCoinsResponse: SwiftProtobuf.Message {
  static let protoMessageName: String = _protobuf_package + ".GetUserCoinsResponse"

  var ucs: [CoinCalc_UserCoin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.ucs)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.ucs.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.ucs, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "CoinCalc"

extension CoinCalc_CoinListRequest: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "page"),
  ]

  func _protobuf_generated_isEqualTo(other: CoinCalc_CoinListRequest) -> Bool {
    if self.page != other.page {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension CoinCalc_Coin: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "symbol"),
    3: .same(proto: "name"),
    4: .standard(proto: "price_usd"),
    5: .standard(proto: "price_btc"),
    6: .standard(proto: "percent_change_one_hour"),
    7: .standard(proto: "percent_change_one_day"),
    8: .standard(proto: "percent_change_one_week"),
    9: .standard(proto: "market_cap_usd"),
    10: .standard(proto: "one_day_volumn_usd"),
    11: .standard(proto: "available_supply"),
    12: .standard(proto: "total_supply"),
  ]

  func _protobuf_generated_isEqualTo(other: CoinCalc_Coin) -> Bool {
    if self.id != other.id {return false}
    if self.symbol != other.symbol {return false}
    if self.name != other.name {return false}
    if self.priceUsd != other.priceUsd {return false}
    if self.priceBtc != other.priceBtc {return false}
    if self.percentChangeOneHour != other.percentChangeOneHour {return false}
    if self.percentChangeOneDay != other.percentChangeOneDay {return false}
    if self.percentChangeOneWeek != other.percentChangeOneWeek {return false}
    if self.marketCapUsd != other.marketCapUsd {return false}
    if self.oneDayVolumnUsd != other.oneDayVolumnUsd {return false}
    if self.availableSupply != other.availableSupply {return false}
    if self.totalSupply != other.totalSupply {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension CoinCalc_UserCoin: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "user"),
    2: .same(proto: "symbol"),
    3: .same(proto: "cnt"),
    4: .same(proto: "coin"),
  ]

  fileprivate class _StorageClass {
    var _user: String = String()
    var _symbol: String = String()
    var _cnt: String = String()
    var _coin: CoinCalc_Coin? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _user = source._user
      _symbol = source._symbol
      _cnt = source._cnt
      _coin = source._coin
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  func _protobuf_generated_isEqualTo(other: CoinCalc_UserCoin) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._user != other_storage._user {return false}
        if _storage._symbol != other_storage._symbol {return false}
        if _storage._cnt != other_storage._cnt {return false}
        if _storage._coin != other_storage._coin {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension CoinCalc_CoinListResponse: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "coins"),
  ]

  func _protobuf_generated_isEqualTo(other: CoinCalc_CoinListResponse) -> Bool {
    if self.coins != other.coins {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension CoinCalc_PriceRequest: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "symbols"),
  ]

  func _protobuf_generated_isEqualTo(other: CoinCalc_PriceRequest) -> Bool {
    if self.symbols != other.symbols {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension CoinCalc_CoinPriceResponse: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "coins"),
  ]

  func _protobuf_generated_isEqualTo(other: CoinCalc_CoinPriceResponse) -> Bool {
    if self.coins != other.coins {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension CoinCalc_SetUserCoinRequest: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "uc"),
  ]

  fileprivate class _StorageClass {
    var _uc: CoinCalc_UserCoin? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _uc = source._uc
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  func _protobuf_generated_isEqualTo(other: CoinCalc_SetUserCoinRequest) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._uc != other_storage._uc {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension CoinCalc_SetUserCoinResponse: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "uc"),
  ]

  fileprivate class _StorageClass {
    var _uc: CoinCalc_UserCoin? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _uc = source._uc
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  func _protobuf_generated_isEqualTo(other: CoinCalc_SetUserCoinResponse) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._uc != other_storage._uc {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension CoinCalc_GetUserCoinRequest: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "user"),
  ]

  func _protobuf_generated_isEqualTo(other: CoinCalc_GetUserCoinRequest) -> Bool {
    if self.user != other.user {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension CoinCalc_GetUserCoinsResponse: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "ucs"),
  ]

  func _protobuf_generated_isEqualTo(other: CoinCalc_GetUserCoinsResponse) -> Bool {
    if self.ucs != other.ucs {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
