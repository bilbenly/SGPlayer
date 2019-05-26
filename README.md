## FFmpeg video player view for MacOS 10.10 or newer.
This is a fork from https://github.com/libobjc/SGPlayer to support latest FFmpeg (4.1.3)

## How to embed to your XCode project

### 1. Getting sources code
```
git clone https://github.com/bilbenly/SGPlayer.git
cd SGPlayer
git submodule update --init --recursive
```
### 2. Build
- Open XCode project SGPlayer.xcodeproj
- Add your FFmpeg .a or .dylib libraries
- Build the project
- Build results are SGPlayer.framework and SGPlatform.framework

### 3. Integrating with your project:
Add following libraries to your XCode project:

- SGPlayer.framework
- SGPlatform.framework
- FFmpeg .dylib or .a files and their dependencies
- CoreMedia.framework
- AudioToolbox.framework
- VideoToolbox.framework
- VideoDecodeAcceleration.framework
- ibiconv.2.tbd
- libbz2.1.0.tbd
- libz.1.tbd
- liblzma.tbd

### 4. Add video view to your view controller:

```swift
import SGPlayer

@IBOutlet weak var videoView:NSView! //video container view
var videoPlayer:SGPlayer!

override func viewDidLoad() {
  videoPlayer = SGPlayer()
  
  //add player view
  videoView.addSubview(videoPlayer.view)
        videoPlayer.view.translatesAutoresizingMaskIntoConstraints = false
        var constraint = NSLayoutConstraint(item: videoPlayer.view, attribute: .top, relatedBy: .equal, toItem: videoView,  attribute: .top, multiplier: 1.0, constant: 0.0)
  videoView.addConstraint(constraint)
  
  constraint = NSLayoutConstraint(item: videoPlayer.view, attribute: .left, relatedBy: .equal, toItem: videoView, attribute: .left, multiplier: 1.0, constant: 0.0)
  videoView.addConstraint(constraint)
        
  constraint = NSLayoutConstraint(item: videoPlayer.view, attribute: .right, relatedBy: .equal, toItem: videoView, attribute: .right, multiplier: 1.0, constant: 0.0)
        videoView.addConstraint(constraint)
  constraint = NSLayoutConstraint(item: videoPlayer.view, attribute: .bottom, relatedBy: .equal, toItem: videoView, attribute: .bottom, multiplier: 1.0, constant: 0.0)
  videoView.addConstraint(constraint)
  
  //configure player
  videoPlayer.decoder = SGPlayerDecoder.byFFmpeg()
  
  //play a video
  let url = URL(fileURLWithPath: filepath)
  videoPlayer.replaceVideo(with: url)
  videoPlayer.play()
}
```