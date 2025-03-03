// Code generated by smithy-swift-codegen. DO NOT EDIT!

@_spi(FileBasedConfig) import AWSClientRuntime
import ClientRuntime

/// SimSpace Weaver (SimSpace Weaver) is a managed service that you can use to build and operate large-scale spatial simulations in the Amazon Web Services Cloud. For example, you can create a digital twin of a city, crowd simulations with millions of people and objects, and massively multiplayer games with hundreds of thousands of connected players. For more information about SimSpace Weaver, see the [SimSpace Weaver User Guide](https://docs.aws.amazon.com/simspaceweaver/latest/userguide/) . This API reference describes the API operations and data types that you can use to communicate directly with SimSpace Weaver. SimSpace Weaver also provides the SimSpace Weaver app SDK, which you use for app development. The SimSpace Weaver app SDK API reference is included in the SimSpace Weaver app SDK documentation. This documentation is part of the SimSpace Weaver app SDK distributable package.
public protocol SimSpaceWeaverClientProtocol {
    /// Creates a snapshot of the specified simulation. A snapshot is a file that contains simulation state data at a specific time. The state data saved in a snapshot includes entity data from the State Fabric, the simulation configuration specified in the schema, and the clock tick number. You can use the snapshot to initialize a new simulation. For more information about snapshots, see [Snapshots](https://docs.aws.amazon.com/simspaceweaver/latest/userguide/working-with_snapshots.html) in the SimSpace Weaver User Guide. You specify a Destination when you create a snapshot. The Destination is the name of an Amazon S3 bucket and an optional ObjectKeyPrefix. The ObjectKeyPrefix is usually the name of a folder in the bucket. SimSpace Weaver creates a snapshot folder inside the Destination and places the snapshot file there. The snapshot file is an Amazon S3 object. It has an object key with the form:  object-key-prefix/snapshot/simulation-name-YYMMdd-HHmm-ss.zip, where:
    ///
    /// * YY  is the 2-digit year
    ///
    /// * MM  is the 2-digit month
    ///
    /// * dd  is the 2-digit day of the month
    ///
    /// * HH  is the 2-digit hour (24-hour clock)
    ///
    /// * mm  is the 2-digit minutes
    ///
    /// * ss  is the 2-digit seconds
    func createSnapshot(input: CreateSnapshotInput) async throws -> CreateSnapshotOutputResponse
    /// Deletes the instance of the given custom app.
    func deleteApp(input: DeleteAppInput) async throws -> DeleteAppOutputResponse
    /// Deletes all SimSpace Weaver resources assigned to the given simulation. Your simulation uses resources in other Amazon Web Services. This API operation doesn't delete resources in other Amazon Web Services.
    func deleteSimulation(input: DeleteSimulationInput) async throws -> DeleteSimulationOutputResponse
    /// Returns the state of the given custom app.
    func describeApp(input: DescribeAppInput) async throws -> DescribeAppOutputResponse
    /// Returns the current state of the given simulation.
    func describeSimulation(input: DescribeSimulationInput) async throws -> DescribeSimulationOutputResponse
    /// Lists all custom apps or service apps for the given simulation and domain.
    func listApps(input: ListAppsInput) async throws -> ListAppsOutputResponse
    /// Lists the SimSpace Weaver simulations in the Amazon Web Services account used to make the API call.
    func listSimulations(input: ListSimulationsInput) async throws -> ListSimulationsOutputResponse
    /// Lists all tags on a SimSpace Weaver resource.
    func listTagsForResource(input: ListTagsForResourceInput) async throws -> ListTagsForResourceOutputResponse
    /// Starts a custom app with the configuration specified in the simulation schema.
    func startApp(input: StartAppInput) async throws -> StartAppOutputResponse
    /// Starts the simulation clock.
    func startClock(input: StartClockInput) async throws -> StartClockOutputResponse
    /// Starts a simulation with the given name. You must choose to start your simulation from a schema or from a snapshot. For more information about the schema, see the [schema reference](https://docs.aws.amazon.com/simspaceweaver/latest/userguide/schema-reference.html) in the SimSpace Weaver User Guide. For more information about snapshots, see [Snapshots](https://docs.aws.amazon.com/simspaceweaver/latest/userguide/working-with_snapshots.html) in the SimSpace Weaver User Guide.
    func startSimulation(input: StartSimulationInput) async throws -> StartSimulationOutputResponse
    /// Stops the given custom app and shuts down all of its allocated compute resources.
    func stopApp(input: StopAppInput) async throws -> StopAppOutputResponse
    /// Stops the simulation clock.
    func stopClock(input: StopClockInput) async throws -> StopClockOutputResponse
    /// Stops the given simulation. You can't restart a simulation after you stop it. If you want to restart a simulation, then you must stop it, delete it, and start a new instance of it.
    func stopSimulation(input: StopSimulationInput) async throws -> StopSimulationOutputResponse
    /// Adds tags to a SimSpace Weaver resource. For more information about tags, see [Tagging Amazon Web Services resources](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html) in the Amazon Web Services General Reference.
    func tagResource(input: TagResourceInput) async throws -> TagResourceOutputResponse
    /// Removes tags from a SimSpace Weaver resource. For more information about tags, see [Tagging Amazon Web Services resources](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html) in the Amazon Web Services General Reference.
    func untagResource(input: UntagResourceInput) async throws -> UntagResourceOutputResponse
}

public protocol SimSpaceWeaverClientConfigurationProtocol : AWSClientRuntime.AWSClientConfiguration {
    var endpointResolver: EndpointResolver { get }
}

public enum SimSpaceWeaverClientTypes {}
