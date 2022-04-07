sub init()
    m.firstVideo = m.top.findNode("firstVideo")
    m.firstVideo.observeField("state", "handleState")
end sub

sub setContent()
    print "setContent()"
    
    m.values = m.top.itemContent

    m.firstVideoUrl = m.values.firstVideoUrl
    m.firstVideoTitle = m.values.firstVideoTitle
    m.firstVideoControl = m.values.firstVideoControl
    m.firstVideoStreamFormat = m.values.firstVideoStreamFormat
    m.increaseFirstVideoSize = m.values.increaseFirstVideoSize
    setVideoSize()
    setVideo()
end sub

sub setVideoSize()
    handleincreaseFirstVideoSize()
end sub

function setVideo() as void
    print " setVideo()"
    videoContent = createObject("RoSGNode", "ContentNode")
    videoContent.url = m.firstVideoUrl
    videoContent.title = m.firstVideoTitle
    videoContent.streamformat = m.firstVideoStreamFormat
  
    m.firstVideo.content = videoContent
    m.firstVideo.control = m.firstVideoControl
   
end function


sub handleState()
    print "handleState()"
    print "m.firstVideo.state: "m.firstVideo.state
    if m.firstVideo.state = "finished"
        print "video finished"
        m.firstVideo.control = "stop"
    end if
end sub

sub handleincreaseFirstVideoSize()
    if m.increaseFirstVideoSize = "true"
        m.firstVideo.width = "1580"
        m.firstVideo.height = "900"
        m.firstVideo.translation = "[0,0]"
    else
        m.firstVideo.width = "600"
        m.firstVideo.height = "410"
        m.firstVideo.translation = "[-30,0]"
    end if
end sub
