package com.youtubeaudiomicronaut.command;

import com.youtubeaudiomicronaut.service.YouTubeAudioService;
import jakarta.inject.Inject;
import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;

@Command(name = "download-audio", description = "Downloads audio from a YouTube video")
public class YouTubeAudioCommand implements Runnable {
    @Inject
    private YouTubeAudioService youTubeAudioService;

    @Parameters(index = "0", description = "YouTube video URL")
    private String videoUrl;

    @Override
    public void run() {
        youTubeAudioService.downloadAudio(videoUrl);
    }
}
