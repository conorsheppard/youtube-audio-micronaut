SHELL := /bin/bash

default: run

clean:
	mvn clean

run:
	java -jar target/youtube-audio-micronaut-0.1.jar $(link)

mvn-run:
	mvn mn:run $(link)

build:
	mvn clean package -DskipTests

build-native-manually:
	# Compile the native image manually
	native-image -jar target/youtube-audio-micronaut-*.jar \
		--no-fallback \
		--initialize-at-build-time=ch.qos.logback.classic.Logger \
		--initialize-at-build-time=ch.qos.logback.core.spi.AppenderAttachableImpl \
		--initialize-at-build-time=ch.qos.logback.classic.LoggerContext \
		--trace-object-instantiation=ch.qos.logback.core.util.COWArrayList \
		--initialize-at-build-time=io.netty.channel.AbstractChannel \
		--initialize-at-build-time=ch.qos.logback.classic.spi.TurboFilterList


build-native-container:
	mvn package -Dpackaging=native-image

mn-docker-native:
	mvn -e mn:docker-native

cli-debug-run:
	java -Dpicocli.trace=DEBUG -jar target/youtube-audio-micronaut-0.1.jar "https://www.youtube.com/watch?v=NhHQSvVVBfM"

.SILENT:
.PHONY: default clean run build build-native-manually build-native-container mn-docker-native cli-debug-run
