package jp.snuffy.cap.plugins.nvp

import com.google.gson.annotations.SerializedName

data class MediaItem(
        @SerializedName("title") var title: String? = null,
        @SerializedName("album") var album: String? = null,
        @SerializedName("source") var source: String? = null,
        @SerializedName("url") var url: String? = null,
        @SerializedName("filePath") var filePath: String? = null

) {
    companion object {
        const val MEDIA_ITEMS_EXTRA = "media_items_extra"
    }
}