sub init()
    m.secondVideo = m.top.findNode("secondVideo")
    m.secondVideo.observeField("state", "handleState2")
end sub

sub setContent2()
    print "setContent2()"
    
    m.values = m.top.itemContent

    m.secondVideoUrl = m.values.secondVideoUrl
    m.secondVideoTitle = m.values.secondVideoTitle
    m.secondVideoControl = m.values.secondVideoControl
    m.secondVideoStreamFormat = m.values.secondVideoStreamFormat
    m.increaseSecondVideoSize = m.values.increaseSecondVideoSize
    setVideoSize2()
    setVideo2()
end sub

sub setVideoSize2()
    handleIncreaseSecondVideoSize2()
end sub

function setVideo2() as void
    print " setVideo2()"
    videoContent = createObject("RoSGNode", "ContentNode")
    videoContent.url = m.secondVideoUrl
    videoContent.title = m.secondVideoTitle
    videoContent.streamformat = m.secondVideoStreamFormat
  
    m.secondVideo.content = videoContent
    m.secondVideo.control = m.secondVideoControl
    print "m.secondVideo.control: "m.secondVideo.control
end function


sub handleState2()
    print "handleState2()"
    print "m.secondVideo.state: "m.secondVideo.state
    if m.secondVideo.state = "finished"
        print "m.secondVideo.state = finished"
        m.secondVideo.control = "stop"
        print "m.secondVideo.control = stop"
    else if m.secondVideo.state = "error"
        print "m.secondVideo.errorCode: "m.secondVideo.errorCode
        print "m.secondVideo.errorMsg: "m.secondVideo.errorMsg
        print "m.secondVideo.errorStr: "m.secondVideo.errorStr
    else if m.secondVideo.state = "play"
        print "playing"
    end if
end sub

' sub onVideoReceivedFocus2(event)
'     shouldPlay = event.getData()
'     if shouldPlay = true
'         m.secondVideo.control = "play"
'     else
'         m.secondVideo.control = "stop"
'     end if
' end sub

sub handleIncreaseSecondVideoSize2()
    print "handleIncreaseSecondVideoSize2()"
    if m.increaseSecondVideoSize = "true"
        print "............"
        print "m.increaseSecondVideoSize = true"
        print "m.secondVideoTitle: "m.secondVideoTitle
        m.secondVideo.width = "1600"
        m.secondVideo.height = "1000"
    else
        print "............"
        print " m.increaseSecondVideoSize = false"
        print "m.secondVideoTitle: "m.secondVideoTitle
        m.secondVideo.width = "295"
        m.secondVideo.height = "200"
    end if
end sub


