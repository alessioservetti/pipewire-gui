enum PwNodeType {
  audioSink, // Audio/Sink
  audioSource, // Audio/Source, Audio/Source/Virtual
  audioDuplex, // Audio/Duplex
  audioStreamOutput, // Stream/Output/Audio (apps that play)
  audioStreamInput, // Stream/Input/Audio (apps that record, loopback capture)
  midiBridge, // Midi/Bridge
  video, // Video/*, Stream/*/Video
  other, // drivers, unknown
}
