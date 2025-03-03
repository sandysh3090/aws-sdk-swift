// Code generated by smithy-swift-codegen. DO NOT EDIT!

@_spi(FileBasedConfig) import AWSClientRuntime
import ClientRuntime

/// The frontend service for Cryo Storage.
public protocol BackupStorageClientProtocol {
    /// Delete Object from the incremental base Backup.
    func deleteObject(input: DeleteObjectInput) async throws -> DeleteObjectOutputResponse
    /// Gets the specified object's chunk.
    func getChunk(input: GetChunkInput) async throws -> GetChunkOutputResponse
    /// Get metadata associated with an Object.
    func getObjectMetadata(input: GetObjectMetadataInput) async throws -> GetObjectMetadataOutputResponse
    /// List chunks in a given Object
    func listChunks(input: ListChunksInput) async throws -> ListChunksOutputResponse
    /// List all Objects in a given Backup.
    func listObjects(input: ListObjectsInput) async throws -> ListObjectsOutputResponse
    /// Complete upload
    func notifyObjectComplete(input: NotifyObjectCompleteInput) async throws -> NotifyObjectCompleteOutputResponse
    /// Upload chunk.
    func putChunk(input: PutChunkInput) async throws -> PutChunkOutputResponse
    /// Upload object that can store object metadata String and data blob in single API call using inline chunk field.
    func putObject(input: PutObjectInput) async throws -> PutObjectOutputResponse
    /// Start upload containing one or many chunks.
    func startObject(input: StartObjectInput) async throws -> StartObjectOutputResponse
}

public protocol BackupStorageClientConfigurationProtocol : AWSClientRuntime.AWSClientConfiguration {
    var endpointResolver: EndpointResolver { get }
}

public enum BackupStorageClientTypes {}
