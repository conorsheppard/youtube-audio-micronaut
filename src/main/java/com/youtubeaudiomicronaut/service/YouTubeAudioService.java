package com.youtubeaudiomicronaut.service;

import jakarta.inject.Singleton;
import lombok.extern.slf4j.Slf4j;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

@Slf4j
@Singleton
public class YouTubeAudioService {
    public void downloadAudio(String videoUrl) {
        log.info("Received request to download {}", videoUrl);
        try {
            var commandAndArgs = new String[]{ "yt-dlp", "-x", "--audio-format", "mp3", videoUrl };
            ProcessBuilder processBuilder = new ProcessBuilder(commandAndArgs);
            processBuilder.redirectErrorStream(true); // Merge stdout & stderr

            Process process = processBuilder.start();

            // Read output from yt-dlp
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    log.info("[yt-dlp] {}", line);
                }
            }

            int exitCode = process.waitFor();
            if (exitCode == 0) {
                log.info("Download completed successfully!");
            } else {
                log.error("Download failed with exit code {}", exitCode);
            }
        } catch (Exception e) {
            log.error("Error while downloading audio", e);
        }

//        try {
//            Process process = Runtime.getRuntime().exec(commandAndArgs);
//            process.waitFor();
//            log.info("Download completed for {}", videoUrl);
//        } catch (IOException | InterruptedException e) {
//            log.error("Error downloading audio for video: {}", videoUrl, e);
//        }
    }
}
