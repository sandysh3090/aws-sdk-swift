// Code generated by smithy-swift-codegen. DO NOT EDIT!

@_spi(FileBasedConfig) import AWSClientRuntime
import ClientRuntime

/// Amazon Managed Workflows for Apache Airflow This section contains the Amazon Managed Workflows for Apache Airflow (MWAA) API reference documentation. For more information, see [What Is Amazon MWAA?](https://docs.aws.amazon.com/mwaa/latest/userguide/what-is-mwaa.html). Endpoints
///
/// * api.airflow.{region}.amazonaws.com - This endpoint is used for environment management.
///
/// * [CreateEnvironment](https://docs.aws.amazon.com/mwaa/latest/API/API_CreateEnvironment.html)
///
/// * [DeleteEnvironment](https://docs.aws.amazon.com/mwaa/latest/API/API_DeleteEnvironment.html)
///
/// * [GetEnvironment](https://docs.aws.amazon.com/mwaa/latest/API/API_GetEnvironment.html)
///
/// * [ListEnvironments](https://docs.aws.amazon.com/mwaa/latest/API/API_ListEnvironments.html)
///
/// * [ListTagsForResource](https://docs.aws.amazon.com/mwaa/latest/API/API_ListTagsForResource.html)
///
/// * [TagResource](https://docs.aws.amazon.com/mwaa/latest/API/API_TagResource.html)
///
/// * [UntagResource](https://docs.aws.amazon.com/mwaa/latest/API/API_UntagResource.html)
///
/// * [UpdateEnvironment](https://docs.aws.amazon.com/mwaa/latest/API/API_UpdateEnvironment.html)
///
///
///
///
/// * env.airflow.{region}.amazonaws.com - This endpoint is used to operate the Airflow environment.
///
/// * [CreateCliToken](https://docs.aws.amazon.com/mwaa/latest/API/API_CreateCliToken.html)
///
/// * [CreateWebLoginToken](https://docs.aws.amazon.com/mwaa/latest/API/API_CreateWebLoginToken.html)
///
///
///
///
/// * ops.airflow.{region}.amazonaws.com - This endpoint is used to push environment metrics that track environment health.
///
/// * [PublishMetrics](https://docs.aws.amazon.com/mwaa/latest/API/API_PublishMetrics.html)
///
///
///
///
///
/// Regions For a list of regions that Amazon MWAA supports, see [Region availability](https://docs.aws.amazon.com/mwaa/latest/userguide/what-is-mwaa.html#regions-mwaa) in the Amazon MWAA User Guide.
public protocol MWAAClientProtocol {
    /// Creates a CLI token for the Airflow CLI. To learn more, see [Creating an Apache Airflow CLI token](https://docs.aws.amazon.com/mwaa/latest/userguide/call-mwaa-apis-cli.html).
    func createCliToken(input: CreateCliTokenInput) async throws -> CreateCliTokenOutputResponse
    /// Creates an Amazon Managed Workflows for Apache Airflow (MWAA) environment.
    func createEnvironment(input: CreateEnvironmentInput) async throws -> CreateEnvironmentOutputResponse
    /// Creates a web login token for the Airflow Web UI. To learn more, see [Creating an Apache Airflow web login token](https://docs.aws.amazon.com/mwaa/latest/userguide/call-mwaa-apis-web.html).
    func createWebLoginToken(input: CreateWebLoginTokenInput) async throws -> CreateWebLoginTokenOutputResponse
    /// Deletes an Amazon Managed Workflows for Apache Airflow (MWAA) environment.
    func deleteEnvironment(input: DeleteEnvironmentInput) async throws -> DeleteEnvironmentOutputResponse
    /// Describes an Amazon Managed Workflows for Apache Airflow (MWAA) environment.
    func getEnvironment(input: GetEnvironmentInput) async throws -> GetEnvironmentOutputResponse
    /// Lists the Amazon Managed Workflows for Apache Airflow (MWAA) environments.
    func listEnvironments(input: ListEnvironmentsInput) async throws -> ListEnvironmentsOutputResponse
    /// Lists the key-value tag pairs associated to the Amazon Managed Workflows for Apache Airflow (MWAA) environment. For example, "Environment": "Staging".
    func listTagsForResource(input: ListTagsForResourceInput) async throws -> ListTagsForResourceOutputResponse
    /// Internal only. Publishes environment health metrics to Amazon CloudWatch.
    func publishMetrics(input: PublishMetricsInput) async throws -> PublishMetricsOutputResponse
    /// Associates key-value tag pairs to your Amazon Managed Workflows for Apache Airflow (MWAA) environment.
    func tagResource(input: TagResourceInput) async throws -> TagResourceOutputResponse
    /// Removes key-value tag pairs associated to your Amazon Managed Workflows for Apache Airflow (MWAA) environment. For example, "Environment": "Staging".
    func untagResource(input: UntagResourceInput) async throws -> UntagResourceOutputResponse
    /// Updates an Amazon Managed Workflows for Apache Airflow (MWAA) environment.
    func updateEnvironment(input: UpdateEnvironmentInput) async throws -> UpdateEnvironmentOutputResponse
}

public protocol MWAAClientConfigurationProtocol : AWSClientRuntime.AWSClientConfiguration {
    var endpointResolver: EndpointResolver { get }
}

public enum MWAAClientTypes {}
