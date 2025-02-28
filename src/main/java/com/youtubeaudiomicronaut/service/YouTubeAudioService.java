package com.youtubeaudiomicronaut.service;

import jakarta.inject.Singleton;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;

@Slf4j
@Singleton
public class YouTubeAudioService {
    public void downloadAudio(String videoUrl) {
        log.info("Received request to download {}", videoUrl);
//        var commandAndArgs = new String[]{ "yt-dlp", "-x", "--audio-format", "mp3", videoUrl };
        var commandAndArgs = "yt-dlp -x --audio-format mp3" + videoUrl ;

        try {
            Process process = Runtime.getRuntime().exec(commandAndArgs);
            process.waitFor();
            log.info("Download completed for {}", videoUrl);
        } catch (IOException | InterruptedException e) {
            log.error("Error downloading audio for video: {}", videoUrl, e);
        }
    }
}
