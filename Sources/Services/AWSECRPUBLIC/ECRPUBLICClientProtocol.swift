// Code generated by smithy-swift-codegen. DO NOT EDIT!

@_spi(FileBasedConfig) import AWSClientRuntime
import ClientRuntime

/// Amazon Elastic Container Registry Public Amazon Elastic Container Registry Public (Amazon ECR Public) is a managed container image registry service. Amazon ECR provides both public and private registries to host your container images. You can use the Docker CLI or your preferred client to push, pull, and manage images. Amazon ECR provides a secure, scalable, and reliable registry for your Docker or Open Container Initiative (OCI) images. Amazon ECR supports public repositories with this API. For information about the Amazon ECR API for private repositories, see [Amazon Elastic Container Registry API Reference](https://docs.aws.amazon.com/AmazonECR/latest/APIReference/Welcome.html).
public protocol ECRPUBLICClientProtocol {
    /// Checks the availability of one or more image layers that are within a repository in a public registry. When an image is pushed to a repository, each image layer is checked to verify if it has been uploaded before. If it has been uploaded, then the image layer is skipped. This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the docker CLI to pull, tag, and push images.
    func batchCheckLayerAvailability(input: BatchCheckLayerAvailabilityInput) async throws -> BatchCheckLayerAvailabilityOutputResponse
    /// Deletes a list of specified images that are within a repository in a public registry. Images are specified with either an imageTag or imageDigest. You can remove a tag from an image by specifying the image's tag in your request. When you remove the last tag from an image, the image is deleted from your repository. You can completely delete an image (and all of its tags) by specifying the digest of the image in your request.
    func batchDeleteImage(input: BatchDeleteImageInput) async throws -> BatchDeleteImageOutputResponse
    /// Informs Amazon ECR that the image layer upload is complete for a specified public registry, repository name, and upload ID. You can optionally provide a sha256 digest of the image layer for data validation purposes. When an image is pushed, the CompleteLayerUpload API is called once for each new image layer to verify that the upload is complete. This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the docker CLI to pull, tag, and push images.
    func completeLayerUpload(input: CompleteLayerUploadInput) async throws -> CompleteLayerUploadOutputResponse
    /// Creates a repository in a public registry. For more information, see [Amazon ECR repositories](https://docs.aws.amazon.com/AmazonECR/latest/userguide/Repositories.html) in the Amazon Elastic Container Registry User Guide.
    func createRepository(input: CreateRepositoryInput) async throws -> CreateRepositoryOutputResponse
    /// Deletes a repository in a public registry. If the repository contains images, you must either manually delete all images in the repository or use the force option. This option deletes all images on your behalf before deleting the repository.
    func deleteRepository(input: DeleteRepositoryInput) async throws -> DeleteRepositoryOutputResponse
    /// Deletes the repository policy that's associated with the specified repository.
    func deleteRepositoryPolicy(input: DeleteRepositoryPolicyInput) async throws -> DeleteRepositoryPolicyOutputResponse
    /// Returns metadata that's related to the images in a repository in a public registry. Beginning with Docker version 1.9, the Docker client compresses image layers before pushing them to a V2 Docker registry. The output of the docker images command shows the uncompressed image size. Therefore, it might return a larger image size than the image sizes that are returned by [DescribeImages].
    func describeImages(input: DescribeImagesInput) async throws -> DescribeImagesOutputResponse
    /// Returns the image tag details for a repository in a public registry.
    func describeImageTags(input: DescribeImageTagsInput) async throws -> DescribeImageTagsOutputResponse
    /// Returns details for a public registry.
    func describeRegistries(input: DescribeRegistriesInput) async throws -> DescribeRegistriesOutputResponse
    /// Describes repositories that are in a public registry.
    func describeRepositories(input: DescribeRepositoriesInput) async throws -> DescribeRepositoriesOutputResponse
    /// Retrieves an authorization token. An authorization token represents your IAM authentication credentials. You can use it to access any Amazon ECR registry that your IAM principal has access to. The authorization token is valid for 12 hours. This API requires the ecr-public:GetAuthorizationToken and sts:GetServiceBearerToken permissions.
    func getAuthorizationToken(input: GetAuthorizationTokenInput) async throws -> GetAuthorizationTokenOutputResponse
    /// Retrieves catalog metadata for a public registry.
    func getRegistryCatalogData(input: GetRegistryCatalogDataInput) async throws -> GetRegistryCatalogDataOutputResponse
    /// Retrieve catalog metadata for a repository in a public registry. This metadata is displayed publicly in the Amazon ECR Public Gallery.
    func getRepositoryCatalogData(input: GetRepositoryCatalogDataInput) async throws -> GetRepositoryCatalogDataOutputResponse
    /// Retrieves the repository policy for the specified repository.
    func getRepositoryPolicy(input: GetRepositoryPolicyInput) async throws -> GetRepositoryPolicyOutputResponse
    /// Notifies Amazon ECR that you intend to upload an image layer. When an image is pushed, the InitiateLayerUpload API is called once for each image layer that hasn't already been uploaded. Whether an image layer uploads is determined by the BatchCheckLayerAvailability API action. This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the docker CLI to pull, tag, and push images.
    func initiateLayerUpload(input: InitiateLayerUploadInput) async throws -> InitiateLayerUploadOutputResponse
    /// List the tags for an Amazon ECR Public resource.
    func listTagsForResource(input: ListTagsForResourceInput) async throws -> ListTagsForResourceOutputResponse
    /// Creates or updates the image manifest and tags that are associated with an image. When an image is pushed and all new image layers have been uploaded, the PutImage API is called once to create or update the image manifest and the tags that are associated with the image. This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the docker CLI to pull, tag, and push images.
    func putImage(input: PutImageInput) async throws -> PutImageOutputResponse
    /// Create or update the catalog data for a public registry.
    func putRegistryCatalogData(input: PutRegistryCatalogDataInput) async throws -> PutRegistryCatalogDataOutputResponse
    /// Creates or updates the catalog data for a repository in a public registry.
    func putRepositoryCatalogData(input: PutRepositoryCatalogDataInput) async throws -> PutRepositoryCatalogDataOutputResponse
    /// Applies a repository policy to the specified public repository to control access permissions. For more information, see [Amazon ECR Repository Policies](https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-policies.html) in the Amazon Elastic Container Registry User Guide.
    func setRepositoryPolicy(input: SetRepositoryPolicyInput) async throws -> SetRepositoryPolicyOutputResponse
    /// Associates the specified tags to a resource with the specified resourceArn. If existing tags on a resource aren't specified in the request parameters, they aren't changed. When a resource is deleted, the tags associated with that resource are also deleted.
    func tagResource(input: TagResourceInput) async throws -> TagResourceOutputResponse
    /// Deletes specified tags from a resource.
    func untagResource(input: UntagResourceInput) async throws -> UntagResourceOutputResponse
    /// Uploads an image layer part to Amazon ECR. When an image is pushed, each new image layer is uploaded in parts. The maximum size of each image layer part can be 20971520 bytes (about 20MB). The UploadLayerPart API is called once for each new image layer part. This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the docker CLI to pull, tag, and push images.
    func uploadLayerPart(input: UploadLayerPartInput) async throws -> UploadLayerPartOutputResponse
}

public protocol ECRPUBLICClientConfigurationProtocol : AWSClientRuntime.AWSClientConfiguration {
    var endpointResolver: EndpointResolver { get }
}

public enum ECRPUBLICClientTypes {}
