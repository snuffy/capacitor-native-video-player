import Foundation
import PIPKit

@objc public class Nvp: NSObject {
    @objc public func echo(_ value: String) -> String {
        return value
    }

    @objc public func start(_ playData: [[String:String]]) -> Void {
        
        var playlist: [MediaItem] = [MediaItem(title:"hoge", album: "hoge", source: URL(string: "https://storage.googleapis.com/opcwc-295403.appspot.com/hls/M2I1MTM0MGQtMTYzZS00ZGZiLTljNjMtODRhYmFmN2E0MmU0/video.m3u8")!)]
//        playData.forEach { (item) in
//            guard let title = item["title"]?.removingPercentEncoding,
//                let album = item["album"]?.removingPercentEncoding,
//                let source = item["source"]?.removingPercentEncoding
//            else {return}
//
//            // source が web なのか file なのかを判定する
//            let regularURL = source.replacingOccurrences(of: "file://", with: "")
//            var url: URL?
//            //
//            if regularURL.contains("http://") || regularURL.contains("https://") {
//                url = URL(string: regularURL)
//            }
//            else {
//                url = URL(fileURLWithPath: regularURL)
//            }
//            guard let sourceURL = url else {return}
//
//            let m = MediaItem(title: title, album: album, source: sourceURL)
//            playlist.append(m)
//        }
        if #available(iOS 11.0, *) {
            let vc = CDVNativeVideoPlayerLayoutViewController()
            vc.playlist = playlist
            PIPKit.show(with: vc)
        }
    }
}
