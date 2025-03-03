// Code generated by smithy-swift-codegen. DO NOT EDIT!
import AWSClientRuntime
import ClientRuntime

extension SSOClientTypes.AccountInfo: Swift.Codable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case accountId
        case accountName
        case emailAddress
    }

    public func encode(to encoder: Swift.Encoder) throws {
        var encodeContainer = encoder.container(keyedBy: CodingKeys.self)
        if let accountId = self.accountId {
            try encodeContainer.encode(accountId, forKey: .accountId)
        }
        if let accountName = self.accountName {
            try encodeContainer.encode(accountName, forKey: .accountName)
        }
        if let emailAddress = self.emailAddress {
            try encodeContainer.encode(emailAddress, forKey: .emailAddress)
        }
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let accountIdDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .accountId)
        accountId = accountIdDecoded
        let accountNameDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .accountName)
        accountName = accountNameDecoded
        let emailAddressDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .emailAddress)
        emailAddress = emailAddressDecoded
    }
}

extension SSOClientTypes {
    /// Provides information about your AWS account.
    public struct AccountInfo: Swift.Equatable {
        /// The identifier of the AWS account that is assigned to the user.
        public var accountId: Swift.String?
        /// The display name of the AWS account that is assigned to the user.
        public var accountName: Swift.String?
        /// The email address of the AWS account that is assigned to the user.
        public var emailAddress: Swift.String?

        public init(
            accountId: Swift.String? = nil,
            accountName: Swift.String? = nil,
            emailAddress: Swift.String? = nil
        )
        {
            self.accountId = accountId
            self.accountName = accountName
            self.emailAddress = emailAddress
        }
    }

}

extension GetRoleCredentialsInput: Swift.CustomDebugStringConvertible {
    public var debugDescription: Swift.String {
        "GetRoleCredentialsInput(accountId: \(Swift.String(describing: accountId)), roleName: \(Swift.String(describing: roleName)), accessToken: \"CONTENT_REDACTED\")"}
}

extension GetRoleCredentialsInput: ClientRuntime.HeaderProvider {
    public var headers: ClientRuntime.Headers {
        var items = ClientRuntime.Headers()
        if let accessToken = accessToken {
            items.add(Header(name: "x-amz-sso_bearer_token", value: Swift.String(accessToken)))
        }
        return items
    }
}

extension GetRoleCredentialsInput: ClientRuntime.QueryItemProvider {
    public var queryItems: [ClientRuntime.URLQueryItem] {
        get throws {
            var items = [ClientRuntime.URLQueryItem]()
            guard let accountId = accountId else {
                let message = "Creating a URL Query Item failed. accountId is required and must not be nil."
                throw ClientRuntime.ClientError.unknownError(message)
            }
            let accountIdQueryItem = ClientRuntime.URLQueryItem(name: "account_id".urlPercentEncoding(), value: Swift.String(accountId).urlPercentEncoding())
            items.append(accountIdQueryItem)
            guard let roleName = roleName else {
                let message = "Creating a URL Query Item failed. roleName is required and must not be nil."
                throw ClientRuntime.ClientError.unknownError(message)
            }
            let roleNameQueryItem = ClientRuntime.URLQueryItem(name: "role_name".urlPercentEncoding(), value: Swift.String(roleName).urlPercentEncoding())
            items.append(roleNameQueryItem)
            return items
        }
    }
}

extension GetRoleCredentialsInput: ClientRuntime.URLPathProvider {
    public var urlPath: Swift.String? {
        return "/federation/credentials"
    }
}

public struct GetRoleCredentialsInput: Swift.Equatable {
    /// The token issued by the CreateToken API call. For more information, see [CreateToken](https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/API_CreateToken.html) in the IAM Identity Center OIDC API Reference Guide.
    /// This member is required.
    public var accessToken: Swift.String?
    /// The identifier for the AWS account that is assigned to the user.
    /// This member is required.
    public var accountId: Swift.String?
    /// The friendly name of the role that is assigned to the user.
    /// This member is required.
    public var roleName: Swift.String?

    public init(
        accessToken: Swift.String? = nil,
        accountId: Swift.String? = nil,
        roleName: Swift.String? = nil
    )
    {
        self.accessToken = accessToken
        self.accountId = accountId
        self.roleName = roleName
    }
}

struct GetRoleCredentialsInputBody: Swift.Equatable {
}

extension GetRoleCredentialsInputBody: Swift.Decodable {

    public init(from decoder: Swift.Decoder) throws {
    }
}

public enum GetRoleCredentialsOutputError: ClientRuntime.HttpResponseErrorBinding {
    public static func makeError(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) async throws -> Swift.Error {
        let restJSONError = try await AWSClientRuntime.RestJSONError(httpResponse: httpResponse)
        let requestID = httpResponse.requestId
        switch restJSONError.errorType {
            case "InvalidRequestException": return try await InvalidRequestException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            case "ResourceNotFoundException": return try await ResourceNotFoundException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            case "TooManyRequestsException": return try await TooManyRequestsException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            case "UnauthorizedException": return try await UnauthorizedException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            default: return try await AWSClientRuntime.UnknownAWSHTTPServiceError.makeError(httpResponse: httpResponse, message: restJSONError.errorMessage, requestID: requestID, typeName: restJSONError.errorType)
        }
    }
}

extension GetRoleCredentialsOutputResponse: ClientRuntime.HttpResponseBinding {
    public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) async throws {
        if let data = try await httpResponse.body.readData(),
            let responseDecoder = decoder {
            let output: GetRoleCredentialsOutputResponseBody = try responseDecoder.decode(responseBody: data)
            self.roleCredentials = output.roleCredentials
        } else {
            self.roleCredentials = nil
        }
    }
}

public struct GetRoleCredentialsOutputResponse: Swift.Equatable {
    /// The credentials for the role that is assigned to the user.
    public var roleCredentials: SSOClientTypes.RoleCredentials?

    public init(
        roleCredentials: SSOClientTypes.RoleCredentials? = nil
    )
    {
        self.roleCredentials = roleCredentials
    }
}

struct GetRoleCredentialsOutputResponseBody: Swift.Equatable {
    let roleCredentials: SSOClientTypes.RoleCredentials?
}

extension GetRoleCredentialsOutputResponseBody: Swift.Decodable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case roleCredentials
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let roleCredentialsDecoded = try containerValues.decodeIfPresent(SSOClientTypes.RoleCredentials.self, forKey: .roleCredentials)
        roleCredentials = roleCredentialsDecoded
    }
}

extension InvalidRequestException {
    public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) async throws {
        if let data = try await httpResponse.body.readData(),
            let responseDecoder = decoder {
            let output: InvalidRequestExceptionBody = try responseDecoder.decode(responseBody: data)
            self.properties.message = output.message
        } else {
            self.properties.message = nil
        }
        self.httpResponse = httpResponse
        self.requestID = requestID
        self.message = message
    }
}

/// Indicates that a problem occurred with the input to the request. For example, a required parameter might be missing or out of range.
public struct InvalidRequestException: ClientRuntime.ModeledError, AWSClientRuntime.AWSServiceError, ClientRuntime.HTTPError, Swift.Error {

    public struct Properties {
        public internal(set) var message: Swift.String? = nil
    }

    public internal(set) var properties = Properties()
    public static var typeName: Swift.String { "InvalidRequestException" }
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

struct InvalidRequestExceptionBody: Swift.Equatable {
    let message: Swift.String?
}

extension InvalidRequestExceptionBody: Swift.Decodable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case message
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let messageDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .message)
        message = messageDecoded
    }
}

extension ListAccountRolesInput: Swift.CustomDebugStringConvertible {
    public var debugDescription: Swift.String {
        "ListAccountRolesInput(accountId: \(Swift.String(describing: accountId)), maxResults: \(Swift.String(describing: maxResults)), nextToken: \(Swift.String(describing: nextToken)), accessToken: \"CONTENT_REDACTED\")"}
}

extension ListAccountRolesInput: ClientRuntime.HeaderProvider {
    public var headers: ClientRuntime.Headers {
        var items = ClientRuntime.Headers()
        if let accessToken = accessToken {
            items.add(Header(name: "x-amz-sso_bearer_token", value: Swift.String(accessToken)))
        }
        return items
    }
}

extension ListAccountRolesInput: ClientRuntime.QueryItemProvider {
    public var queryItems: [ClientRuntime.URLQueryItem] {
        get throws {
            var items = [ClientRuntime.URLQueryItem]()
            guard let accountId = accountId else {
                let message = "Creating a URL Query Item failed. accountId is required and must not be nil."
                throw ClientRuntime.ClientError.unknownError(message)
            }
            let accountIdQueryItem = ClientRuntime.URLQueryItem(name: "account_id".urlPercentEncoding(), value: Swift.String(accountId).urlPercentEncoding())
            items.append(accountIdQueryItem)
            if let nextToken = nextToken {
                let nextTokenQueryItem = ClientRuntime.URLQueryItem(name: "next_token".urlPercentEncoding(), value: Swift.String(nextToken).urlPercentEncoding())
                items.append(nextTokenQueryItem)
            }
            if let maxResults = maxResults {
                let maxResultsQueryItem = ClientRuntime.URLQueryItem(name: "max_result".urlPercentEncoding(), value: Swift.String(maxResults).urlPercentEncoding())
                items.append(maxResultsQueryItem)
            }
            return items
        }
    }
}

extension ListAccountRolesInput: ClientRuntime.URLPathProvider {
    public var urlPath: Swift.String? {
        return "/assignment/roles"
    }
}

public struct ListAccountRolesInput: Swift.Equatable {
    /// The token issued by the CreateToken API call. For more information, see [CreateToken](https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/API_CreateToken.html) in the IAM Identity Center OIDC API Reference Guide.
    /// This member is required.
    public var accessToken: Swift.String?
    /// The identifier for the AWS account that is assigned to the user.
    /// This member is required.
    public var accountId: Swift.String?
    /// The number of items that clients can request per page.
    public var maxResults: Swift.Int?
    /// The page token from the previous response output when you request subsequent pages.
    public var nextToken: Swift.String?

    public init(
        accessToken: Swift.String? = nil,
        accountId: Swift.String? = nil,
        maxResults: Swift.Int? = nil,
        nextToken: Swift.String? = nil
    )
    {
        self.accessToken = accessToken
        self.accountId = accountId
        self.maxResults = maxResults
        self.nextToken = nextToken
    }
}

struct ListAccountRolesInputBody: Swift.Equatable {
}

extension ListAccountRolesInputBody: Swift.Decodable {

    public init(from decoder: Swift.Decoder) throws {
    }
}

public enum ListAccountRolesOutputError: ClientRuntime.HttpResponseErrorBinding {
    public static func makeError(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) async throws -> Swift.Error {
        let restJSONError = try await AWSClientRuntime.RestJSONError(httpResponse: httpResponse)
        let requestID = httpResponse.requestId
        switch restJSONError.errorType {
            case "InvalidRequestException": return try await InvalidRequestException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            case "ResourceNotFoundException": return try await ResourceNotFoundException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            case "TooManyRequestsException": return try await TooManyRequestsException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            case "UnauthorizedException": return try await UnauthorizedException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            default: return try await AWSClientRuntime.UnknownAWSHTTPServiceError.makeError(httpResponse: httpResponse, message: restJSONError.errorMessage, requestID: requestID, typeName: restJSONError.errorType)
        }
    }
}

extension ListAccountRolesOutputResponse: ClientRuntime.HttpResponseBinding {
    public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) async throws {
        if let data = try await httpResponse.body.readData(),
            let responseDecoder = decoder {
            let output: ListAccountRolesOutputResponseBody = try responseDecoder.decode(responseBody: data)
            self.nextToken = output.nextToken
            self.roleList = output.roleList
        } else {
            self.nextToken = nil
            self.roleList = nil
        }
    }
}

public struct ListAccountRolesOutputResponse: Swift.Equatable {
    /// The page token client that is used to retrieve the list of accounts.
    public var nextToken: Swift.String?
    /// A paginated response with the list of roles and the next token if more results are available.
    public var roleList: [SSOClientTypes.RoleInfo]?

    public init(
        nextToken: Swift.String? = nil,
        roleList: [SSOClientTypes.RoleInfo]? = nil
    )
    {
        self.nextToken = nextToken
        self.roleList = roleList
    }
}

struct ListAccountRolesOutputResponseBody: Swift.Equatable {
    let nextToken: Swift.String?
    let roleList: [SSOClientTypes.RoleInfo]?
}

extension ListAccountRolesOutputResponseBody: Swift.Decodable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case nextToken
        case roleList
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let nextTokenDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .nextToken)
        nextToken = nextTokenDecoded
        let roleListContainer = try containerValues.decodeIfPresent([SSOClientTypes.RoleInfo?].self, forKey: .roleList)
        var roleListDecoded0:[SSOClientTypes.RoleInfo]? = nil
        if let roleListContainer = roleListContainer {
            roleListDecoded0 = [SSOClientTypes.RoleInfo]()
            for structure0 in roleListContainer {
                if let structure0 = structure0 {
                    roleListDecoded0?.append(structure0)
                }
            }
        }
        roleList = roleListDecoded0
    }
}

extension ListAccountsInput: Swift.CustomDebugStringConvertible {
    public var debugDescription: Swift.String {
        "ListAccountsInput(maxResults: \(Swift.String(describing: maxResults)), nextToken: \(Swift.String(describing: nextToken)), accessToken: \"CONTENT_REDACTED\")"}
}

extension ListAccountsInput: ClientRuntime.HeaderProvider {
    public var headers: ClientRuntime.Headers {
        var items = ClientRuntime.Headers()
        if let accessToken = accessToken {
            items.add(Header(name: "x-amz-sso_bearer_token", value: Swift.String(accessToken)))
        }
        return items
    }
}

extension ListAccountsInput: ClientRuntime.QueryItemProvider {
    public var queryItems: [ClientRuntime.URLQueryItem] {
        get throws {
            var items = [ClientRuntime.URLQueryItem]()
            if let nextToken = nextToken {
                let nextTokenQueryItem = ClientRuntime.URLQueryItem(name: "next_token".urlPercentEncoding(), value: Swift.String(nextToken).urlPercentEncoding())
                items.append(nextTokenQueryItem)
            }
            if let maxResults = maxResults {
                let maxResultsQueryItem = ClientRuntime.URLQueryItem(name: "max_result".urlPercentEncoding(), value: Swift.String(maxResults).urlPercentEncoding())
                items.append(maxResultsQueryItem)
            }
            return items
        }
    }
}

extension ListAccountsInput: ClientRuntime.URLPathProvider {
    public var urlPath: Swift.String? {
        return "/assignment/accounts"
    }
}

public struct ListAccountsInput: Swift.Equatable {
    /// The token issued by the CreateToken API call. For more information, see [CreateToken](https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/API_CreateToken.html) in the IAM Identity Center OIDC API Reference Guide.
    /// This member is required.
    public var accessToken: Swift.String?
    /// This is the number of items clients can request per page.
    public var maxResults: Swift.Int?
    /// (Optional) When requesting subsequent pages, this is the page token from the previous response output.
    public var nextToken: Swift.String?

    public init(
        accessToken: Swift.String? = nil,
        maxResults: Swift.Int? = nil,
        nextToken: Swift.String? = nil
    )
    {
        self.accessToken = accessToken
        self.maxResults = maxResults
        self.nextToken = nextToken
    }
}

struct ListAccountsInputBody: Swift.Equatable {
}

extension ListAccountsInputBody: Swift.Decodable {

    public init(from decoder: Swift.Decoder) throws {
    }
}

public enum ListAccountsOutputError: ClientRuntime.HttpResponseErrorBinding {
    public static func makeError(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) async throws -> Swift.Error {
        let restJSONError = try await AWSClientRuntime.RestJSONError(httpResponse: httpResponse)
        let requestID = httpResponse.requestId
        switch restJSONError.errorType {
            case "InvalidRequestException": return try await InvalidRequestException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            case "ResourceNotFoundException": return try await ResourceNotFoundException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            case "TooManyRequestsException": return try await TooManyRequestsException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            case "UnauthorizedException": return try await UnauthorizedException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            default: return try await AWSClientRuntime.UnknownAWSHTTPServiceError.makeError(httpResponse: httpResponse, message: restJSONError.errorMessage, requestID: requestID, typeName: restJSONError.errorType)
        }
    }
}

extension ListAccountsOutputResponse: ClientRuntime.HttpResponseBinding {
    public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) async throws {
        if let data = try await httpResponse.body.readData(),
            let responseDecoder = decoder {
            let output: ListAccountsOutputResponseBody = try responseDecoder.decode(responseBody: data)
            self.accountList = output.accountList
            self.nextToken = output.nextToken
        } else {
            self.accountList = nil
            self.nextToken = nil
        }
    }
}

public struct ListAccountsOutputResponse: Swift.Equatable {
    /// A paginated response with the list of account information and the next token if more results are available.
    public var accountList: [SSOClientTypes.AccountInfo]?
    /// The page token client that is used to retrieve the list of accounts.
    public var nextToken: Swift.String?

    public init(
        accountList: [SSOClientTypes.AccountInfo]? = nil,
        nextToken: Swift.String? = nil
    )
    {
        self.accountList = accountList
        self.nextToken = nextToken
    }
}

struct ListAccountsOutputResponseBody: Swift.Equatable {
    let nextToken: Swift.String?
    let accountList: [SSOClientTypes.AccountInfo]?
}

extension ListAccountsOutputResponseBody: Swift.Decodable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case accountList
        case nextToken
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let nextTokenDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .nextToken)
        nextToken = nextTokenDecoded
        let accountListContainer = try containerValues.decodeIfPresent([SSOClientTypes.AccountInfo?].self, forKey: .accountList)
        var accountListDecoded0:[SSOClientTypes.AccountInfo]? = nil
        if let accountListContainer = accountListContainer {
            accountListDecoded0 = [SSOClientTypes.AccountInfo]()
            for structure0 in accountListContainer {
                if let structure0 = structure0 {
                    accountListDecoded0?.append(structure0)
                }
            }
        }
        accountList = accountListDecoded0
    }
}

extension LogoutInput: Swift.CustomDebugStringConvertible {
    public var debugDescription: Swift.String {
        "LogoutInput(accessToken: \"CONTENT_REDACTED\")"}
}

extension LogoutInput: ClientRuntime.HeaderProvider {
    public var headers: ClientRuntime.Headers {
        var items = ClientRuntime.Headers()
        if let accessToken = accessToken {
            items.add(Header(name: "x-amz-sso_bearer_token", value: Swift.String(accessToken)))
        }
        return items
    }
}

extension LogoutInput: ClientRuntime.URLPathProvider {
    public var urlPath: Swift.String? {
        return "/logout"
    }
}

public struct LogoutInput: Swift.Equatable {
    /// The token issued by the CreateToken API call. For more information, see [CreateToken](https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/API_CreateToken.html) in the IAM Identity Center OIDC API Reference Guide.
    /// This member is required.
    public var accessToken: Swift.String?

    public init(
        accessToken: Swift.String? = nil
    )
    {
        self.accessToken = accessToken
    }
}

struct LogoutInputBody: Swift.Equatable {
}

extension LogoutInputBody: Swift.Decodable {

    public init(from decoder: Swift.Decoder) throws {
    }
}

public enum LogoutOutputError: ClientRuntime.HttpResponseErrorBinding {
    public static func makeError(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) async throws -> Swift.Error {
        let restJSONError = try await AWSClientRuntime.RestJSONError(httpResponse: httpResponse)
        let requestID = httpResponse.requestId
        switch restJSONError.errorType {
            case "InvalidRequestException": return try await InvalidRequestException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            case "TooManyRequestsException": return try await TooManyRequestsException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            case "UnauthorizedException": return try await UnauthorizedException(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
            default: return try await AWSClientRuntime.UnknownAWSHTTPServiceError.makeError(httpResponse: httpResponse, message: restJSONError.errorMessage, requestID: requestID, typeName: restJSONError.errorType)
        }
    }
}

extension LogoutOutputResponse: ClientRuntime.HttpResponseBinding {
    public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) async throws {
    }
}

public struct LogoutOutputResponse: Swift.Equatable {

    public init() { }
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

/// The specified resource doesn't exist.
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
        case message
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let messageDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .message)
        message = messageDecoded
    }
}

extension SSOClientTypes.RoleCredentials: Swift.Codable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case accessKeyId
        case expiration
        case secretAccessKey
        case sessionToken
    }

    public func encode(to encoder: Swift.Encoder) throws {
        var encodeContainer = encoder.container(keyedBy: CodingKeys.self)
        if let accessKeyId = self.accessKeyId {
            try encodeContainer.encode(accessKeyId, forKey: .accessKeyId)
        }
        if expiration != 0 {
            try encodeContainer.encode(expiration, forKey: .expiration)
        }
        if let secretAccessKey = self.secretAccessKey {
            try encodeContainer.encode(secretAccessKey, forKey: .secretAccessKey)
        }
        if let sessionToken = self.sessionToken {
            try encodeContainer.encode(sessionToken, forKey: .sessionToken)
        }
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let accessKeyIdDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .accessKeyId)
        accessKeyId = accessKeyIdDecoded
        let secretAccessKeyDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .secretAccessKey)
        secretAccessKey = secretAccessKeyDecoded
        let sessionTokenDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .sessionToken)
        sessionToken = sessionTokenDecoded
        let expirationDecoded = try containerValues.decodeIfPresent(Swift.Int.self, forKey: .expiration) ?? 0
        expiration = expirationDecoded
    }
}

extension SSOClientTypes.RoleCredentials: Swift.CustomDebugStringConvertible {
    public var debugDescription: Swift.String {
        "RoleCredentials(accessKeyId: \(Swift.String(describing: accessKeyId)), expiration: \(Swift.String(describing: expiration)), secretAccessKey: \"CONTENT_REDACTED\", sessionToken: \"CONTENT_REDACTED\")"}
}

extension SSOClientTypes {
    /// Provides information about the role credentials that are assigned to the user.
    public struct RoleCredentials: Swift.Equatable {
        /// The identifier used for the temporary security credentials. For more information, see [Using Temporary Security Credentials to Request Access to AWS Resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_use-resources.html) in the AWS IAM User Guide.
        public var accessKeyId: Swift.String?
        /// The date on which temporary security credentials expire.
        public var expiration: Swift.Int
        /// The key that is used to sign the request. For more information, see [Using Temporary Security Credentials to Request Access to AWS Resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_use-resources.html) in the AWS IAM User Guide.
        public var secretAccessKey: Swift.String?
        /// The token used for temporary credentials. For more information, see [Using Temporary Security Credentials to Request Access to AWS Resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_use-resources.html) in the AWS IAM User Guide.
        public var sessionToken: Swift.String?

        public init(
            accessKeyId: Swift.String? = nil,
            expiration: Swift.Int = 0,
            secretAccessKey: Swift.String? = nil,
            sessionToken: Swift.String? = nil
        )
        {
            self.accessKeyId = accessKeyId
            self.expiration = expiration
            self.secretAccessKey = secretAccessKey
            self.sessionToken = sessionToken
        }
    }

}

extension SSOClientTypes.RoleInfo: Swift.Codable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case accountId
        case roleName
    }

    public func encode(to encoder: Swift.Encoder) throws {
        var encodeContainer = encoder.container(keyedBy: CodingKeys.self)
        if let accountId = self.accountId {
            try encodeContainer.encode(accountId, forKey: .accountId)
        }
        if let roleName = self.roleName {
            try encodeContainer.encode(roleName, forKey: .roleName)
        }
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let roleNameDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .roleName)
        roleName = roleNameDecoded
        let accountIdDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .accountId)
        accountId = accountIdDecoded
    }
}

extension SSOClientTypes {
    /// Provides information about the role that is assigned to the user.
    public struct RoleInfo: Swift.Equatable {
        /// The identifier of the AWS account assigned to the user.
        public var accountId: Swift.String?
        /// The friendly name of the role that is assigned to the user.
        public var roleName: Swift.String?

        public init(
            accountId: Swift.String? = nil,
            roleName: Swift.String? = nil
        )
        {
            self.accountId = accountId
            self.roleName = roleName
        }
    }

}

extension TooManyRequestsException {
    public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) async throws {
        if let data = try await httpResponse.body.readData(),
            let responseDecoder = decoder {
            let output: TooManyRequestsExceptionBody = try responseDecoder.decode(responseBody: data)
            self.properties.message = output.message
        } else {
            self.properties.message = nil
        }
        self.httpResponse = httpResponse
        self.requestID = requestID
        self.message = message
    }
}

/// Indicates that the request is being made too frequently and is more than what the server can handle.
public struct TooManyRequestsException: ClientRuntime.ModeledError, AWSClientRuntime.AWSServiceError, ClientRuntime.HTTPError, Swift.Error {

    public struct Properties {
        public internal(set) var message: Swift.String? = nil
    }

    public internal(set) var properties = Properties()
    public static var typeName: Swift.String { "TooManyRequestsException" }
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

struct TooManyRequestsExceptionBody: Swift.Equatable {
    let message: Swift.String?
}

extension TooManyRequestsExceptionBody: Swift.Decodable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case message
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let messageDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .message)
        message = messageDecoded
    }
}

extension UnauthorizedException {
    public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) async throws {
        if let data = try await httpResponse.body.readData(),
            let responseDecoder = decoder {
            let output: UnauthorizedExceptionBody = try responseDecoder.decode(responseBody: data)
            self.properties.message = output.message
        } else {
            self.properties.message = nil
        }
        self.httpResponse = httpResponse
        self.requestID = requestID
        self.message = message
    }
}

/// Indicates that the request is not authorized. This can happen due to an invalid access token in the request.
public struct UnauthorizedException: ClientRuntime.ModeledError, AWSClientRuntime.AWSServiceError, ClientRuntime.HTTPError, Swift.Error {

    public struct Properties {
        public internal(set) var message: Swift.String? = nil
    }

    public internal(set) var properties = Properties()
    public static var typeName: Swift.String { "UnauthorizedException" }
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

struct UnauthorizedExceptionBody: Swift.Equatable {
    let message: Swift.String?
}

extension UnauthorizedExceptionBody: Swift.Decodable {
    enum CodingKeys: Swift.String, Swift.CodingKey {
        case message
    }

    public init(from decoder: Swift.Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let messageDecoded = try containerValues.decodeIfPresent(Swift.String.self, forKey: .message)
        message = messageDecoded
    }
}
