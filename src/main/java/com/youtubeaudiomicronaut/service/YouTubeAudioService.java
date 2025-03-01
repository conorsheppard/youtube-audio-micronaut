package com.youtubeaudiomicronaut.service;

import jakarta.inject.Singleton;
import lombok.extern.slf4j.Slf4j;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;

@Slf4j
@Singleton
public class YouTubeAudioService {
    public void downloadAudio(String videoUrl) {
        try {
            String outputPath = System.getProperty("user.dir") + "/tmp/%(title)s.%(ext)s";
            outputPath = outputPath.replace(" ", "\\ "); // Handle spaces in paths
            var commandAndArgs = new String[]{ "yt-dlp", "-x", "--audio-format", "mp3", "-o", outputPath, videoUrl };
            log.info("Downloading audio to: {}", outputPath);
            log.info("Executing command: {}", String.join(" ", commandAndArgs));
            ProcessBuilder processBuilder = new ProcessBuilder(commandAndArgs);
            processBuilder.directory(new File(System.getProperty("user.home") + "/Downloads")); // Ensure working directory is set correctly
            processBuilder.redirectErrorStream(true);


            Process process = processBuilder.start();

            try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
                reader.lines().forEach(line -> log.info("[yt-dlp] {}", line));
            }

            int exitCode = process.waitFor();
            if (exitCode == 0) log.info("yt-dlp exited without error");
            else log.error("Download failed with exit code {}", exitCode);
        } catch (Exception e) {
            log.error("Error while downloading audio", e);
        }
    }
}
