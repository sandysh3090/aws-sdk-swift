// Code generated by smithy-swift-codegen. DO NOT EDIT!

import ClientRuntime

extension ElasticLoadBalancingv2ClientProtocol {

    static func loadBalancerAvailableWaiterConfig() throws -> WaiterConfiguration<DescribeLoadBalancersInput, DescribeLoadBalancersOutputResponse> {
        let acceptors: [WaiterConfiguration<DescribeLoadBalancersInput, DescribeLoadBalancersOutputResponse>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeLoadBalancersInput, result: Result<DescribeLoadBalancersOutputResponse, Error>) -> Bool in
                // JMESPath expression: "LoadBalancers[].State.Code"
                // JMESPath comparator: "allStringEquals"
                // JMESPath expected value: "active"
                guard case .success(let output) = result else { return false }
                let loadBalancers = output.loadBalancers
                let projection: [ElasticLoadBalancingv2ClientTypes.LoadBalancerStateEnum]? = loadBalancers?.compactMap { original in
                    let state = original.state
                    let code = state?.code
                    return code
                }
                return (projection?.count ?? 0) > 1 && (projection?.allSatisfy { JMESUtils.compare($0, ==, "active") } ?? false)
            }),
            .init(state: .retry, matcher: { (input: DescribeLoadBalancersInput, result: Result<DescribeLoadBalancersOutputResponse, Error>) -> Bool in
                // JMESPath expression: "LoadBalancers[].State.Code"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "provisioning"
                guard case .success(let output) = result else { return false }
                let loadBalancers = output.loadBalancers
                let projection: [ElasticLoadBalancingv2ClientTypes.LoadBalancerStateEnum]? = loadBalancers?.compactMap { original in
                    let state = original.state
                    let code = state?.code
                    return code
                }
                return projection?.contains(where: { JMESUtils.compare($0, ==, "provisioning") }) ?? false
            }),
            .init(state: .retry, matcher: { (input: DescribeLoadBalancersInput, result: Result<DescribeLoadBalancersOutputResponse, Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ServiceError)?.typeName == "LoadBalancerNotFound"
            }),
        ]
        return try WaiterConfiguration<DescribeLoadBalancersInput, DescribeLoadBalancersOutputResponse>(acceptors: acceptors, minDelay: 15.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the LoadBalancerAvailable event on the describeLoadBalancers operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeLoadBalancersInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilLoadBalancerAvailable(options: WaiterOptions, input: DescribeLoadBalancersInput) async throws -> WaiterOutcome<DescribeLoadBalancersOutputResponse> {
        let waiter = Waiter(config: try Self.loadBalancerAvailableWaiterConfig(), operation: self.describeLoadBalancers(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func loadBalancerExistsWaiterConfig() throws -> WaiterConfiguration<DescribeLoadBalancersInput, DescribeLoadBalancersOutputResponse> {
        let acceptors: [WaiterConfiguration<DescribeLoadBalancersInput, DescribeLoadBalancersOutputResponse>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeLoadBalancersInput, result: Result<DescribeLoadBalancersOutputResponse, Error>) -> Bool in
                switch result {
                    case .success: return true
                    case .failure: return false
                }
            }),
            .init(state: .retry, matcher: { (input: DescribeLoadBalancersInput, result: Result<DescribeLoadBalancersOutputResponse, Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ServiceError)?.typeName == "LoadBalancerNotFound"
            }),
        ]
        return try WaiterConfiguration<DescribeLoadBalancersInput, DescribeLoadBalancersOutputResponse>(acceptors: acceptors, minDelay: 15.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the LoadBalancerExists event on the describeLoadBalancers operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeLoadBalancersInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilLoadBalancerExists(options: WaiterOptions, input: DescribeLoadBalancersInput) async throws -> WaiterOutcome<DescribeLoadBalancersOutputResponse> {
        let waiter = Waiter(config: try Self.loadBalancerExistsWaiterConfig(), operation: self.describeLoadBalancers(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func loadBalancersDeletedWaiterConfig() throws -> WaiterConfiguration<DescribeLoadBalancersInput, DescribeLoadBalancersOutputResponse> {
        let acceptors: [WaiterConfiguration<DescribeLoadBalancersInput, DescribeLoadBalancersOutputResponse>.Acceptor] = [
            .init(state: .retry, matcher: { (input: DescribeLoadBalancersInput, result: Result<DescribeLoadBalancersOutputResponse, Error>) -> Bool in
                // JMESPath expression: "LoadBalancers[].State.Code"
                // JMESPath comparator: "allStringEquals"
                // JMESPath expected value: "active"
                guard case .success(let output) = result else { return false }
                let loadBalancers = output.loadBalancers
                let projection: [ElasticLoadBalancingv2ClientTypes.LoadBalancerStateEnum]? = loadBalancers?.compactMap { original in
                    let state = original.state
                    let code = state?.code
                    return code
                }
                return (projection?.count ?? 0) > 1 && (projection?.allSatisfy { JMESUtils.compare($0, ==, "active") } ?? false)
            }),
            .init(state: .success, matcher: { (input: DescribeLoadBalancersInput, result: Result<DescribeLoadBalancersOutputResponse, Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ServiceError)?.typeName == "LoadBalancerNotFound"
            }),
        ]
        return try WaiterConfiguration<DescribeLoadBalancersInput, DescribeLoadBalancersOutputResponse>(acceptors: acceptors, minDelay: 15.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the LoadBalancersDeleted event on the describeLoadBalancers operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeLoadBalancersInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilLoadBalancersDeleted(options: WaiterOptions, input: DescribeLoadBalancersInput) async throws -> WaiterOutcome<DescribeLoadBalancersOutputResponse> {
        let waiter = Waiter(config: try Self.loadBalancersDeletedWaiterConfig(), operation: self.describeLoadBalancers(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func targetDeregisteredWaiterConfig() throws -> WaiterConfiguration<DescribeTargetHealthInput, DescribeTargetHealthOutputResponse> {
        let acceptors: [WaiterConfiguration<DescribeTargetHealthInput, DescribeTargetHealthOutputResponse>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeTargetHealthInput, result: Result<DescribeTargetHealthOutputResponse, Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ServiceError)?.typeName == "InvalidTarget"
            }),
            .init(state: .success, matcher: { (input: DescribeTargetHealthInput, result: Result<DescribeTargetHealthOutputResponse, Error>) -> Bool in
                // JMESPath expression: "TargetHealthDescriptions[].TargetHealth.State"
                // JMESPath comparator: "allStringEquals"
                // JMESPath expected value: "unused"
                guard case .success(let output) = result else { return false }
                let targetHealthDescriptions = output.targetHealthDescriptions
                let projection: [ElasticLoadBalancingv2ClientTypes.TargetHealthStateEnum]? = targetHealthDescriptions?.compactMap { original in
                    let targetHealth = original.targetHealth
                    let state = targetHealth?.state
                    return state
                }
                return (projection?.count ?? 0) > 1 && (projection?.allSatisfy { JMESUtils.compare($0, ==, "unused") } ?? false)
            }),
        ]
        return try WaiterConfiguration<DescribeTargetHealthInput, DescribeTargetHealthOutputResponse>(acceptors: acceptors, minDelay: 15.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the TargetDeregistered event on the describeTargetHealth operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeTargetHealthInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilTargetDeregistered(options: WaiterOptions, input: DescribeTargetHealthInput) async throws -> WaiterOutcome<DescribeTargetHealthOutputResponse> {
        let waiter = Waiter(config: try Self.targetDeregisteredWaiterConfig(), operation: self.describeTargetHealth(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func targetInServiceWaiterConfig() throws -> WaiterConfiguration<DescribeTargetHealthInput, DescribeTargetHealthOutputResponse> {
        let acceptors: [WaiterConfiguration<DescribeTargetHealthInput, DescribeTargetHealthOutputResponse>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeTargetHealthInput, result: Result<DescribeTargetHealthOutputResponse, Error>) -> Bool in
                // JMESPath expression: "TargetHealthDescriptions[].TargetHealth.State"
                // JMESPath comparator: "allStringEquals"
                // JMESPath expected value: "healthy"
                guard case .success(let output) = result else { return false }
                let targetHealthDescriptions = output.targetHealthDescriptions
                let projection: [ElasticLoadBalancingv2ClientTypes.TargetHealthStateEnum]? = targetHealthDescriptions?.compactMap { original in
                    let targetHealth = original.targetHealth
                    let state = targetHealth?.state
                    return state
                }
                return (projection?.count ?? 0) > 1 && (projection?.allSatisfy { JMESUtils.compare($0, ==, "healthy") } ?? false)
            }),
            .init(state: .retry, matcher: { (input: DescribeTargetHealthInput, result: Result<DescribeTargetHealthOutputResponse, Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ServiceError)?.typeName == "InvalidInstance"
            }),
        ]
        return try WaiterConfiguration<DescribeTargetHealthInput, DescribeTargetHealthOutputResponse>(acceptors: acceptors, minDelay: 15.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the TargetInService event on the describeTargetHealth operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeTargetHealthInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilTargetInService(options: WaiterOptions, input: DescribeTargetHealthInput) async throws -> WaiterOutcome<DescribeTargetHealthOutputResponse> {
        let waiter = Waiter(config: try Self.targetInServiceWaiterConfig(), operation: self.describeTargetHealth(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }
}
