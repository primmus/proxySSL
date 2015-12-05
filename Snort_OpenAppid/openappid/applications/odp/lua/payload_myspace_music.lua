--[[
# Copyright 2001-2014 Cisco Systems, Inc. and/or its affiliates. All rights
# reserved.
#
# This file contains proprietary Detector Content created by Cisco Systems,
# Inc. or its affiliates ("Cisco") and is distributed under the GNU General
# Public License, v2 (the "GPL").  This file may also include Detector Content
# contributed by third parties. Third party contributors are identified in the
# "authors" file.  The Detector Content created by Cisco is owned by, and
# remains the property of, Cisco.  Detector Content from third party
# contributors is owned by, and remains the property of, such third parties and
# is distributed under the GPL.  The term "Detector Content" means specifically
# formulated patterns and logic to identify applications based on network
# traffic characteristics, comprised of instructions in source code or object
# code form (including the structure, sequence, organization, and syntax
# thereof), and all documentation related thereto that have been officially
# approved by Cisco.  Modifications are considered part of the Detector
# Content.
--]]
--[[
detection_name: Myspace Music
version: 1
description: Traffic generated by Myspace Music.
bundle_description: $VAR1 = {
          'Myspace Music' => 'Traffic generated by Myspace Music.'
        };

--]]

require "DetectorCommon"


local DC = DetectorCommon

DetectorPackageInfo = {
    name =  "Myspace Music",
    proto =  DC.ipproto.tcp,
    client = {
        init =  'DetectorInit',
        clean =  'DetectorClean',
        validate =  'DetectorValidator',
        minimum_matches =  1
    }
}

function DetectorClean()
end

function DetectorInit(detectorInstance)
    gDetector = detectorInstance
    if (gDetector.CHPCreateApp and gDetector.CHPAddAction) then
    --  Paramters listing <AppId>, <AppType>, <Number of Matches(usually 0, unless to be specified) >
        gDetector:CHPCreateApp(3646, 4, 2);
    -- Parameters listing   <AppId>, 
    --                      <Key Pattern(1) or not(0)>, 
    --                      <Pattern look-up type (User agent -> 0, Host -> 1, Referer -> 2, URI -> 3, Cookie -> 4, Content -> 5, Location -> 6, Body -> 7) >, 
    --                      <Patter string>, 
    --                      <Action type>, 
    --                      <Action String>
        gDetector:CHPAddAction(3646, 1, 1, "myspace.com", 0, "");
        gDetector:CHPAddAction(3646, 0, 3, "music", 0, "");
        gDetector:CHPAddAction(3646, 0, 3, "audio", 0, "");
        gDetector:CHPAddAction(3646, 0, 3, ".mp3", 0, "");
        gDetector:CHPAddAction(3646, 0, 3, "soundplayer.swf", 0, "");
    end
    return gDetector
end

function DetectorValidator()
    local context = {}
    return serviceFail(context)
end

function DetectorFini()
end