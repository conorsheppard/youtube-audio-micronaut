SHELL := /bin/bash

default: run

clean:
	mvn clean

run:
	java -jar target/youtube-audio-micronaut-0.1.jar "https://www.youtube.com/watch?v=NhHQSvVVBfM"

build:
	mvn clean package -DskipTests

cli-debug-run:
	java -Dpicocli.trace=DEBUG -jar target/youtube-audio-micronaut-0.1.jar "https://www.youtube.com/watch?v=NhHQSvVVBfM"


.SILENT:
.PHONY: default clean run build cli-debug-run