# YouTube Audio Downloader (Micronaut)

## Overview
Cloud-native Micronaut application that downloads audio from YouTube videos using `yt-dlp`.  
Java wrapper around `yt-dlp` that enables cloud deployment of containerised download jobs - it's part of a larger application currently under development.  
It is optimized for GraalVM native image and designed for deployment in a Kubernetes cluster.

## Features
- Downloads audio from YouTube videos in `mp3` format
- Reads video URLs from a  command-line input using Picocli (planned: Kafka queue read)
- Uses `yt-dlp` for audio extraction
- Optimized for GraalVM native image
- Uses Picocli for command-line parsing and execution

## Prerequisites
- Java 17+ (developed with Java 23)
- Micronaut 4+
- Maven
- `yt-dlp` installed (`brew install yt-dlp` on macOS, or install from [yt-dlp GitHub](https://github.com/yt-dlp/yt-dlp))
- (Optional) Docker and Kubernetes for deployment

## Installation
Clone the repository:
```sh
git clone https://github.com/your-repo/youtube-audio-micronaut.git
cd youtube-audio-micronaut
```

Build the application:
```sh
make clean build
```

## Usage
Run the application:
```sh
./shell/run.sh "https://www.youtube.com/watch?v=example"
```

## Deployment
To build a GraalVM native image:
```sh
mvn package -Pnative
```


## File Downloads

The downloaded audio files are saved in the current working directory of the application under:

```text
/tmp/
```

Each file is saved in the format:
```text
<title>.mp3
```