package com.youtubeaudiomicronaut;

import io.micronaut.runtime.EmbeddedApplication;
import io.micronaut.test.extensions.junit5.annotation.MicronautTest;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

import jakarta.inject.Inject;

@MicronautTest
class YoutubeAudioMicronautTest {
    @Inject
    EmbeddedApplication<?> application;

    public YoutubeAudioMicronautTest() {
        System.setProperty("micronaut.server.port", "0");
    }

    @Test
    void testItWorks() {
        Assertions.assertTrue(application.isRunning());
    }
}
