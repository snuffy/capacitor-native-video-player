import Foundation
import PIPKit

@objc public class Nvp: NSObject {
    @objc public func echo(_ value: String) -> String {
        return value
    }

    @objc public func start(_ playData: [[String:String]]) -> Void {
        
        var playlist: [MediaItem] = []
        
        playData.forEach { (item) in
            guard let title = item["title"]?.removingPercentEncoding,
                let album = item["album"]?.removingPercentEncoding
            else {return}
            
            let urlString = item["url"]?.removingPercentEncoding
            let filePath = item["filePath"]?.removingPercentEncoding
            
            if urlString == nil && filePath == nil {return}
            
            // path を取得
            var path: URL?
            if (filePath != nil) {
                var documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                documentPath.appendPathComponent(filePath!, isDirectory: false)
                path = documentPath
            }
            
            // URL があれば URL
            var url: URL?
            if (urlString != nil) && (urlString!.contains("http://") || urlString!.contains("https://")) {
                url = URL(string: urlString!)
            }
            
            if (path != nil) {
                guard let sourceURL = path else {return}
                let m = MediaItem(title: title, album: album, source: sourceURL)
                playlist.append(m)
            }
            else if (url != nil) {
                guard let sourceURL = url else {return}
                let m = MediaItem(title: title, album: album, source: sourceURL)
                playlist.append(m)
            }
            
        }
        if #available(iOS 11.0, *) {
            DispatchQueue.main.sync {
                let vc = CDVNativeVideoPlayerLayoutViewController()
                vc.playlist = playlist
                PIPKit.show(with: vc)
            }
        }
    }
}
    
