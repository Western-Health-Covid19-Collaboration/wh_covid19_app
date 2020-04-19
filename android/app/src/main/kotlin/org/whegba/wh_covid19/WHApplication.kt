package org.whegba.wh_covid19

import io.flutter.app.FlutterApplication
import io.sentry.Sentry
import io.sentry.android.AndroidSentryClientFactory

class WHApplication : FlutterApplication() {

    override fun onCreate() {
        super.onCreate()
        Sentry.init(AndroidSentryClientFactory(this))
    }
}