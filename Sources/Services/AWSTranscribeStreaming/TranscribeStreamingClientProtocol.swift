// Code generated by smithy-swift-codegen. DO NOT EDIT!

@_spi(FileBasedConfig) import AWSClientRuntime
import ClientRuntime

/// Amazon Transcribe streaming offers three main types of real-time transcription: Standard, Medical, and Call Analytics.
///
/// * Standard transcriptions are the most common option. Refer to for details.
///
/// * Medical transcriptions are tailored to medical professionals and incorporate medical terms. A common use case for this service is transcribing doctor-patient dialogue in real time, so doctors can focus on their patient instead of taking notes. Refer to for details.
///
/// * Call Analytics transcriptions are designed for use with call center audio on two different channels; if you're looking for insight into customer service calls, use this option. Refer to for details.
public protocol TranscribeStreamingClientProtocol {
    /// Starts a bidirectional HTTP/2 or WebSocket stream where audio is streamed to Amazon Transcribe and the transcription results are streamed to your application. Use this operation for [Call Analytics](https://docs.aws.amazon.com/transcribe/latest/dg/call-analytics.html) transcriptions. The following parameters are required:
    ///
    /// * language-code
    ///
    /// * media-encoding
    ///
    /// * sample-rate
    ///
    ///
    /// For more information on streaming with Amazon Transcribe, see [Transcribing streaming audio](https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html).
    func startCallAnalyticsStreamTranscription(input: StartCallAnalyticsStreamTranscriptionInput) async throws -> StartCallAnalyticsStreamTranscriptionOutputResponse
    /// Starts a bidirectional HTTP/2 or WebSocket stream where audio is streamed to Amazon Transcribe Medical and the transcription results are streamed to your application. The following parameters are required:
    ///
    /// * language-code
    ///
    /// * media-encoding
    ///
    /// * sample-rate
    ///
    ///
    /// For more information on streaming with Amazon Transcribe Medical, see [Transcribing streaming audio](https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html).
    func startMedicalStreamTranscription(input: StartMedicalStreamTranscriptionInput) async throws -> StartMedicalStreamTranscriptionOutputResponse
    /// Starts a bidirectional HTTP/2 or WebSocket stream where audio is streamed to Amazon Transcribe and the transcription results are streamed to your application. The following parameters are required:
    ///
    /// * language-code or identify-language
    ///
    /// * media-encoding
    ///
    /// * sample-rate
    ///
    ///
    /// For more information on streaming with Amazon Transcribe, see [Transcribing streaming audio](https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html).
    func startStreamTranscription(input: StartStreamTranscriptionInput) async throws -> StartStreamTranscriptionOutputResponse
}

public protocol TranscribeStreamingClientConfigurationProtocol : AWSClientRuntime.AWSClientConfiguration {
    var endpointResolver: EndpointResolver { get }
}

public enum TranscribeStreamingClientTypes {}
