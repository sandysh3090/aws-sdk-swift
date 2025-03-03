// Code generated by smithy-swift-codegen. DO NOT EDIT!

@_spi(FileBasedConfig) import AWSClientRuntime
import ClientRuntime

/// Amazon EventBridge helps you to respond to state changes in your Amazon Web Services resources. When your resources change state, they automatically send events to an event stream. You can create rules that match selected events in the stream and route them to targets to take action. You can also use rules to take action on a predetermined schedule. For example, you can configure rules to:
///
/// * Automatically invoke an Lambda function to update DNS entries when an event notifies you that Amazon EC2 instance enters the running state.
///
/// * Direct specific API records from CloudTrail to an Amazon Kinesis data stream for detailed analysis of potential security or availability risks.
///
/// * Periodically invoke a built-in target to create a snapshot of an Amazon EBS volume.
///
///
/// For more information about the features of Amazon EventBridge, see the [Amazon EventBridge User Guide](https://docs.aws.amazon.com/eventbridge/latest/userguide).
public protocol EventBridgeClientProtocol {
    /// Activates a partner event source that has been deactivated. Once activated, your matching event bus will start receiving events from the event source.
    func activateEventSource(input: ActivateEventSourceInput) async throws -> ActivateEventSourceOutputResponse
    /// Cancels the specified replay.
    func cancelReplay(input: CancelReplayInput) async throws -> CancelReplayOutputResponse
    /// Creates an API destination, which is an HTTP invocation endpoint configured as a target for events.
    func createApiDestination(input: CreateApiDestinationInput) async throws -> CreateApiDestinationOutputResponse
    /// Creates an archive of events with the specified settings. When you create an archive, incoming events might not immediately start being sent to the archive. Allow a short period of time for changes to take effect. If you do not specify a pattern to filter events sent to the archive, all events are sent to the archive except replayed events. Replayed events are not sent to an archive.
    func createArchive(input: CreateArchiveInput) async throws -> CreateArchiveOutputResponse
    /// Creates a connection. A connection defines the authorization type and credentials to use for authorization with an API destination HTTP endpoint.
    func createConnection(input: CreateConnectionInput) async throws -> CreateConnectionOutputResponse
    /// Creates a global endpoint. Global endpoints improve your application's availability by making it regional-fault tolerant. To do this, you define a primary and secondary Region with event buses in each Region. You also create a Amazon Route 53 health check that will tell EventBridge to route events to the secondary Region when an "unhealthy" state is encountered and events will be routed back to the primary Region when the health check reports a "healthy" state.
    func createEndpoint(input: CreateEndpointInput) async throws -> CreateEndpointOutputResponse
    /// Creates a new event bus within your account. This can be a custom event bus which you can use to receive events from your custom applications and services, or it can be a partner event bus which can be matched to a partner event source.
    func createEventBus(input: CreateEventBusInput) async throws -> CreateEventBusOutputResponse
    /// Called by an SaaS partner to create a partner event source. This operation is not used by Amazon Web Services customers. Each partner event source can be used by one Amazon Web Services account to create a matching partner event bus in that Amazon Web Services account. A SaaS partner must create one partner event source for each Amazon Web Services account that wants to receive those event types. A partner event source creates events based on resources within the SaaS partner's service or application. An Amazon Web Services account that creates a partner event bus that matches the partner event source can use that event bus to receive events from the partner, and then process them using Amazon Web Services Events rules and targets. Partner event source names follow this format:  partner_name/event_namespace/event_name  partner_name is determined during partner registration and identifies the partner to Amazon Web Services customers. event_namespace is determined by the partner and is a way for the partner to categorize their events. event_name is determined by the partner, and should uniquely identify an event-generating resource within the partner system. The combination of event_namespace and event_name should help Amazon Web Services customers decide whether to create an event bus to receive these events.
    func createPartnerEventSource(input: CreatePartnerEventSourceInput) async throws -> CreatePartnerEventSourceOutputResponse
    /// You can use this operation to temporarily stop receiving events from the specified partner event source. The matching event bus is not deleted. When you deactivate a partner event source, the source goes into PENDING state. If it remains in PENDING state for more than two weeks, it is deleted. To activate a deactivated partner event source, use [ActivateEventSource](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ActivateEventSource.html).
    func deactivateEventSource(input: DeactivateEventSourceInput) async throws -> DeactivateEventSourceOutputResponse
    /// Removes all authorization parameters from the connection. This lets you remove the secret from the connection so you can reuse it without having to create a new connection.
    func deauthorizeConnection(input: DeauthorizeConnectionInput) async throws -> DeauthorizeConnectionOutputResponse
    /// Deletes the specified API destination.
    func deleteApiDestination(input: DeleteApiDestinationInput) async throws -> DeleteApiDestinationOutputResponse
    /// Deletes the specified archive.
    func deleteArchive(input: DeleteArchiveInput) async throws -> DeleteArchiveOutputResponse
    /// Deletes a connection.
    func deleteConnection(input: DeleteConnectionInput) async throws -> DeleteConnectionOutputResponse
    /// Delete an existing global endpoint. For more information about global endpoints, see [Making applications Regional-fault tolerant with global endpoints and event replication](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html) in the Amazon EventBridge User Guide.
    func deleteEndpoint(input: DeleteEndpointInput) async throws -> DeleteEndpointOutputResponse
    /// Deletes the specified custom event bus or partner event bus. All rules associated with this event bus need to be deleted. You can't delete your account's default event bus.
    func deleteEventBus(input: DeleteEventBusInput) async throws -> DeleteEventBusOutputResponse
    /// This operation is used by SaaS partners to delete a partner event source. This operation is not used by Amazon Web Services customers. When you delete an event source, the status of the corresponding partner event bus in the Amazon Web Services customer account becomes DELETED.
    func deletePartnerEventSource(input: DeletePartnerEventSourceInput) async throws -> DeletePartnerEventSourceOutputResponse
    /// Deletes the specified rule. Before you can delete the rule, you must remove all targets, using [RemoveTargets](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_RemoveTargets.html). When you delete a rule, incoming events might continue to match to the deleted rule. Allow a short period of time for changes to take effect. If you call delete rule multiple times for the same rule, all calls will succeed. When you call delete rule for a non-existent custom eventbus, ResourceNotFoundException is returned. Managed rules are rules created and managed by another Amazon Web Services service on your behalf. These rules are created by those other Amazon Web Services services to support functionality in those services. You can delete these rules using the Force option, but you should do so only if you are sure the other service is not still using that rule.
    func deleteRule(input: DeleteRuleInput) async throws -> DeleteRuleOutputResponse
    /// Retrieves details about an API destination.
    func describeApiDestination(input: DescribeApiDestinationInput) async throws -> DescribeApiDestinationOutputResponse
    /// Retrieves details about an archive.
    func describeArchive(input: DescribeArchiveInput) async throws -> DescribeArchiveOutputResponse
    /// Retrieves details about a connection.
    func describeConnection(input: DescribeConnectionInput) async throws -> DescribeConnectionOutputResponse
    /// Get the information about an existing global endpoint. For more information about global endpoints, see [Making applications Regional-fault tolerant with global endpoints and event replication](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html) in the Amazon EventBridge User Guide..
    func describeEndpoint(input: DescribeEndpointInput) async throws -> DescribeEndpointOutputResponse
    /// Displays details about an event bus in your account. This can include the external Amazon Web Services accounts that are permitted to write events to your default event bus, and the associated policy. For custom event buses and partner event buses, it displays the name, ARN, policy, state, and creation time. To enable your account to receive events from other accounts on its default event bus, use [PutPermission](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutPermission.html). For more information about partner event buses, see [CreateEventBus](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html).
    func describeEventBus(input: DescribeEventBusInput) async throws -> DescribeEventBusOutputResponse
    /// This operation lists details about a partner event source that is shared with your account.
    func describeEventSource(input: DescribeEventSourceInput) async throws -> DescribeEventSourceOutputResponse
    /// An SaaS partner can use this operation to list details about a partner event source that they have created. Amazon Web Services customers do not use this operation. Instead, Amazon Web Services customers can use [DescribeEventSource](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DescribeEventSource.html) to see details about a partner event source that is shared with them.
    func describePartnerEventSource(input: DescribePartnerEventSourceInput) async throws -> DescribePartnerEventSourceOutputResponse
    /// Retrieves details about a replay. Use DescribeReplay to determine the progress of a running replay. A replay processes events to replay based on the time in the event, and replays them using 1 minute intervals. If you use StartReplay and specify an EventStartTime and an EventEndTime that covers a 20 minute time range, the events are replayed from the first minute of that 20 minute range first. Then the events from the second minute are replayed. You can use DescribeReplay to determine the progress of a replay. The value returned for EventLastReplayedTime indicates the time within the specified time range associated with the last event replayed.
    func describeReplay(input: DescribeReplayInput) async throws -> DescribeReplayOutputResponse
    /// Describes the specified rule. DescribeRule does not list the targets of a rule. To see the targets associated with a rule, use [ListTargetsByRule](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ListTargetsByRule.html).
    func describeRule(input: DescribeRuleInput) async throws -> DescribeRuleOutputResponse
    /// Disables the specified rule. A disabled rule won't match any events, and won't self-trigger if it has a schedule expression. When you disable a rule, incoming events might continue to match to the disabled rule. Allow a short period of time for changes to take effect.
    func disableRule(input: DisableRuleInput) async throws -> DisableRuleOutputResponse
    /// Enables the specified rule. If the rule does not exist, the operation fails. When you enable a rule, incoming events might not immediately start matching to a newly enabled rule. Allow a short period of time for changes to take effect.
    func enableRule(input: EnableRuleInput) async throws -> EnableRuleOutputResponse
    /// Retrieves a list of API destination in the account in the current Region.
    func listApiDestinations(input: ListApiDestinationsInput) async throws -> ListApiDestinationsOutputResponse
    /// Lists your archives. You can either list all the archives or you can provide a prefix to match to the archive names. Filter parameters are exclusive.
    func listArchives(input: ListArchivesInput) async throws -> ListArchivesOutputResponse
    /// Retrieves a list of connections from the account.
    func listConnections(input: ListConnectionsInput) async throws -> ListConnectionsOutputResponse
    /// List the global endpoints associated with this account. For more information about global endpoints, see [Making applications Regional-fault tolerant with global endpoints and event replication](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html) in the Amazon EventBridge User Guide..
    func listEndpoints(input: ListEndpointsInput) async throws -> ListEndpointsOutputResponse
    /// Lists all the event buses in your account, including the default event bus, custom event buses, and partner event buses.
    func listEventBuses(input: ListEventBusesInput) async throws -> ListEventBusesOutputResponse
    /// You can use this to see all the partner event sources that have been shared with your Amazon Web Services account. For more information about partner event sources, see [CreateEventBus](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html).
    func listEventSources(input: ListEventSourcesInput) async throws -> ListEventSourcesOutputResponse
    /// An SaaS partner can use this operation to display the Amazon Web Services account ID that a particular partner event source name is associated with. This operation is not used by Amazon Web Services customers.
    func listPartnerEventSourceAccounts(input: ListPartnerEventSourceAccountsInput) async throws -> ListPartnerEventSourceAccountsOutputResponse
    /// An SaaS partner can use this operation to list all the partner event source names that they have created. This operation is not used by Amazon Web Services customers.
    func listPartnerEventSources(input: ListPartnerEventSourcesInput) async throws -> ListPartnerEventSourcesOutputResponse
    /// Lists your replays. You can either list all the replays or you can provide a prefix to match to the replay names. Filter parameters are exclusive.
    func listReplays(input: ListReplaysInput) async throws -> ListReplaysOutputResponse
    /// Lists the rules for the specified target. You can see which of the rules in Amazon EventBridge can invoke a specific target in your account.
    func listRuleNamesByTarget(input: ListRuleNamesByTargetInput) async throws -> ListRuleNamesByTargetOutputResponse
    /// Lists your Amazon EventBridge rules. You can either list all the rules or you can provide a prefix to match to the rule names. ListRules does not list the targets of a rule. To see the targets associated with a rule, use [ListTargetsByRule](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ListTargetsByRule.html).
    func listRules(input: ListRulesInput) async throws -> ListRulesOutputResponse
    /// Displays the tags associated with an EventBridge resource. In EventBridge, rules and event buses can be tagged.
    func listTagsForResource(input: ListTagsForResourceInput) async throws -> ListTagsForResourceOutputResponse
    /// Lists the targets assigned to the specified rule.
    func listTargetsByRule(input: ListTargetsByRuleInput) async throws -> ListTargetsByRuleOutputResponse
    /// Sends custom events to Amazon EventBridge so that they can be matched to rules. PutEvents will only process nested JSON up to 1100 levels deep.
    func putEvents(input: PutEventsInput) async throws -> PutEventsOutputResponse
    /// This is used by SaaS partners to write events to a customer's partner event bus. Amazon Web Services customers do not use this operation.
    func putPartnerEvents(input: PutPartnerEventsInput) async throws -> PutPartnerEventsOutputResponse
    /// Running PutPermission permits the specified Amazon Web Services account or Amazon Web Services organization to put events to the specified event bus. Amazon EventBridge (CloudWatch Events) rules in your account are triggered by these events arriving to an event bus in your account. For another account to send events to your account, that external account must have an EventBridge rule with your account's event bus as a target. To enable multiple Amazon Web Services accounts to put events to your event bus, run PutPermission once for each of these accounts. Or, if all the accounts are members of the same Amazon Web Services organization, you can run PutPermission once specifying Principal as "*" and specifying the Amazon Web Services organization ID in Condition, to grant permissions to all accounts in that organization. If you grant permissions using an organization, then accounts in that organization must specify a RoleArn with proper permissions when they use PutTarget to add your account's event bus as a target. For more information, see [Sending and Receiving Events Between Amazon Web Services Accounts](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html) in the Amazon EventBridge User Guide. The permission policy on the event bus cannot exceed 10 KB in size.
    func putPermission(input: PutPermissionInput) async throws -> PutPermissionOutputResponse
    /// Creates or updates the specified rule. Rules are enabled by default, or based on value of the state. You can disable a rule using [DisableRule](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DisableRule.html). A single rule watches for events from a single event bus. Events generated by Amazon Web Services services go to your account's default event bus. Events generated by SaaS partner services or applications go to the matching partner event bus. If you have custom applications or services, you can specify whether their events go to your default event bus or a custom event bus that you have created. For more information, see [CreateEventBus](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html). If you are updating an existing rule, the rule is replaced with what you specify in this PutRule command. If you omit arguments in PutRule, the old values for those arguments are not kept. Instead, they are replaced with null values. When you create or update a rule, incoming events might not immediately start matching to new or updated rules. Allow a short period of time for changes to take effect. A rule must contain at least an EventPattern or ScheduleExpression. Rules with EventPatterns are triggered when a matching event is observed. Rules with ScheduleExpressions self-trigger based on the given schedule. A rule can have both an EventPattern and a ScheduleExpression, in which case the rule triggers on matching events as well as on a schedule. When you initially create a rule, you can optionally assign one or more tags to the rule. Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only rules with certain tag values. To use the PutRule operation and assign tags, you must have both the events:PutRule and events:TagResource permissions. If you are updating an existing rule, any tags you specify in the PutRule operation are ignored. To update the tags of an existing rule, use [TagResource](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_TagResource.html) and [UntagResource](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_UntagResource.html). Most services in Amazon Web Services treat : or / as the same character in Amazon Resource Names (ARNs). However, EventBridge uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that they match the ARN syntax in the event you want to match. In EventBridge, it is possible to create rules that lead to infinite loops, where a rule is fired repeatedly. For example, a rule might detect that ACLs have changed on an S3 bucket, and trigger software to change them to the desired state. If the rule is not written carefully, the subsequent change to the ACLs fires the rule again, creating an infinite loop. To prevent this, write the rules so that the triggered actions do not re-fire the same rule. For example, your rule could fire only if ACLs are found to be in a bad state, instead of after any change. An infinite loop can quickly cause higher than expected charges. We recommend that you use budgeting, which alerts you when charges exceed your specified limit. For more information, see [Managing Your Costs with Budgets](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/budgets-managing-costs.html).
    func putRule(input: PutRuleInput) async throws -> PutRuleOutputResponse
    /// Adds the specified targets to the specified rule, or updates the targets if they are already associated with the rule. Targets are the resources that are invoked when a rule is triggered. Each rule can have up to five (5) targets associated with it at one time. You can configure the following as targets for Events:
    ///
    /// * [API destination](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-api-destinations.html)
    ///
    /// * [API Gateway](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-api-gateway-target.html)
    ///
    /// * Batch job queue
    ///
    /// * CloudWatch group
    ///
    /// * CodeBuild project
    ///
    /// * CodePipeline
    ///
    /// * EC2 CreateSnapshot API call
    ///
    /// * EC2 Image Builder
    ///
    /// * EC2 RebootInstances API call
    ///
    /// * EC2 StopInstances API call
    ///
    /// * EC2 TerminateInstances API call
    ///
    /// * ECS task
    ///
    /// * [Event bus in a different account or Region](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-cross-account.html)
    ///
    /// * [Event bus in the same account and Region](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-bus-to-bus.html)
    ///
    /// * Firehose delivery stream
    ///
    /// * Glue workflow
    ///
    /// * [Incident Manager response plan](https://docs.aws.amazon.com/incident-manager/latest/userguide/incident-creation.html#incident-tracking-auto-eventbridge)
    ///
    /// * Inspector assessment template
    ///
    /// * Kinesis stream
    ///
    /// * Lambda function
    ///
    /// * Redshift cluster
    ///
    /// * Redshift Serverless workgroup
    ///
    /// * SageMaker Pipeline
    ///
    /// * SNS topic
    ///
    /// * SQS queue
    ///
    /// * Step Functions state machine
    ///
    /// * Systems Manager Automation
    ///
    /// * Systems Manager OpsItem
    ///
    /// * Systems Manager Run Command
    ///
    ///
    /// Creating rules with built-in targets is supported only in the Amazon Web Services Management Console. The built-in targets are EC2 CreateSnapshot API call, EC2 RebootInstances API call, EC2 StopInstances API call, and EC2 TerminateInstances API call. For some target types, PutTargets provides target-specific parameters. If the target is a Kinesis data stream, you can optionally specify which shard the event goes to by using the KinesisParameters argument. To invoke a command on multiple EC2 instances with one rule, you can use the RunCommandParameters field. To be able to make API calls against the resources that you own, Amazon EventBridge needs the appropriate permissions. For Lambda and Amazon SNS resources, EventBridge relies on resource-based policies. For EC2 instances, Kinesis Data Streams, Step Functions state machines and API Gateway APIs, EventBridge relies on IAM roles that you specify in the RoleARN argument in PutTargets. For more information, see [Authentication and Access Control](https://docs.aws.amazon.com/eventbridge/latest/userguide/auth-and-access-control-eventbridge.html) in the Amazon EventBridge User Guide. If another Amazon Web Services account is in the same region and has granted you permission (using PutPermission), you can send events to that account. Set that account's event bus as a target of the rules in your account. To send the matched events to the other account, specify that account's event bus as the Arn value when you run PutTargets. If your account sends events to another account, your account is charged for each sent event. Each event sent to another account is charged as a custom event. The account receiving the event is not charged. For more information, see [Amazon EventBridge Pricing](http://aws.amazon.com/eventbridge/pricing/). Input, InputPath, and InputTransformer are not available with PutTarget if the target is an event bus of a different Amazon Web Services account. If you are setting the event bus of another account as the target, and that account granted permission to your account through an organization instead of directly by the account ID, then you must specify a RoleArn with proper permissions in the Target structure. For more information, see [Sending and Receiving Events Between Amazon Web Services Accounts](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html) in the Amazon EventBridge User Guide. For more information about enabling cross-account events, see [PutPermission](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutPermission.html). Input, InputPath, and InputTransformer are mutually exclusive and optional parameters of a target. When a rule is triggered due to a matched event:
    ///
    /// * If none of the following arguments are specified for a target, then the entire event is passed to the target in JSON format (unless the target is Amazon EC2 Run Command or Amazon ECS task, in which case nothing from the event is passed to the target).
    ///
    /// * If Input is specified in the form of valid JSON, then the matched event is overridden with this constant.
    ///
    /// * If InputPath is specified in the form of JSONPath (for example, $.detail), then only the part of the event specified in the path is passed to the target (for example, only the detail part of the event is passed).
    ///
    /// * If InputTransformer is specified, then one or more specified JSONPaths are extracted from the event and used as values in a template that you specify as the input to the target.
    ///
    ///
    /// When you specify InputPath or InputTransformer, you must use JSON dot notation, not bracket notation. When you add targets to a rule and the associated rule triggers soon after, new or updated targets might not be immediately invoked. Allow a short period of time for changes to take effect. This action can partially fail if too many requests are made at the same time. If that happens, FailedEntryCount is non-zero in the response and each entry in FailedEntries provides the ID of the failed target and the error code.
    func putTargets(input: PutTargetsInput) async throws -> PutTargetsOutputResponse
    /// Revokes the permission of another Amazon Web Services account to be able to put events to the specified event bus. Specify the account to revoke by the StatementId value that you associated with the account when you granted it permission with PutPermission. You can find the StatementId by using [DescribeEventBus](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DescribeEventBus.html).
    func removePermission(input: RemovePermissionInput) async throws -> RemovePermissionOutputResponse
    /// Removes the specified targets from the specified rule. When the rule is triggered, those targets are no longer be invoked. A successful execution of RemoveTargets doesn't guarantee all targets are removed from the rule, it means that the target(s) listed in the request are removed. When you remove a target, when the associated rule triggers, removed targets might continue to be invoked. Allow a short period of time for changes to take effect. This action can partially fail if too many requests are made at the same time. If that happens, FailedEntryCount is non-zero in the response and each entry in FailedEntries provides the ID of the failed target and the error code.
    func removeTargets(input: RemoveTargetsInput) async throws -> RemoveTargetsOutputResponse
    /// Starts the specified replay. Events are not necessarily replayed in the exact same order that they were added to the archive. A replay processes events to replay based on the time in the event, and replays them using 1 minute intervals. If you specify an EventStartTime and an EventEndTime that covers a 20 minute time range, the events are replayed from the first minute of that 20 minute range first. Then the events from the second minute are replayed. You can use DescribeReplay to determine the progress of a replay. The value returned for EventLastReplayedTime indicates the time within the specified time range associated with the last event replayed.
    func startReplay(input: StartReplayInput) async throws -> StartReplayOutputResponse
    /// Assigns one or more tags (key-value pairs) to the specified EventBridge resource. Tags can help you organize and categorize your resources. You can also use them to scope user permissions by granting a user permission to access or change only resources with certain tag values. In EventBridge, rules and event buses can be tagged. Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as strings of characters. You can use the TagResource action with a resource that already has tags. If you specify a new tag key, this tag is appended to the list of tags associated with the resource. If you specify a tag key that is already associated with the resource, the new tag value that you specify replaces the previous value for that tag. You can associate as many as 50 tags with a resource.
    func tagResource(input: TagResourceInput) async throws -> TagResourceOutputResponse
    /// Tests whether the specified event pattern matches the provided event. Most services in Amazon Web Services treat : or / as the same character in Amazon Resource Names (ARNs). However, EventBridge uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that they match the ARN syntax in the event you want to match.
    func testEventPattern(input: TestEventPatternInput) async throws -> TestEventPatternOutputResponse
    /// Removes one or more tags from the specified EventBridge resource. In Amazon EventBridge (CloudWatch Events), rules and event buses can be tagged.
    func untagResource(input: UntagResourceInput) async throws -> UntagResourceOutputResponse
    /// Updates an API destination.
    func updateApiDestination(input: UpdateApiDestinationInput) async throws -> UpdateApiDestinationOutputResponse
    /// Updates the specified archive.
    func updateArchive(input: UpdateArchiveInput) async throws -> UpdateArchiveOutputResponse
    /// Updates settings for a connection.
    func updateConnection(input: UpdateConnectionInput) async throws -> UpdateConnectionOutputResponse
    /// Update an existing endpoint. For more information about global endpoints, see [Making applications Regional-fault tolerant with global endpoints and event replication](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html) in the Amazon EventBridge User Guide..
    func updateEndpoint(input: UpdateEndpointInput) async throws -> UpdateEndpointOutputResponse
}

public protocol EventBridgeClientConfigurationProtocol : AWSClientRuntime.AWSClientConfiguration {
    var endpointResolver: EndpointResolver { get }
}

public enum EventBridgeClientTypes {}
