package com.youtubeaudiomicronaut;


import com.youtubeaudiomicronaut.command.YouTubeAudioCommand;
import io.micronaut.configuration.picocli.PicocliRunner;

public class Application {

    public static void main(String[] args) {
        PicocliRunner.run(YouTubeAudioCommand.class, args);
    }
}
