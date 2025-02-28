package com.youtubeaudiomicronaut.service;

import jakarta.inject.Singleton;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;

@Singleton
@Slf4j
public class YouTubeAudioService {
    public void downloadAudio(String videoUrl) {
        var commandAndArgs = new String[]{ "yt-dlp", "-x", "--audio-format", "mp3", videoUrl };

        try {
            Process process = Runtime.getRuntime().exec(commandAndArgs);
            process.waitFor();
            log.info("Download completed for {}", videoUrl);
        } catch (IOException | InterruptedException e) {
            log.error("Error downloading audio for video: {}", videoUrl, e);
        }
    }
}
