// Code generated by smithy-swift-codegen. DO NOT EDIT!

import ClientRuntime

extension ElastiCacheClientProtocol {

    static func cacheClusterAvailableWaiterConfig() throws -> WaiterConfiguration<DescribeCacheClustersInput, DescribeCacheClustersOutputResponse> {
        let acceptors: [WaiterConfiguration<DescribeCacheClustersInput, DescribeCacheClustersOutputResponse>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeCacheClustersInput, result: Result<DescribeCacheClustersOutputResponse, Error>) -> Bool in
                // JMESPath expression: "CacheClusters[].CacheClusterStatus"
                // JMESPath comparator: "allStringEquals"
                // JMESPath expected value: "available"
                guard case .success(let output) = result else { return false }
                let cacheClusters = output.cacheClusters
                let projection: [Swift.String]? = cacheClusters?.compactMap { original in
                    let cacheClusterStatus = original.cacheClusterStatus
                    return cacheClusterStatus
                }
                return (projection?.count ?? 0) > 1 && (projection?.allSatisfy { JMESUtils.compare($0, ==, "available") } ?? false)
            }),
            .init(state: .failure, matcher: { (input: DescribeCacheClustersInput, result: Result<DescribeCacheClustersOutputResponse, Error>) -> Bool in
                // JMESPath expression: "CacheClusters[].CacheClusterStatus"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "deleted"
                guard case .success(let output) = result else { return false }
                let cacheClusters = output.cacheClusters
                let projection: [Swift.String]? = cacheClusters?.compactMap { original in
                    let cacheClusterStatus = original.cacheClusterStatus
                    return cacheClusterStatus
                }
                return projection?.contains(where: { JMESUtils.compare($0, ==, "deleted") }) ?? false
            }),
            .init(state: .failure, matcher: { (input: DescribeCacheClustersInput, result: Result<DescribeCacheClustersOutputResponse, Error>) -> Bool in
                // JMESPath expression: "CacheClusters[].CacheClusterStatus"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "deleting"
                guard case .success(let output) = result else { return false }
                let cacheClusters = output.cacheClusters
                let projection: [Swift.String]? = cacheClusters?.compactMap { original in
                    let cacheClusterStatus = original.cacheClusterStatus
                    return cacheClusterStatus
                }
                return projection?.contains(where: { JMESUtils.compare($0, ==, "deleting") }) ?? false
            }),
            .init(state: .failure, matcher: { (input: DescribeCacheClustersInput, result: Result<DescribeCacheClustersOutputResponse, Error>) -> Bool in
                // JMESPath expression: "CacheClusters[].CacheClusterStatus"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "incompatible-network"
                guard case .success(let output) = result else { return false }
                let cacheClusters = output.cacheClusters
                let projection: [Swift.String]? = cacheClusters?.compactMap { original in
                    let cacheClusterStatus = original.cacheClusterStatus
                    return cacheClusterStatus
                }
                return projection?.contains(where: { JMESUtils.compare($0, ==, "incompatible-network") }) ?? false
            }),
            .init(state: .failure, matcher: { (input: DescribeCacheClustersInput, result: Result<DescribeCacheClustersOutputResponse, Error>) -> Bool in
                // JMESPath expression: "CacheClusters[].CacheClusterStatus"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "restore-failed"
                guard case .success(let output) = result else { return false }
                let cacheClusters = output.cacheClusters
                let projection: [Swift.String]? = cacheClusters?.compactMap { original in
                    let cacheClusterStatus = original.cacheClusterStatus
                    return cacheClusterStatus
                }
                return projection?.contains(where: { JMESUtils.compare($0, ==, "restore-failed") }) ?? false
            }),
        ]
        return try WaiterConfiguration<DescribeCacheClustersInput, DescribeCacheClustersOutputResponse>(acceptors: acceptors, minDelay: 15.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the CacheClusterAvailable event on the describeCacheClusters operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeCacheClustersInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilCacheClusterAvailable(options: WaiterOptions, input: DescribeCacheClustersInput) async throws -> WaiterOutcome<DescribeCacheClustersOutputResponse> {
        let waiter = Waiter(config: try Self.cacheClusterAvailableWaiterConfig(), operation: self.describeCacheClusters(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func cacheClusterDeletedWaiterConfig() throws -> WaiterConfiguration<DescribeCacheClustersInput, DescribeCacheClustersOutputResponse> {
        let acceptors: [WaiterConfiguration<DescribeCacheClustersInput, DescribeCacheClustersOutputResponse>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeCacheClustersInput, result: Result<DescribeCacheClustersOutputResponse, Error>) -> Bool in
                // JMESPath expression: "CacheClusters[].CacheClusterStatus"
                // JMESPath comparator: "allStringEquals"
                // JMESPath expected value: "deleted"
                guard case .success(let output) = result else { return false }
                let cacheClusters = output.cacheClusters
                let projection: [Swift.String]? = cacheClusters?.compactMap { original in
                    let cacheClusterStatus = original.cacheClusterStatus
                    return cacheClusterStatus
                }
                return (projection?.count ?? 0) > 1 && (projection?.allSatisfy { JMESUtils.compare($0, ==, "deleted") } ?? false)
            }),
            .init(state: .success, matcher: { (input: DescribeCacheClustersInput, result: Result<DescribeCacheClustersOutputResponse, Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ServiceError)?.typeName == "CacheClusterNotFound"
            }),
            .init(state: .failure, matcher: { (input: DescribeCacheClustersInput, result: Result<DescribeCacheClustersOutputResponse, Error>) -> Bool in
                // JMESPath expression: "CacheClusters[].CacheClusterStatus"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "available"
                guard case .success(let output) = result else { return false }
                let cacheClusters = output.cacheClusters
                let projection: [Swift.String]? = cacheClusters?.compactMap { original in
                    let cacheClusterStatus = original.cacheClusterStatus
                    return cacheClusterStatus
                }
                return projection?.contains(where: { JMESUtils.compare($0, ==, "available") }) ?? false
            }),
            .init(state: .failure, matcher: { (input: DescribeCacheClustersInput, result: Result<DescribeCacheClustersOutputResponse, Error>) -> Bool in
                // JMESPath expression: "CacheClusters[].CacheClusterStatus"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "creating"
                guard case .success(let output) = result else { return false }
                let cacheClusters = output.cacheClusters
                let projection: [Swift.String]? = cacheClusters?.compactMap { original in
                    let cacheClusterStatus = original.cacheClusterStatus
                    return cacheClusterStatus
                }
                return projection?.contains(where: { JMESUtils.compare($0, ==, "creating") }) ?? false
            }),
            .init(state: .failure, matcher: { (input: DescribeCacheClustersInput, result: Result<DescribeCacheClustersOutputResponse, Error>) -> Bool in
                // JMESPath expression: "CacheClusters[].CacheClusterStatus"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "incompatible-network"
                guard case .success(let output) = result else { return false }
                let cacheClusters = output.cacheClusters
                let projection: [Swift.String]? = cacheClusters?.compactMap { original in
                    let cacheClusterStatus = original.cacheClusterStatus
                    return cacheClusterStatus
                }
                return projection?.contains(where: { JMESUtils.compare($0, ==, "incompatible-network") }) ?? false
            }),
            .init(state: .failure, matcher: { (input: DescribeCacheClustersInput, result: Result<DescribeCacheClustersOutputResponse, Error>) -> Bool in
                // JMESPath expression: "CacheClusters[].CacheClusterStatus"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "modifying"
                guard case .success(let output) = result else { return false }
                let cacheClusters = output.cacheClusters
                let projection: [Swift.String]? = cacheClusters?.compactMap { original in
                    let cacheClusterStatus = original.cacheClusterStatus
                    return cacheClusterStatus
                }
                return projection?.contains(where: { JMESUtils.compare($0, ==, "modifying") }) ?? false
            }),
            .init(state: .failure, matcher: { (input: DescribeCacheClustersInput, result: Result<DescribeCacheClustersOutputResponse, Error>) -> Bool in
                // JMESPath expression: "CacheClusters[].CacheClusterStatus"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "restore-failed"
                guard case .success(let output) = result else { return false }
                let cacheClusters = output.cacheClusters
                let projection: [Swift.String]? = cacheClusters?.compactMap { original in
                    let cacheClusterStatus = original.cacheClusterStatus
                    return cacheClusterStatus
                }
                return projection?.contains(where: { JMESUtils.compare($0, ==, "restore-failed") }) ?? false
            }),
            .init(state: .failure, matcher: { (input: DescribeCacheClustersInput, result: Result<DescribeCacheClustersOutputResponse, Error>) -> Bool in
                // JMESPath expression: "CacheClusters[].CacheClusterStatus"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "snapshotting"
                guard case .success(let output) = result else { return false }
                let cacheClusters = output.cacheClusters
                let projection: [Swift.String]? = cacheClusters?.compactMap { original in
                    let cacheClusterStatus = original.cacheClusterStatus
                    return cacheClusterStatus
                }
                return projection?.contains(where: { JMESUtils.compare($0, ==, "snapshotting") }) ?? false
            }),
        ]
        return try WaiterConfiguration<DescribeCacheClustersInput, DescribeCacheClustersOutputResponse>(acceptors: acceptors, minDelay: 15.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the CacheClusterDeleted event on the describeCacheClusters operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeCacheClustersInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilCacheClusterDeleted(options: WaiterOptions, input: DescribeCacheClustersInput) async throws -> WaiterOutcome<DescribeCacheClustersOutputResponse> {
        let waiter = Waiter(config: try Self.cacheClusterDeletedWaiterConfig(), operation: self.describeCacheClusters(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func replicationGroupAvailableWaiterConfig() throws -> WaiterConfiguration<DescribeReplicationGroupsInput, DescribeReplicationGroupsOutputResponse> {
        let acceptors: [WaiterConfiguration<DescribeReplicationGroupsInput, DescribeReplicationGroupsOutputResponse>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeReplicationGroupsInput, result: Result<DescribeReplicationGroupsOutputResponse, Error>) -> Bool in
                // JMESPath expression: "ReplicationGroups[].Status"
                // JMESPath comparator: "allStringEquals"
                // JMESPath expected value: "available"
                guard case .success(let output) = result else { return false }
                let replicationGroups = output.replicationGroups
                let projection: [Swift.String]? = replicationGroups?.compactMap { original in
                    let status = original.status
                    return status
                }
                return (projection?.count ?? 0) > 1 && (projection?.allSatisfy { JMESUtils.compare($0, ==, "available") } ?? false)
            }),
            .init(state: .failure, matcher: { (input: DescribeReplicationGroupsInput, result: Result<DescribeReplicationGroupsOutputResponse, Error>) -> Bool in
                // JMESPath expression: "ReplicationGroups[].Status"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "deleted"
                guard case .success(let output) = result else { return false }
                let replicationGroups = output.replicationGroups
                let projection: [Swift.String]? = replicationGroups?.compactMap { original in
                    let status = original.status
                    return status
                }
                return projection?.contains(where: { JMESUtils.compare($0, ==, "deleted") }) ?? false
            }),
        ]
        return try WaiterConfiguration<DescribeReplicationGroupsInput, DescribeReplicationGroupsOutputResponse>(acceptors: acceptors, minDelay: 15.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the ReplicationGroupAvailable event on the describeReplicationGroups operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeReplicationGroupsInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilReplicationGroupAvailable(options: WaiterOptions, input: DescribeReplicationGroupsInput) async throws -> WaiterOutcome<DescribeReplicationGroupsOutputResponse> {
        let waiter = Waiter(config: try Self.replicationGroupAvailableWaiterConfig(), operation: self.describeReplicationGroups(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func replicationGroupDeletedWaiterConfig() throws -> WaiterConfiguration<DescribeReplicationGroupsInput, DescribeReplicationGroupsOutputResponse> {
        let acceptors: [WaiterConfiguration<DescribeReplicationGroupsInput, DescribeReplicationGroupsOutputResponse>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeReplicationGroupsInput, result: Result<DescribeReplicationGroupsOutputResponse, Error>) -> Bool in
                // JMESPath expression: "ReplicationGroups[].Status"
                // JMESPath comparator: "allStringEquals"
                // JMESPath expected value: "deleted"
                guard case .success(let output) = result else { return false }
                let replicationGroups = output.replicationGroups
                let projection: [Swift.String]? = replicationGroups?.compactMap { original in
                    let status = original.status
                    return status
                }
                return (projection?.count ?? 0) > 1 && (projection?.allSatisfy { JMESUtils.compare($0, ==, "deleted") } ?? false)
            }),
            .init(state: .failure, matcher: { (input: DescribeReplicationGroupsInput, result: Result<DescribeReplicationGroupsOutputResponse, Error>) -> Bool in
                // JMESPath expression: "ReplicationGroups[].Status"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "available"
                guard case .success(let output) = result else { return false }
                let replicationGroups = output.replicationGroups
                let projection: [Swift.String]? = replicationGroups?.compactMap { original in
                    let status = original.status
                    return status
                }
                return projection?.contains(where: { JMESUtils.compare($0, ==, "available") }) ?? false
            }),
            .init(state: .success, matcher: { (input: DescribeReplicationGroupsInput, result: Result<DescribeReplicationGroupsOutputResponse, Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ServiceError)?.typeName == "ReplicationGroupNotFoundFault"
            }),
        ]
        return try WaiterConfiguration<DescribeReplicationGroupsInput, DescribeReplicationGroupsOutputResponse>(acceptors: acceptors, minDelay: 15.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the ReplicationGroupDeleted event on the describeReplicationGroups operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeReplicationGroupsInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilReplicationGroupDeleted(options: WaiterOptions, input: DescribeReplicationGroupsInput) async throws -> WaiterOutcome<DescribeReplicationGroupsOutputResponse> {
        let waiter = Waiter(config: try Self.replicationGroupDeletedWaiterConfig(), operation: self.describeReplicationGroups(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }
}
