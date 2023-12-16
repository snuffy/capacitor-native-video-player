package jp.snuffy.cap.plugins.nvp

import android.content.Intent
import com.getcapacitor.*
import android.util.Log
import com.google.android.exoplayer2.Player
import com.google.android.exoplayer2.ui.PlayerNotificationManager
import com.google.gson.GsonBuilder
import java.net.URLDecoder


@NativePlugin(name = "Nvp")
class NvpPlugin : Plugin() {
    companion object {
        private const val TAG = "CapNativeVideoPlayer"
    }
    private val implementation = Nvp()

    @PluginMethod
    fun echo(call: PluginCall) {
        val value = call.getString("value")
        val ret = JSObject()
        ret.put("value", implementation.echo(value))
        call.resolve(ret)
    }

    @PluginMethod
    fun start(call: PluginCall) {
        val playlist = call.getArray("playlist")
        GsonBuilder().create().also { gson ->
            var items = gson.fromJson(playlist.toString(), Array<MediaItem>::class.java).toList()
            items = items.map { it ->
                if (it.url != null) {
                    Log.d(TAG, "MediaItem for Stream file: ${URLDecoder.decode(it.url, "UTF-8")}")
                }
                if (it.filePath != null) {
                    Log.d(TAG, "MediaItem local file: ${URLDecoder.decode(it.filePath, "UTF-8")}")
                    Log.d(TAG, "MediaItem local file: ${it.filePath}")
                    it.filePath = it.filePath?.replace("file://", "").toString()
                }

                it
            }

            val intent = Intent(activity.application, PlayerActivity::class.java)
            intent.putExtra(MediaItem.MEDIA_ITEMS_EXTRA, gson.toJson(items))
            activity.startActivity(intent)
            call.resolve()
        } ?: run {
            call.reject("error")
        }

    }


}