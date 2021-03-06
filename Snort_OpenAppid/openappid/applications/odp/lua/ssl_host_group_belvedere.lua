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
detection_name: SSL Group "Belvedere"
version: 30
description: Group of SSL Host detectors.
bundle_description: $VAR1 = {
          'Citi' => 'Financial services company.',
          'IMRWorldWide' => 'Market research and Network analytics to display advertisement.',
          'Akamai' => 'Internet content delivery network and SSL certificate provider.',
          'AOL' => 'American company develops, grows and invests in brands and web sites.',
          'Doubleclick' => 'Web advertisement services.',
          'Taringa' => 'Argentinian Social network.',
          'Mint.com' => 'Web-based personal finance tool.',
          'Pinterest' => 'Social photo sharing website.',
          'PayPal' => 'E-commerce website for handling online transactions.',
          'The Telegraph' => 'Online news portal.',
          'Geewa' => 'Browser and Facebook-based gaming.',
          'Avaya Live' => 'Cloud based VoIP service.',
          'Invitemedia' => 'Advertising portal.',
          'ZEDO' => 'Web advertisement services.',
          'Yieldmanager' => 'Online advertising delivery portal.',
          'Jingdong (360buy.com)' => 'Chinese e-commerce site.',
          'Comcast' => 'Web Portal.',
          'Gmail' => 'Google online email.',
          'Flurry Analytics' => 'Mobile application analytics.',
          'Airtime' => 'Video chat.',
          'Google Remote Desktop' => 'Online desktop sharing service.',
          'Livedoor' => 'Japanese Internet service provider.',
          'Rediff.com' => 'Online news, information and web portal.',
          'Siri' => 'Voice interactive agent for Apple\'s iOS.',
          'BioDigital Human' => 'A web-based medical imaging app.',
          'Google' => 'Traffic generated by the Google search engine or one of the other many Internet services provided by Google Inc.',
          'Loyalty Innovations' => 'Reward programs and solutions for both online and offline.',
          'T Mobile' => 'Telecommunication and phone service provider.',
          'CSDN' => 'Chinese IT community/forum for Software related issues.',
          'King.com' => 'Web-based gaming.',
          'Pubmatic' => 'Web advertisement services.',
          'HSBC' => 'Global banking and financial services company.',
          'Spiegel Online' => 'Web portal for the Germans magazine Der Speigel.',
          'LivingSocial' => 'Deals website.',
          'Yandex' => 'Russian search engine.',
          'E*TRADE' => 'Financial services company with a focus on online stock brokerage.',
          'GoToMyPC' => 'PC remote control software.',
          'Square Inc.' => 'Electronic payment service through mobile phones.',
          'Google Drive' => 'A free office suite and cloud storage system hosted by Google.',
          'Wooga' => 'Browser and social network based games company.',
          'Naver' => 'Web portal.',
          'Capital One' => 'U.S. based bank holding company.',
          '500px' => 'Online photo sharing.',
          'Spotify' => 'Social Music Player.',
          'Discover' => 'Financial services company.',
          'FireAMP SSL' => 'Connection to FireAMP cloud.',
          'Shutterfly' => 'Share, prints and personalize the cards, album, mugs and other Home decor items with your photos.',
          'Bank of America' => 'Global financial services company.',
          'Etsy' => 'E-commerce website for homemade or vintage items.',
          'Aliexpress' => 'Online shopping portal.',
          'Craigslist' => 'Popular online classifieds.',
          'UOL' => 'Brazilian web portal for news and entertainment.',
          'KakaoTalk' => 'Mobile messaging for smartphones.',
          'CloudFront' => 'Content Delivery for AWS.',
          'Dwolla' => 'Online Payment service.',
          'Outlook' => 'Microsoft email service.',
          'Snapchat' => 'Online photo sharing.',
          'Chase' => 'Consumer and commercial banking company.',
          'Adcash' => 'Advertising network.',
          'Wells Fargo' => 'Global financial services company.',
          '58 City' => 'Classified information about 58 cities in China.',
          'Apple Developer' => 'Web portal for Apple Developer.',
          'The New York Times' => 'Newspaper website.',
          'Odnoklassniki' => 'Russian social networking service.',
          'Dailymotion' => 'A video sharing service website.',
          'Amazon Web Services' => 'Online cloud computing service.',
          'Instagram' => 'Mobile phone photo sharing.',
          'USPS' => 'US Postal Service website.',
          'Shutterstock' => 'Online collection of Stock photographs and illustrations.',
          'Facebook' => 'Facebook is a social networking service.',
          'LINE' => 'Instant Messaging.',
          'Scottrade' => 'Discount brokerage service.',
          'Sharepoint' => 'Microsoft collaboration, file sharing and web publishing system.',
          'American Express' => 'Financial services company.',
          'Airbnb' => 'Online accommodation rental service.',
          'The Guardian' => 'Online news portal.',
          'Rakuten' => 'Japanese e-commerce site.',
          'Symantec System Center' => 'Anti-virus software management.',
          'Urban Airship' => 'Mobile app developer.',
          'Advertising.com' => 'Web advertisement services.',
          'iTunes' => 'Apple\'s media player and online store.'
        };

--]]

require "DetectorCommon"


local DC = DetectorCommon

DetectorPackageInfo = {
    name =  "ssl_hosy_group_balvenie",
    proto =  DC.ipproto.tcp,
    client = {
        init =  'DetectorInit',
        clean =  'DetectorClean',
        minimum_matches =  1
    }
}

--serviceId, clientId, ClientType, PayloadId, PayloadType, hostPattern, pathPattern, schemePattern, queryPattern
gSSLHostPatternList = {

    -- FireAMP
    { 1, 1297, 'amp.sourcefire.com' },
    -- Immunet client
    { 0, 934, 'immunet.com' },
    -- Zynga
    { 0, 533, 'zgncdn.com' },
    { 0, 533, 'zyngawithfriends.com' },
    { 0, 533, 'zc-prod.treasure.zynga.com' },
    { 0, 533, 'wwf-fb.zyngawithfriends.com' },
    { 0, 533, 'api.zynga.com' },
    { 0, 533, 'cafe.zynga.com' },
    { 0, 533, 'wordswithfriends.zyngawithfriends.com' },
    { 0, 533, 'hangingwithfriends.zyngawithfriends.com' },
    { 0, 533, 'treasure.zynga.com' },
    { 0, 533, 'static.zynga.com' },
    { 0, 533, 'zynga.com' },
    { 0, 533, 'zynga1-a.akamaihd.net' },
    { 0, 533, 'zynga2-a.akamaihd.net' },
    -- Wooga
    { 0, 1298, 'cdn-mkt.wooga.com' },
    { 0, 1298, 'wooga.com' }, 
    ---- SchoolFeed
    --{ 0, 1249, 'your.schoolfeed.com' },
    --{ 0, 1249, 'schoolfeed.com' },
    -- Bubble Saga
    { 0, 1244, 'bubblesaga.king.com' },
    -- Mesmo Games
    { 0, 1240, 'secure.mesmo.tv' },
    -- Avast AV
    { 0, 1264, 'static2.avast.com' },
    { 0, 1264, 'avast.com' },
    -- BranchOut
    { 0, 1250, 'branchout.com' },
    -- AllMyApps
    { 0, 1265, 'buildyourapps.info' },
    -- cartown
    --{ 0, 1242, 'secure.cartown.com' },
    --{ 0, 1242, 'cartown.com' },
    -- DoubleDownCasino
    { 0, 1234, 'facebook.doubledowncasino.com' },
    { 0, 1234, 'doubledowncasino.com' },
    -- Empires and Allies
    --{ 0, 1255, 'fb-zc.empire.zynga.com' },
    --{ 0, 1255, 'empire.zynga.com' },
    -- Evernote
    { 0, 1267, 'www.evernote.com' },
    -- Family Tree
    { 0, 1236, 'fbshard.apps.familybuilder.com' },
    { 0, 1236, 'apps.familybuilder.com' },
    -- Fruit Ninja Fantasy
    -- { 0, 1246, 'www.fruitninjafrenzygame.info' },
    -- biodigitalhuman
    { 0, 1595, 'www.biodigitalhuman.com' },
    { 0, 1595, 'biodigitalhuman.com' },
    { 0, 1595, 'biodigital.com' },
    { 0, 1595, 'www.biodigital.com' },
    -- Geewa
    { 0, 1597, 'apps.geewa.com' },
    -- GoToMyPC
    { 0, 1598, 'www.gotomypc.com' },
    -- Midasplayer 
    { 0, 1599, 'Midasplayer.com' },
    { 0, 1599, 'midasplayer.com' },
    { 0, 1599, 'king.com' },
    -- Windows Live login
    { 0, 502, 'live.com' },  
    -- Ubuntu One
    --{ 0, 1600, 'fs-1.one.ubuntu.com' },
    --{ 0, 1600, 'one.ubuntu.com' },
    -- USPS
    { 0, 1601, 'sdc.usps.com' },
    { 0, 1601, 'usps.com' },
    { 0, 1601, 'www.uspspostalone.com' },
    -- Outbrain
    { 0, 1369, 'www.outbrain.com' },
    -- Foursquare
    --{ 0, 1350, 'foursquare.com' },
    --{ 0, 1350, '4sqi.net' },
    -- Airtime
    { 0, 1645, 'www.airtime.com' },
    { 0, 1645, 'airtime.com' },
    -- Xcode
    { 0, 1596, 'developer.apple.com' },
    { 0, 1596, 'devimages.apple.com' },
    { 0, 1596, 'devimages.apple.com.edgekey.net' },
    -- Siri
    { 0, 1603, 'guzzoni.apple.com' },
    { 0, 1603, 'daryl.apple.com' },
    -- AWS
    { 0, 1392, 's3-external-1.amazonaws.com' },
    { 0, 1392, 's3.amazonaws.com' },
    { 0, 1392, 'mfcdn.s3.amazonaws.com' },
    { 0, 1392, 'portal.aws.amazon.com' },
    { 0, 1392, 'signin.aws.amazon.com' },
    { 0, 1392, 'aws.amazon.com' },
    { 0, 1392, 'images-na.ssl-images-amazon.com' },
    { 0, 1392, 'awsstatic.com' },
    { 0, 1392, 'amazonwebservicesinc.tt.omtrdc.net' },
    -- Dailymotion
    { 0, 600, 'dailymotion.com' },
    { 0, 600, 'www.dailymotion.com' },
    { 0, 600, 'dailymotion.com' },
    -- CloudFront 
    { 0, 1393, 'cloudfront.net' },
    { 0, 1393, 'cloudfront.net' },
    -- Paypal
    { 0, 1134, 'www.paypal.com' },
    { 0, 1134, 't.paypal.com' },
    { 0, 1134, 'www.paypalobjects.com' },
    { 0, 1134, 'paypal-search.com' },
    { 0, 1134, 'personal.paypal.com' },
    { 0, 1134, 'paypal.dl.sc.omtrdc.net' },
    -- Etsy  
    { 0, 1374, 'etsy.com' },
    { 0, 1374, 'www.etsy.com' },
    { 0, 1374, 'bcn.etsy.com' },
    -- Craigslist
    { 0, 594, 'craigslist.org' },
    { 0, 594, 'post.craigslist.org' },
    { 0, 594, 'accounts.craigslist.org' },
    -- Kakao 
    { 1, 1405, 'kakao.com' },
    { 1, 1405, 'item.kakao.com' },
    -- DoubleClick
    { 0, 1313, 'g.doubleclick.net' },
    { 0, 1313, 'doubleclick.net' },
    { 0, 1313, 'ad.doubleclick.net' },
    { 0, 1313, 'googleads.g.doubleclick.net' },
    { 0, 1313, 'fls.doubleclick.net' },
    -- Flurry      
    { 0, 1406, 'flurry.com' },
    -- iTunes      
    { 0, 689, 'metrics.mzstatic.com' },
    { 0, 689, 'mzstatic.com' },
    { 0, 689, 's.mzstatic.com' },
    -- Symantec    
    { 0, 459, 'shasta-rrs.symantec.com' },
    { 0, 459, 'symantec.com' },
    { 0, 459, 'symanteccloud.com' },
    { 0, 459, 'symantec.tt.omtrdc.net' },
    -- Comcast     
    { 0, 1365, 'comcast.com' },
    { 0, 1365, 'comcast.net' },
    -- Outlook     
    { 0, 776, 'r3.res.outlook.com' },
    { 0, 776, 'res.outlook.com' },
    { 0, 776, 'outlook.com' },
    { 0, 776, 'Outlook.com' },
    { 0, 776, 'pop3.live.com' },
    -- Pinterest   
    { 1, 1135, 'pinterest.com' },
    -- Instagram   
    { 1, 1233, 'instagram.com' },
    -- Bank of America
    { 0, 560, 'www.bankofamerica.com' },
    { 0, 560, 'bankofamerica.com' },
    { 0, 560, 'bankofamerica.tt.omtrdc.net' },
    -- Capital One    
    { 0, 582, 'www.capitalone.com' },
    { 0, 582, 'capitalone.com' },
    -- Chase        
    { 0, 587, 'www.chase.com' },
    { 0, 587, 'chase.com' },
    -- Citi         
    { 0, 590, 'citibank.com' },
    { 0, 590, 'citi.bridgetrack.com' },
    { 0, 590, 'citi.com' },
    { 0, 590, 'citicorpcreditservic.tt.omtrdc.net' },
    -- HSBC         
    { 0, 675, 'hsbc.com' },
    { 0, 675, 'member-hsbc-group.com' },
    -- American Express
    { 0, 544, 'www.americanexpress.com' },
    { 0, 544, 'www.aexp-static.com' },
    { 0, 544, 'americanexpress.com' },
    -- Wells Fargo     
    { 0, 907, 'www.wellsfargo.com' },
    { 0, 907, 'wellsfargo.com' },
    -- US Bank         
    --{ 0, 907, 'usbank.tt.omtrdc.net' },
    --{ 0, 907, 'usbank.com' },
    --{ 0, 907, 'usbank.com' },
    -- Mint.com        
    { 0, 1193, 'www.mint.com' },
    { 0, 1193, 'mint.com' },
    -- Discover        
    { 0, 615, 'www.discover.com' },
    { 0, 615, 'discover.com' },
    { 0, 615, 'discovercard.com' },
    { 0, 615, 'discover.tt.omtrdc.net' },
    -- E*Trade           
    { 0, 621, 'etrade.com' },
    { 0, 621, 'etrade.net' },
    { 0, 621, 'etradefinancial.tt.omtrdc.net' },
    { 0, 621, 'etrade.wsod.com' },
    { 0, 621, 'etrade.122.2o7.net' },
    -- Scottrade         
    { 0, 820, 'scottrade.com' },
    -- Shutterfly        
    { 0, 1543, 'shutterfly.com' },
    { 0, 1543, 'staticsfly.com' },
      -- The New York Times
    { 0, 1299, 'nytimes.com' },
      -- ZEDO              
    { 0, 1362, 'zedo.com' },
      -- Pubmatic          
    { 0, 1315, 'pubmatic.com' },
      -- LivingSocial      
    { 0, 1495, 'livingsocial.com' },
    { 0, 1495, 'lscdn.net' },
      -- AOL               
    { 0, 1419, 'aol.com' },
    { 0, 1419, 'aim.net' },
    { 0, 1419, 'aolcdn.com' },
      -- Naver             
    { 0, 1309, 'naver.com' },
      -- Spotify           
    { 0, 1158, 'spotify.com' },
    { 0, 1158, 'spotify.edgekey.net' },
      -- T Mobile           
    { 0, 1545, 't-mobile.com' },
      -- Advertising.com    
    { 0, 1545, 'advertising.com' },
      -- Square Inc
    { 0, 1568, 'squareup.com' },
    { 0, 1568, 'square.com' },
      -- IMRWorldWide
    { 0, 1560, 'imrworldwide.com' },
      -- Shutterstock
    { 0, 1614, 'secure.shutterstock.com' },
    { 0, 1614, 'shutterstock.com' },
      -- Yandex 
    { 0, 1616, 'yandex.by' },
    { 0, 1616, 'yandex.kz' },
    { 0, 1616, 'yandex.ru' },
    { 0, 1616, 'yandex.st' },
    { 0, 1616, 'yandex.com' },
    { 0, 1616, 'yandex.ua' },
    { 0, 1616, 'yandex.com.tr' },
      -- Adcash 
    { 0, 1617, 'adcash.com' },
      -- The Guardian
    { 0, 1618, 'guardian.co.uk' },
    { 0, 1618, 'guim.co.uk' },
      -- Yieldmanager
    { 0, 1619, 'yieldmanager.com' },
      -- The Telegraph
    { 0, 1620, 'telegraph.co.uk' },
      -- Livedoor 
    { 0, 1621, 'livedoor.com' },
      -- Rediff.com
    { 0, 1624, 'rediff.com' },
      -- Spiegel Online
    { 0, 1625, 'spiegel.de' },
      -- UOL
    { 0, 1626, 'uol.com.br' },
      -- Jingdong (360buy.com)
    { 0, 1627, '360buy.com' },
    { 0, 1627, 'jd.com' },
    
    -- Google Drive
    { 0, 180, 'drive.google.com' },
    -- Gmail
    { 0, 655, 'mail.google.com' },
    { 0, 655, 'gmail.com' },    
     -- Airtime
    { 0, 1645, 'www.airtime.com' },
    -- CSDN   
    { 0, 1646, 'passport.csdn.net' },
    { 0, 1646, 'passport.pongo.cn' },
    -- Taringa
    { 0, 1647, 'www.taringa.net' },
    { 0, 1647, 'taringa.net' },
    -- Aliexpress
    { 0, 1648, 'aliexpress.com' },
    -- 58 City
    { 0, 1649, 'passport.58.com' },
    -- Rakuten
    { 0, 1652, 'rakuten.co.jp' },
    -- Snapchat
    { 1, 1653, 'feelinsonice.appspot.com' },
    { 1, 1653, 'feelinsonice-hrd.appspot.com' },
    -- 500px
    { 1, 1654, '500px.com' },
    -- Airbnb
    { 0, 1655, 'airbnb.com' },
    -- Invitemedia
    { 0, 1656, 'www.invitemedia.com' },
    { 0, 1656, 'invitemedia.com' },
    -- Urban Airship
    { 0, 1657, 'urbanairship.com' },
    -- Akamai
    { 0, 1659, 'akamaihd.net'},
    { 0, 1659, 'akamai.net'},
    { 0, 1659, 'akamai.com'},
    -- Loyalty Innovations
    { 0, 1660, 'loyaltyinnovations.com'},
    -- Sharepoint
    { 0, 423, 'sharepoint.com'},
    { 0, 423, 'sharepoint.microsoft.com'},
    { 0, 423, 'sharepointmktgv6.microsoft.com'},
    -- Odnoklassniki
    { 0, 1070, 'odnoklassniki.ru'},
    -- Avaya Live
    { 1, 1661, 'avayalive.com'},
    -- Facebook
    { 0, 629, 'fbcdn-photos-a.akamaihd.net'},
    { 0, 629, 'fbcdn-photos-e-a.akamaihd.net'},
    { 0, 629, 'fbcdn-photos-b-a.akamaihd.net'},
    { 0, 629, 'fbcdn-video-a.akamaihd.net'},
    { 0, 629, 'www.facebook.com'},
    { 0, 629, 'facebook.com'},
    { 0, 629, 'fbcdn-sphotos-e-a.akamaihd.net'},
    { 0, 629, 'fbcdn-sphotos-b-a.akamaihd.net'},
    { 0, 629, 'fbstatic-a.akamaihd.net'},
    { 0, 629, 'fbexternal-a.akamaihd.net'},
    { 0, 629, 'fbcdn-sphotos-f-a.akamaihd.net'},
    { 0, 629, 'fbcdn-profile-a.akamaihd.net'},
    { 0, 629, 'fbcdn-creative-a.akamaihd.net'},
    { 0, 629, 'channel.facebook.com'},
    { 0, 629, 'fbcdn-dragon-a.akamaihd.net'},
    { 0, 629, 'contentcache-a.akamaihd.net'},
    { 0, 629, 'facebook.net'},
    { 0, 629, 'fbcdn.net'},
    -- Dwolla 
    { 0, 1664, 'www.dwolla.com'},
    -- Google Remote Desktop
    { 0, 1665, 'chromoting-oauth.talkgadget.google.com'},
    { 0, 1665, 'chromoting-host.talkgadget.google.com'},
    -- LINE
    { 1, 1667, 'line.naver.jp'},

}

function DetectorInit(detectorInstance)

    gDetector = detectorInstance;

    if gDetector.addSSLCertPattern then
        for i,v in ipairs(gSSLHostPatternList) do
            gDetector:addSSLCertPattern(v[1],v[2],v[3]);
        end
    end
    return gDetector;
end

function DetectorClean()
end

