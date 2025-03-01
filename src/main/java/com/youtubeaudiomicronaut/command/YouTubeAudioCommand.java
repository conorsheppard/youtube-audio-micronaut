package com.youtubeaudiomicronaut.command;

import com.youtubeaudiomicronaut.service.YouTubeAudioService;
import jakarta.inject.Inject;
import jakarta.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;

@Slf4j
@Singleton
@Command(name = "download-audio", description = "Downloads audio from a YouTube video", mixinStandardHelpOptions = true)
public class YouTubeAudioCommand implements Runnable {
    @Inject
    private YouTubeAudioService youTubeAudioService;

    @Parameters(index = "0", description = "YouTube video URL", arity = "1")
    private String videoUrl;

    @Override
    public void run() {
        youTubeAudioService.downloadAudio(videoUrl);
    }
}
