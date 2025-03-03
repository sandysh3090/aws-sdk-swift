// Code generated by smithy-swift-codegen. DO NOT EDIT!
import AWSClientRuntime
import ClientRuntime

extension ClientLimitExceededException {
    public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) async throws {
        if let data = try await httpResponse.body.readData(),
            let responseDecoder = decoder {
            let output: ClientLimitExceededExceptionBody = try responseDecoder.decode(responseBody: data)
            self.properties.message = output.message
        } else {
            self.properties.message = nil
        }
        self.httpResponse = httpResponse
        self.requestID = requestID
        self.message = message
    }
}

/// Kinesis Video Streams has throttled the request because you have exceeded the limit of allowed client calls. Try making the call later.
public struct ClientLimitExceededException: ClientRuntime.ModeledError, AWSClientRuntime.AWSServiceError, ClientRuntime.HTTPError, Swift.Error {

    public struct Properties {
        public internal(set) var message: Swift.String? = nil
    }

    public internal(set) var properties = Properties()
    public static var typeName: Swift.String { "ClientLimitExceededException" }
    public static var fault: ErrorFault { .client }
    public static var isRetryable: Swift.Bool { false }
    public static var isThrottling: Swift.Bool { false }
    public internal(set) var httpResponse = HttpResponse()
    public internal(set) var message: Swift.String?
    public internal(set) var requestID: Swift.String?

    public init(
        message: Swift.String? = nil
    )
    {
        self.properties.message = message
    }
}

struct ClientLimitExceededExceptionBody: Swift.Equatable {
    let message: Swift.String?
}

extension ClientLimitExceededExceptionBody: Swift.Decodable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case message = "Message"
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let messageDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .message)
        message = messageDecoded
    }
}

extension ConnectionLimitExceededException {
    public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) async throws {
        if let data = try await httpResponse.body.readData(),
            let responseDecoder = decoder {
            let output: ConnectionLimitExceededExceptionBody = try responseDecoder.decode(responseBody: data)
            self.properties.message = output.message
        } else {
            self.properties.message = nil
        }
        self.httpResponse = httpResponse
        self.requestID = requestID
        self.message = message
    }
}

/// Kinesis Video Streams has throttled the request because you have exceeded the limit of allowed client connections.
public struct ConnectionLimitExceededException: ClientRuntime.ModeledError, AWSClientRuntime.AWSServiceError, ClientRuntime.HTTPError, Swift.Error {

    public struct Properties {
        public internal(set) var message: Swift.String? = nil
    }

    public internal(set) var properties = Properties()
    public static var typeName: Swift.String { "ConnectionLimitExceededException" }
    public static var fault: ErrorFault { .client }
    public static var isRetryable: Swift.Bool { false }
    public static var isThrottling: Swift.Bool { false }
    public internal(set) var httpResponse = HttpResponse()
    public internal(set) var message: Swift.String?
    public internal(set) var requestID: Swift.String?

    public init(
        message: Swift.String? = nil
    )
    {
        self.properties.message = message
    }
}

struct ConnectionLimitExceededExceptionBody: Swift.Equatable {
    let message: Swift.String?
}

extension ConnectionLimitExceededExceptionBody: Swift.Decodable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case message = "Message"
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let messageDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .message)
        message = messageDecoded
    }
}

extension GetMediaInput: Swift.Encodable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case startSelector = "StartSelector"
        case streamARN = "StreamARN"
        case streamName = "StreamName"
    }

    public func encode(to encoder: Swift.Encoder) throws {
        var encodeContainer = encoder.container(keyedBy: CodingKeys.self)
        if let startSelector = self.startSelector {
            try encodeContainer.encode(startSelector, forKey: .startSelector)
        }
        if let streamARN = self.streamARN {
            try encodeContainer.encode(streamARN, forKey: .streamARN)
        }
        if let streamName = self.streamName {
            try encodeContainer.encode(streamName, forKey: .streamName)
        }
    }
}

extension GetMediaInput: ClientRuntime.URLPathProvider {
    public var urlPath: Swift.String? {
        return "/getMedia"
    }
}

public struct GetMediaInput: Swift.Equatable {
    /// Identifies the starting chunk to get from the specified stream.
    /// This member is required.
    public var startSelector: KinesisVideoMediaClientTypes.StartSelector?
    /// The ARN of the stream from where you want to get the media content. If you don't specify the streamARN, you must specify the streamName.
    public var streamARN: Swift.String?
    /// The Kinesis video stream name from where you want to get the media content. If you don't specify the streamName, you must specify the streamARN.
    public var streamName: Swift.String?

    public init(
        startSelector: KinesisVideoMediaClientTypes.StartSelector? = nil,
        streamARN: Swift.String? = nil,
        streamName: Swift.String? = nil
    )
    {
        self.startSelector = startSelector
        self.streamARN = streamARN
        self.streamName = streamName
    }
}

struct GetMediaInputBody: Swift.Equatable {
    let streamName: Swift.String?
    let streamARN: Swift.String?
    let startSelector: KinesisVideoMediaClientTypes.StartSelector?
}

extension GetMediaInputBody: Swift.Decodable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case startSelector = "StartSelector"
        case streamARN = "StreamARN"
        case streamName = "StreamName"
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let streamNameDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .streamName)
        streamName = streamNameDecoded
        let streamARNDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .streamARN)
        streamARN = streamARNDecoded
        let startSelectorDecoded = try containerValues.decodeIfPresent(KinesisVideoMediaClientTypes.StartSelector.self, forKey: .startSelector)
        startSelector = startSelectorDecoded
    }
}

public enum GetMediaOutputError: ClientRuntime.HttpResponseErrorBinding {
    public static func makeError(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) async throws -> Swift.Error {
        let restJSONError = try await AWSClientRuntime.RestJSONError(httpResponse: httpResponse)
        let requestID = httpResponse.requestId
        switch restJSONError.errorType {
            case "ClientLimitExceededException": return try await ClientLimitExceededException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            case "ConnectionLimitExceededException": return try await ConnectionLimitExceededException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            case "InvalidArgumentException": return try await InvalidArgumentException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            case "InvalidEndpointException": return try await InvalidEndpointException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            case "NotAuthorizedException": return try await NotAuthorizedException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            case "ResourceNotFoundException": return try await ResourceNotFoundException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            default: return try await AWSClientRuntime.UnknownAWSHTTPServiceError.makeError(httpResponse: httpResponse, message: restJSONError.errorMessage, requestID: requestID, typeName: restJSONError.errorType)
        }
    }
}

extension GetMediaOutputResponse: ClientRuntime.HttpResponseBinding {
    public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) async throws {
        if let contentTypeHeaderValue = httpResponse.headers.value(for: "Content-Type") {
            self.contentType = contentTypeHeaderValue
        } else {
            self.contentType = nil
        }
        switch httpResponse.body {
        case .data(let data):
            self.payload = .data(data)
        case .stream(let stream):
            self.payload = .stream(stream)
        case .none:
            self.payload = nil
        }
    }
}

public struct GetMediaOutputResponse: Swift.Equatable {
    /// The content type of the requested media.
    public var contentType: Swift.String?
    /// The payload Kinesis Video Streams returns is a sequence of chunks from the specified stream. For information about the chunks, see . The chunks that Kinesis Video Streams returns in the GetMedia call also include the following additional Matroska (MKV) tags:
    ///
    /// * AWS_KINESISVIDEO_CONTINUATION_TOKEN (UTF-8 string) - In the event your GetMedia call terminates, you can use this continuation token in your next request to get the next chunk where the last request terminated.
    ///
    /// * AWS_KINESISVIDEO_MILLIS_BEHIND_NOW (UTF-8 string) - Client applications can use this tag value to determine how far behind the chunk returned in the response is from the latest chunk on the stream.
    ///
    /// * AWS_KINESISVIDEO_FRAGMENT_NUMBER - Fragment number returned in the chunk.
    ///
    /// * AWS_KINESISVIDEO_SERVER_TIMESTAMP - Server timestamp of the fragment.
    ///
    /// * AWS_KINESISVIDEO_PRODUCER_TIMESTAMP - Producer timestamp of the fragment.
    ///
    ///
    /// The following tags will be present if an error occurs:
    ///
    /// * AWS_KINESISVIDEO_ERROR_CODE - String description of an error that caused GetMedia to stop.
    ///
    /// * AWS_KINESISVIDEO_ERROR_ID: Integer code of the error.
    ///
    ///
    /// The error codes are as follows:
    ///
    /// * 3002 - Error writing to the stream
    ///
    /// * 4000 - Requested fragment is not found
    ///
    /// * 4500 - Access denied for the stream's KMS key
    ///
    /// * 4501 - Stream's KMS key is disabled
    ///
    /// * 4502 - Validation error on the stream's KMS key
    ///
    /// * 4503 - KMS key specified in the stream is unavailable
    ///
    /// * 4504 - Invalid usage of the KMS key specified in the stream
    ///
    /// * 4505 - Invalid state of the KMS key specified in the stream
    ///
    /// * 4506 - Unable to find the KMS key specified in the stream
    ///
    /// * 5000 - Internal error
    public var payload: ClientRuntime.ByteStream?

    public init(
        contentType: Swift.String? = nil,
        payload: ClientRuntime.ByteStream? = nil
    )
    {
        self.contentType = contentType
        self.payload = payload
    }
}

struct GetMediaOutputResponseBody: Swift.Equatable {
    let payload: ClientRuntime.ByteStream?
}

extension GetMediaOutputResponseBody: Swift.Decodable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case payload = "Payload"
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let payloadDecoded = try containerValues.decodeIfPresent(ClientRuntime.ByteStream.self, forKey: .payload)
        payload = payloadDecoded
    }
}

extension InvalidArgumentException {
    public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) async throws {
        if let data = try await httpResponse.body.readData(),
            let responseDecoder = decoder {
            let output: InvalidArgumentExceptionBody = try responseDecoder.decode(responseBody: data)
            self.properties.message = output.message
        } else {
            self.properties.message = nil
        }
        self.httpResponse = httpResponse
        self.requestID = requestID
        self.message = message
    }
}

/// The value for this input parameter is invalid.
public struct InvalidArgumentException: ClientRuntime.ModeledError, AWSClientRuntime.AWSServiceError, ClientRuntime.HTTPError, Swift.Error {

    public struct Properties {
        public internal(set) var message: Swift.String? = nil
    }

    public internal(set) var properties = Properties()
    public static var typeName: Swift.String { "InvalidArgumentException" }
    public static var fault: ErrorFault { .client }
    public static var isRetryable: Swift.Bool { false }
    public static var isThrottling: Swift.Bool { false }
    public internal(set) var httpResponse = HttpResponse()
    public internal(set) var message: Swift.String?
    public internal(set) var requestID: Swift.String?

    public init(
        message: Swift.String? = nil
    )
    {
        self.properties.message = message
    }
}

struct InvalidArgumentExceptionBody: Swift.Equatable {
    let message: Swift.String?
}

extension InvalidArgumentExceptionBody: Swift.Decodable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case message = "Message"
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let messageDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .message)
        message = messageDecoded
    }
}

extension InvalidEndpointException {
    public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) async throws {
        if let data = try await httpResponse.body.readData(),
            let responseDecoder = decoder {
            let output: InvalidEndpointExceptionBody = try responseDecoder.decode(responseBody: data)
            self.properties.message = output.message
        } else {
            self.properties.message = nil
        }
        self.httpResponse = httpResponse
        self.requestID = requestID
        self.message = message
    }
}

/// Status Code: 400, Caller used wrong endpoint to write data to a stream. On receiving such an exception, the user must call GetDataEndpoint with AccessMode set to "READ" and use the endpoint Kinesis Video returns in the next GetMedia call.
public struct InvalidEndpointException: ClientRuntime.ModeledError, AWSClientRuntime.AWSServiceError, ClientRuntime.HTTPError, Swift.Error {

    public struct Properties {
        public internal(set) var message: Swift.String? = nil
    }

    public internal(set) var properties = Properties()
    public static var typeName: Swift.String { "InvalidEndpointException" }
    public static var fault: ErrorFault { .client }
    public static var isRetryable: Swift.Bool { false }
    public static var isThrottling: Swift.Bool { false }
    public internal(set) var httpResponse = HttpResponse()
    public internal(set) var message: Swift.String?
    public internal(set) var requestID: Swift.String?

    public init(
        message: Swift.String? = nil
    )
    {
        self.properties.message = message
    }
}

struct InvalidEndpointExceptionBody: Swift.Equatable {
    let message: Swift.String?
}

extension InvalidEndpointExceptionBody: Swift.Decodable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case message = "Message"
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let messageDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .message)
        message = messageDecoded
    }
}

extension NotAuthorizedException {
    public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) async throws {
        if let data = try await httpResponse.body.readData(),
            let responseDecoder = decoder {
            let output: NotAuthorizedExceptionBody = try responseDecoder.decode(responseBody: data)
            self.properties.message = output.message
        } else {
            self.properties.message = nil
        }
        self.httpResponse = httpResponse
        self.requestID = requestID
        self.message = message
    }
}

/// Status Code: 403, The caller is not authorized to perform an operation on the given stream, or the token has expired.
public struct NotAuthorizedException: ClientRuntime.ModeledError, AWSClientRuntime.AWSServiceError, ClientRuntime.HTTPError, Swift.Error {

    public struct Properties {
        public internal(set) var message: Swift.String? = nil
    }

    public internal(set) var properties = Properties()
    public static var typeName: Swift.String { "NotAuthorizedException" }
    public static var fault: ErrorFault { .client }
    public static var isRetryable: Swift.Bool { false }
    public static var isThrottling: Swift.Bool { false }
    public internal(set) var httpResponse = HttpResponse()
    public internal(set) var message: Swift.String?
    public internal(set) var requestID: Swift.String?

    public init(
        message: Swift.String? = nil
    )
    {
        self.properties.message = message
    }
}

struct NotAuthorizedExceptionBody: Swift.Equatable {
    let message: Swift.String?
}

extension NotAuthorizedExceptionBody: Swift.Decodable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case message = "Message"
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let messageDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .message)
        message = messageDecoded
    }
}

extension ResourceNotFoundException {
    public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) async throws {
        if let data = try await httpResponse.body.readData(),
            let responseDecoder = decoder {
            let output: ResourceNotFoundExceptionBody = try responseDecoder.decode(responseBody: data)
            self.properties.message = output.message
        } else {
            self.properties.message = nil
        }
        self.httpResponse = httpResponse
        self.requestID = requestID
        self.message = message
    }
}

/// Status Code: 404, The stream with the given name does not exist.
public struct ResourceNotFoundException: ClientRuntime.ModeledError, AWSClientRuntime.AWSServiceError, ClientRuntime.HTTPError, Swift.Error {

    public struct Properties {
        public internal(set) var message: Swift.String? = nil
    }

    public internal(set) var properties = Properties()
    public static var typeName: Swift.String { "ResourceNotFoundException" }
    public static var fault: ErrorFault { .client }
    public static var isRetryable: Swift.Bool { false }
    public static var isThrottling: Swift.Bool { false }
    public internal(set) var httpResponse = HttpResponse()
    public internal(set) var message: Swift.String?
    public internal(set) var requestID: Swift.String?

    public init(
        message: Swift.String? = nil
    )
    {
        self.properties.message = message
    }
}

struct ResourceNotFoundExceptionBody: Swift.Equatable {
    let message: Swift.String?
}

extension ResourceNotFoundExceptionBody: Swift.Decodable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case message = "Message"
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let messageDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .message)
        message = messageDecoded
    }
}

extension KinesisVideoMediaClientTypes.StartSelector: Swift.Codable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case afterFragmentNumber = "AfterFragmentNumber"
        case continuationToken = "ContinuationToken"
        case startSelectorType = "StartSelectorType"
        case startTimestamp = "StartTimestamp"
    }

    public func encode(to encoder: Swift.Encoder) throws {
        var encodeContainer = encoder.container(keyedBy: CodingKeys.self)
        if let afterFragmentNumber = self.afterFragmentNumber {
            try encodeContainer.encode(afterFragmentNumber, forKey: .afterFragmentNumber)
        }
        if let continuationToken = self.continuationToken {
            try encodeContainer.encode(continuationToken, forKey: .continuationToken)
        }
        if let startSelectorType = self.startSelectorType {
            try encodeContainer.encode(startSelectorType.rawValue, forKey: .startSelectorType)
        }
        if let startTimestamp = self.startTimestamp {
            try encodeContainer.encodeTimestamp(startTimestamp, format: .epochSeconds, forKey: .startTimestamp)
        }
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let startSelectorTypeDecoded = try containerValues.decodeIfPresent(KinesisVideoMediaClientTypes.StartSelectorType.self, forKey: .startSelectorType)
        startSelectorType = startSelectorTypeDecoded
        let afterFragmentNumberDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .afterFragmentNumber)
        afterFragmentNumber = afterFragmentNumberDecoded
        let startTimestampDecoded = try containerValues.decodeTimestampIfPresent(.epochSeconds, forKey: .startTimestamp)
        startTimestamp = startTimestampDecoded
        let continuationTokenDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .continuationToken)
        continuationToken = continuationTokenDecoded
    }
}

extension KinesisVideoMediaClientTypes {
    /// Identifies the chunk on the Kinesis video stream where you want the GetMedia API to start returning media data. You have the following options to identify the starting chunk:
    ///
    /// * Choose the latest (or oldest) chunk.
    ///
    /// * Identify a specific chunk. You can identify a specific chunk either by providing a fragment number or timestamp (server or producer).
    ///
    /// * Each chunk's metadata includes a continuation token as a Matroska (MKV) tag (AWS_KINESISVIDEO_CONTINUATION_TOKEN). If your previous GetMedia request terminated, you can use this tag value in your next GetMedia request. The API then starts returning chunks starting where the last API ended.
    public struct StartSelector: Swift.Equatable {
        /// Specifies the fragment number from where you want the GetMedia API to start returning the fragments.
        public var afterFragmentNumber: Swift.String?
        /// Continuation token that Kinesis Video Streams returned in the previous GetMedia response. The GetMedia API then starts with the chunk identified by the continuation token.
        public var continuationToken: Swift.String?
        /// Identifies the fragment on the Kinesis video stream where you want to start getting the data from.
        ///
        /// * NOW - Start with the latest chunk on the stream.
        ///
        /// * EARLIEST - Start with earliest available chunk on the stream.
        ///
        /// * FRAGMENT_NUMBER - Start with the chunk after a specific fragment. You must also specify the AfterFragmentNumber parameter.
        ///
        /// * PRODUCER_TIMESTAMP or SERVER_TIMESTAMP - Start with the chunk containing a fragment with the specified producer or server timestamp. You specify the timestamp by adding StartTimestamp.
        ///
        /// * CONTINUATION_TOKEN - Read using the specified continuation token.
        ///
        ///
        /// If you choose the NOW, EARLIEST, or CONTINUATION_TOKEN as the startSelectorType, you don't provide any additional information in the startSelector.
        /// This member is required.
        public var startSelectorType: KinesisVideoMediaClientTypes.StartSelectorType?
        /// A timestamp value. This value is required if you choose the PRODUCER_TIMESTAMP or the SERVER_TIMESTAMP as the startSelectorType. The GetMedia API then starts with the chunk containing the fragment that has the specified timestamp.
        public var startTimestamp: ClientRuntime.Date?

        public init(
            afterFragmentNumber: Swift.String? = nil,
            continuationToken: Swift.String? = nil,
            startSelectorType: KinesisVideoMediaClientTypes.StartSelectorType? = nil,
            startTimestamp: ClientRuntime.Date? = nil
        )
        {
            self.afterFragmentNumber = afterFragmentNumber
            self.continuationToken = continuationToken
            self.startSelectorType = startSelectorType
            self.startTimestamp = startTimestamp
        }
    }

}

extension KinesisVideoMediaClientTypes {
    public enum StartSelectorType: Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Codable, Swift.Hashable {
        case continuationToken
        case earliest
        case fragmentNumber
        case now
        case producerTimestamp
        case serverTimestamp
        case sdkUnknown(Swift.String)

        public static var allCases: [StartSelectorType] {
            return [
                .continuationToken,
                .earliest,
                .fragmentNumber,
                .now,
                .producerTimestamp,
                .serverTimestamp,
                .sdkUnknown("")
            ]
        }
        public init?(rawValue: Swift.String) {
            let value = Self.allCases.first(where: { $0.rawValue == rawValue })
            self = value ?? Self.sdkUnknown(rawValue)
        }
        public var rawValue: Swift.String {
            switch self {
            case .continuationToken: return "CONTINUATION_TOKEN"
            case .earliest: return "EARLIEST"
            case .fragmentNumber: return "FRAGMENT_NUMBER"
            case .now: return "NOW"
            case .producerTimestamp: return "PRODUCER_TIMESTAMP"
            case .serverTimestamp: return "SERVER_TIMESTAMP"
            case let .sdkUnknown(s): return s
            }
        }
        public init(from decoder: Swift.Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(RawValue.self)
            self = StartSelectorType(rawValue: rawValue) ?? StartSelectorType.sdkUnknown(rawValue)
        }
    }
}
