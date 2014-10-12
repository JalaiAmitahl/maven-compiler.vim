" Vim Syntax File
" Language: Maven POM.xml files
" Maintainer: Dan Taylor
" Last Modified: 2014 Oct 08

if exists("b:current_syntax")
    finish
endif

" Case sensitive tags
syn case match

" Error strings
syn match xmlError "\(\s\+<\s\+\|&\s\+\)"

" POM defined tag level matches
syn match projectMatch "<project .*>" contains=attributeString
syn match projectMatch "</project>"
syn match parentMatch "</\=parent>"
syn match modelVersionMatch "</\=modelVersion>.*" contains=versionStringMatch,badVersionStringMatch
syn match groupIdMatch "</\=groupId>.*" contains=tagContentsRegion
syn match artifactIdMatch "</\=artifactId>.*" contains=tagContentsRegion
syn match versionMatch "</\=version>.*" contains=versionStringMatch,badVersionStringMatch
syn match packagingMatch "</\=packaging>.*" contains=typeMatch
syn match nameMatch "</\=name/\=>.*" contains=tagContentsRegion
syn match urlMatch "</\=url/\=>.*" contains=urlContentsRegion
syn match descriptionMatch "</\=description/\=>"
syn match inceptionYearMatch "<\=inceptionYear/\=>.*" contains=tagContentsRegion
syn match licensesMatch "</\=licenses\=/\=>"
syn match distributionMatch "</\=distribution/\=>.*" contains=tagContentsRegion
syn match commentsMatch "</\=comments/\=>.*" contains=tagContentsRegion
syn match organizationMatch "</\=organization\=/\=>.*" contains=tagContentsRegion
syn match organizationMatch "</\=organizationUrl\=/\=>.*" contains=urlContentsRegion
syn match developerMatch "</\=developers\=/\=>"
syn match idMatch "</\=id/\=>.*" contains=tagContentsRegion
syn match emailMatch "</\=email/\=>.*" contains=emailContentsRegion
syn match roleMatch "</\=roles\=/\=>.*" contains=tagContentsRegion
syn match timezoneMatch "</\=timezone/\=>.*" contains=tagContentsRegion
syn match propertiesMatch "</\=properties/\=>"
syn match scmMatch "</\=scm>"
syn match connectionMatch "</\=\(developer\)\=[Cc]onnection>.*" contains=scmUrlContentsRegion
syn match tagMatch "</\=tag/\=>.*" contains=tagContentsRegion
syn match buildMatch "</\=build/\=>.*" contains=tagContentsRegion
syn match pluginMatch "</\=plugin\(s\|Management\)\=/\=>"
syn match configurationMatch "</\=configuration/\=>"
syn match executionMatch "</\=executions\=/\=>"
syn match goalsMatch "</\=goals\=/\=>"
syn match dependencyMatch "</\=dependenc\(y\|ies\|yManagement\)\=/\=>"
syn match reportingMatch "</\=report\(ing\|Sets\|Set\|s\)\=/\=>"
syn match inheritedMatch "</\=inherited/\=>"
syn match scopeMatch "</\=scope/\=>.*" contains=scopeRegion
syn match distributionMatch "</\=distributionManagement/\=>"
syn match repositoryMatch "</\=\(snapshotR\|r\)\=epository/\=>"
syn match siteMatch "</\=site/\=>"
syn match moduleMatch "</\=modules\=/\=>.*" contains=tagContentsRegion
syn match commentMatch "<!--.*-->"

syn region scopeRegion start=+>.+ end=+<+ contained contains=validScope
syn region tagContentsRegion start=+>.+ end=+<+ contained contains=validGroupString,validString
syn region urlContentsRegion start=+>.+ end=+<+ contained contains=validUrlString
syn region scmUrlContentsRegion start=+>.+ end=+<+ contained contains=validScmUrlString
syn region emailContentsRegion start=+>.+ end=+<+ contained contains=validEmailString

" Sub tag matches
syn match validScope "\(compile\|provided\|runtime\|test\|system\)"
syn match equalsString "=" contained
syn match quoteString '"' contained
syn match attributeString "[-\.[:alpha:][:digit:]:]\+=" contained contains=equalsString
syn match versionStringMatch "\d\+\(\.\d*\)*\(-SNAPSHOT\)\=" contained
syn match typeMatch "\(pom\|jar\|war\|ear\|bundle\)" contained
syn match validGroupString "[-\.[:alpha:][:digit:]]" contained
syn match validString "[-\.[:alpha:][:digit:]]" contained
syn match validUrlString "\(https\=\|file\|ftp\|ssh\)://[-\.[:alpha:][:digit:]/]\+" contained
syn match validScmUrlString "scm:\(git\|svn\|cvs\):\(https\=\|file\|ftp\|ssh\)://[-\.[:alpha:][:digit:]/]\+" contained
syn match validScmUrlString "scm:\(git\|svn\|cvs\):\([[:alpha:][:digit:]]\+@\)\=\(\(https\=\|file\|ftp\|ssh\)://\)\=[[:alpha:][:digit:]][-:\.[:alpha:][:digit:]/]\+" contained
syn match validEmailString "[[:alpha:][:digit:]\.]\+@[[:alpha:][:digit:]]\+\.[[:alpha:]]\+" contained

" Specific value colours
hi def link commentMatch Comment
hi def link equalsString Type
hi def link scopeRegion Type
hi def link validScope Constant
hi def link attributeString Constant
hi def link tagContentsRegion Type
hi def link urlContentsRegion Type
hi def link scmUrlContentsRegion Type
hi def link emailContentsRegion Type
hi def link typeMatch Constant
hi def link versionStringMatch Constant
hi def link validGroupString Constant
hi def link validString Constant
hi def link validUrlString Constant
hi def link validScmUrlString Constant
hi def link validEmailString Constant

" Default tag colours
hi def link projectMatch Type
hi def link parentMatch Type
hi def link modelVersionMatch Type
hi def link groupIdMatch Type
hi def link artifactIdMatch Type
hi def link versionMatch Type
hi def link packagingMatch Type
hi def link nameMatch Type
hi def link urlMatch Type
hi def link descriptionMatch Type
hi def link inceptionYearMatch Type
hi def link licensesMatch Type
hi def link distributionMatch Type
hi def link commentsMatch Type
hi def link organizationMatch Type
hi def link developerMatch Type
hi def link idMatch Type
hi def link emailMatch Type
hi def link roleMatch Type
hi def link timezoneMatch Type
hi def link propertiesMatch Type
hi def link scmMatch Type
hi def link connectionMatch Type
hi def link tagMatch Type
hi def link prefixMatch Type
hi def link buildMatch Type
hi def link pluginMatch Type
hi def link configurationMatch Type
hi def link executionMatch Type
hi def link goalsMatch Type
hi def link dependencyMatch Type
hi def link reportingMatch Type
hi def link inheritedMatch Type
hi def link scopeMatch Type
hi def link distributionMatch Type
hi def link repositoryMatch Type
hi def link siteMatch Type
hi def link moduleMatch Type

