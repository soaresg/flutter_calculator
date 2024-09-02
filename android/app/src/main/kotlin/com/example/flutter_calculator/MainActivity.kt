package com.example.flutter_calculator

import android.content.pm.ActivityInfo
import android.content.res.Configuration
import android.os.Bundle
import android.os.PersistableBundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.EventChannel.StreamHandler
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private var events: EventSink? = null
    private var oldConfig: Configuration? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        oldConfig = Configuration(context.resources.configuration)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "calculator/channel"
        ).setStreamHandler(object: StreamHandler {
            override fun onListen(arguments: Any?, es: EventSink?) {
                events = es
                events?.success(isDarkMode(oldConfig))
            }

            override fun onCancel(arguments: Any?) {
                TODO("Not yet implemented")
            }

        });
    }

    override fun onConfigurationChanged(newConfig: Configuration) {
        super.onConfigurationChanged(newConfig)
        if(isDarkModeConfigUpdated(newConfig)) {
            events?.success(isDarkMode(newConfig))
        }
        oldConfig = Configuration(newConfig)
    }

    private fun isDarkModeConfigUpdated(config: Configuration): Boolean {
        return (config.diff(oldConfig) and ActivityInfo.CONFIG_UI_MODE) != 0 && isDarkMode(config) != isDarkMode(oldConfig);
    }

    private fun isDarkMode(config: Configuration?): Boolean {
        return config!!.uiMode and Configuration.UI_MODE_NIGHT_MASK == Configuration.UI_MODE_NIGHT_YES
    }
}
