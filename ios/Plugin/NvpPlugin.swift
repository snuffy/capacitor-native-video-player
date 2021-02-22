import Foundation
import Capacitor
import AVFoundation
import PIPKit



@objc(NvpPlugin)
public class NvpPlugin: CAPPlugin {
    private let implementation = Nvp()
    // call object
    private var playerStartCall: CAPPluginCall?

    // load
    override public func load() {
        // setup audio session
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            UIApplication.shared.beginReceivingRemoteControlEvents()
            // for close event
//            NotificationCenter.default.addObserver(self, selector: #selector(close), name: Notification.Name.CDVNVPDidClose, object: nil)
        }
        catch {
            // TODO error
        }
    }
    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    // start player
    @objc func start(_ call: CAPPluginCall) {
        playerStartCall = call
        
        guard let playlist = call.getArray("playlist", [String:String].self) else {
                call.reject("couldn't load playlist")
                return
            }
        implementation.start(playlist)
        call.resolve()
    }

    
}
