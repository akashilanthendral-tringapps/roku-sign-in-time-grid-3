sub init()

    m.firstVideoMUG = m.top.findNode("firstVideoMUG")
    m.firstVideoMUG.observeField("itemFocused", "onFirstVideoMUGFocused")
    m.secondVideoMUG = m.top.findNode("secondVideoMUG")
    m.secondVideoMUG.observeField("itemFocused", "onSecondVideoMUGFocused")
    m.secondVideoMUG.observeField("itemUnfocused", "onSecondVideoMUGUnfocused")
    m.secondVideoMUG.observeField("itemSelected", "onSecondVideoMUGSelected")
    m.outerLayoutGroup = m.top.findNode("outerLayoutGroup")

    m.firstVideoMUG.observeField("itemSelected", "onFirstVideoMUGSelected")

    m.isFirstVideoEnlarged = false
    m.isSecondVideoEnlarged = false
    m.isFirstTimeInsideOnSecondVideoMUGFocused = true

end sub

sub onSecondVideoMUGUnfocused()
   
    print "onSecondVideoMUGUnfocused()"
   
    m.lastFocusedItemOfSecondVideo.secondVideoControl = "stop"
end sub

sub onFirstVideoMUGFocused()
    if m.firstVideoMUG.hasFocus()
        m.firstVideoChildContent.firstVideoControl = "play"
    end if
end sub

sub onSecondVideoMUGFocused()
    m.focusedItemIndex = m.secondVideoMUG.itemFocused
    print "-------------------------------"
    print "m.focusedItemIndex: "m.focusedItemIndex
    print "-------------------------------"
    print "m.focusedItem: "m.focusedItem
    print "-------------------------------"
    m.focusedItem = m.secondVideoMUG.content.getChild(m.focusedItemIndex)
    if m.isFirstTimeInsideOnSecondVideoMUGFocused
        print "first time"
        m.lastFocusedItemOfSecondVideo = m.focusedItem
        m.focusedItem.secondVideoControl = "play"
        m.isFirstTimeInsideOnSecondVideoMUGFocused = false
    else
        print "not first time"
        m.lastFocusedItemOfSecondVideo.secondVideoControl = "stop"
        m.lastFocusedItemOfSecondVideo = m.focusedItem
        m.focusedItem.secondVideoControl = "play"
    end if
end sub

sub setLayoutGroupTranslation(leftOrCenter)
    if leftOrCenter = "left"
        m.outerLayoutGroup.translation = "[230,0]"
    else 
        m.outerLayoutGroup.translation = "[300, 400]"
    end if
   
end sub

sub setLayoutGroupTranslationForSecondVideo(leftOrCenter)
    if leftOrCenter = "left"
        m.outerLayoutGroup.translation = "[230,0]"
    else 
        m.outerLayoutGroup.translation = "[300, 400]"
    end if
end sub

sub setIsFirstVideoEnlarged(value)
    m.isFirstVideoEnlarged = value
end sub

sub setIsSecondVideoEnlarged(value)
    m.isSecondVideoEnlarged = value
end sub

function getIsFirstVideoEnlarged() as boolean
    return m.isFirstVideoEnlarged
end function

function getIsSecondVideoEnlarged() as boolean
    return m.isSecondVideoEnlarged
end function

sub setFirstVideoMarkUpGridItemSize()
    if getIsFirstVideoEnlarged()
        m.firstVideoMUG.itemSize = "[1580, 900]"
    else
        m.firstVideoMUG.itemSize = "[540, 410]"
    end if
end sub

sub setSecondVideoMarkUpGridItemSize()
    if getIsSecondVideoEnlarged()
        m.secondVideoMUG.itemSize = "[1580, 900]"
    else
        m.secondVideoMUG.itemSize = "[540, 410]"
    end if
end sub

sub onFirstVideoMUGSelected()
    print "onFirstMUGSelected()"
    setIsFirstVideoEnlarged(true)
    setLayoutGroupTranslation("left")
    setFirstVideoMarkUpGridItemSize()
    m.firstVideoChildContent.increaseFirstVideoSize = "true"
end sub
sub onSecondVideoMUGSelected()
    ' setIsSecondVideoEnlarged(true)
    ' setLayoutGroupTranslation("left")
    ' setSecondVideoMarkUpGridItemSize()
    ' childSelected = m.secondVideoMUG.content.getChild(m.secondVideoMUG.itemSelected)
    ' print "childSelected: "childSelected
    ' childSelected.increaseSecondVideoSize = "true"
    
end sub

function getFirstVideoDetails() as object
    firstVideoDetails = {
        "url": "https://roku.s.cpl.delvenetworks.com/media/59021fabe3b645968e382ac726cd6c7b/60b4a471ffb74809beb2f7d5a15b3193/roku_ep_111_segment_1_final-cc_mix_033015-a7ec8a288c4bcec001c118181c668de321108861.m3u8",
        "title" : "Test Video",
        "streamformat" : "hls",
        "control": "play"
    }
    return firstVideoDetails
end function

function getSecondVideoDetails() as object
    secondVideoDetails = {
        "url": "https://roku.s.cpl.delvenetworks.com/media/59021fabe3b645968e382ac726cd6c7b/60b4a471ffb74809beb2f7d5a15b3193/roku_ep_111_segment_1_final-cc_mix_033015-a7ec8a288c4bcec001c118181c668de321108861.m3u8",
        "title" : "Test Video",
        "streamformat" : "hls",
        "control": "play"
    }
    return secondVideoDetails
end function


sub renderFirstVideoComponent()

    firstVideoDetails = getFirstVideoDetails()
    m.firstVideoParentContent = CreateObject("roSGNode", "ContentNode")
    m.firstVideoChildContent = m.firstVideoParentContent.createChild("firstVideoItemField")
    m.firstVideoChildContent.firstVideoUrl = firstVideoDetails.url
    m.firstVideoChildContent.firstVideoTitle = firstVideoDetails.title
    m.firstVideoChildContent.firstVideoStreamFormat = firstVideoDetails.streamFormat
    m.firstVideoChildContent.firstVideoControl = firstVideoDetails.control
    m.firstVideoChildContent.increaseFirstVideoSize = "false"
    m.firstVideoMUG.content = m.firstVideoParentContent

end sub

sub renderSecondVideoComponent()
    'secondVideoDetails = getSecondVideoDetails()
    secondVideoDetails = [
        {
            "url": "https://roku.s.cpl.delvenetworks.com/media/59021fabe3b645968e382ac726cd6c7b/60b4a471ffb74809beb2f7d5a15b3193/roku_ep_111_segment_1_final-cc_mix_033015-a7ec8a288c4bcec001c118181c668de321108861.m3u8",
            "title" : "Test Video 1",
            "streamformat" : "hls",
            "control": "none"
        },
        {
            "url": "https://roku.s.cpl.delvenetworks.com/media/59021fabe3b645968e382ac726cd6c7b/60b4a471ffb74809beb2f7d5a15b3193/roku_ep_111_segment_1_final-cc_mix_033015-a7ec8a288c4bcec001c118181c668de321108861.m3u8",
            "title" : "Test Video 2",
            "streamformat" : "hls",
            "control": "none"
        },
        {
            "url": "https://roku.s.cpl.delvenetworks.com/media/59021fabe3b645968e382ac726cd6c7b/60b4a471ffb74809beb2f7d5a15b3193/roku_ep_111_segment_1_final-cc_mix_033015-a7ec8a288c4bcec001c118181c668de321108861.m3u8",
            "title" : "Test Video 3",
            "streamformat" : "hls",
            "control": "none"
        },
        {
            "url": "https://roku.s.cpl.delvenetworks.com/media/59021fabe3b645968e382ac726cd6c7b/60b4a471ffb74809beb2f7d5a15b3193/roku_ep_111_segment_1_final-cc_mix_033015-a7ec8a288c4bcec001c118181c668de321108861.m3u8",
            "title" : "Test Video 4",
            "streamformat" : "hls",
            "control": "none"
        },
        {
            "url": "https://roku.s.cpl.delvenetworks.com/media/59021fabe3b645968e382ac726cd6c7b/60b4a471ffb74809beb2f7d5a15b3193/roku_ep_111_segment_1_final-cc_mix_033015-a7ec8a288c4bcec001c118181c668de321108861.m3u8",
            "title" : "Test Video 5",
            "streamformat" : "hls",
            "control": "none"
        },
        {
            "url": "https://roku.s.cpl.delvenetworks.com/media/59021fabe3b645968e382ac726cd6c7b/60b4a471ffb74809beb2f7d5a15b3193/roku_ep_111_segment_1_final-cc_mix_033015-a7ec8a288c4bcec001c118181c668de321108861.m3u8",
            "title" : "Test Video 6",
            "streamformat" : "hls",
            "control": "none"
        }
        
        
    ]
        
    m.secondVideoParentContent = CreateObject("roSGNode", "ContentNode")
    m.secondVideos = []
    for each item in secondVideoDetails
        m.secondVideoChildContent = m.secondVideoParentContent.createChild("secondVideoItemField")
        m.secondVideoChildContent.secondVideoUrl = item.url
        m.secondVideoChildContent.secondVideoTitle = item.title
        m.secondVideoChildContent.secondVideoStreamFormat = item.streamFormat
        m.secondVideoChildContent.secondVideoControl = item.control
        m.secondVideoChildContent.increaseSecondVideoSize = "false"

        m.secondVideos.push(m.secondVideoChildContent)
    end for
    m.secondVideoMUG.content = m.secondVideoParentContent
end sub

sub onSetFocus()
    print "inside: onSetFocus()"
    
    renderSecondVideoComponent()
    renderFirstVideoComponent()
    m.firstVideoMUG.setFocus(true)
   
        m.firstVideoChildContent.firstVideoControl = "play"
    
    print "m.secondVideoMUG: "m.secondVideoMUG.hasFocus()
    
end sub

sub stopFirstVideo()
    m.firstVideoChildContent.firstVideoControl = "stop"
end sub

sub stopSecondVideo()
    m.lastFocusedItemOfSecondVideo.secondVideoControl = "stop"
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    if press
        if key = "left"
            print "left clicked"
            print "m.firstVideoMUG.hasFocus(): "m.firstVideoMUG.hasFocus()
            if m.firstVideoMUG.hasFocus()
                if getIsFirstVideoEnlarged()
                    setIsFirstVideoEnlarged(false)
                    setLayoutGroupTranslation("center")
                    setFirstVideoMarkUpGridItemSize()
                    stopFirstVideo()
                    return false
                else
                    stopFirstVideo()
                    return false
                end if
            else if m.secondVideoMUG.hasFocus()
                print "m.secondVideoMUG.hasFocus(): "m.secondVideoMUG.hasFocus()
                stopSecondVideo()
                m.firstVideoMUG.setFocus(true)
                m.firstVideoChildContent.firstVideoControl = "play"
                return true
            end if
        else if key = "right"
            print "right clicked"
            if m.firstVideoMUG.hasFocus()
                m.firstVideoChildContent.firstVideoControl = "stop"
                m.secondVideoMUG.setFocus(true)
                ' handleSecondVideoFocused()
                'm.secondVideoChildContent.secondVideoControl = "play"
                return true
            ' else if m.secondVideoMUG.hasFocus()
            '     return true
            end if
            return true
        else if key="back"
            print "back pressed"
            if m.firstVideoMUG.hasFocus()
                print "m.firstVideoMUG.hasFocus()"
                if getIsFirstVideoEnlarged()
                    setIsFirstVideoEnlarged(false)
                    setLayoutGroupTranslation("center")
                    setFirstVideoMarkUpGridItemSize()
                    m.firstVideoChildContent.increaseFirstVideoSize = "false"
                    return true
                else
                    m.firstVideoChildContent.firstVideoControl = "stop"
                    return false
                end if
            else if m.secondVideoMUG.hasFocus()
                print "m.secondVideoMUG.hasFocus()"
                stopSecondVideo()
                return false
            end if
            
        end if
    end if
    return false
end function