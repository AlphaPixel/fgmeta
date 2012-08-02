#!/usr/bin/ruby

require 'ERB'
require 'fileutils' #I know, no underscore is not ruby-like
include FileUtils

$osgLibs = ['osgFX', 'osgParticle', 'osg', 'osgGA', 'osgText', 'osgUtil', 'osgSim', 'osgViewer', 'osgDB']
$osgPlugins = ['ac', 'osg', 'freetype', 'qt', 'imageio', 'rgb', 'txf', 'mdl', '3ds']

def runOsgVersion(option)
  env = "export DYLD_LIBRARY_PATH=#{Dir.pwd}/dist/lib"
  bin = Dir.pwd + "/dist/bin/osgversion"
  return `#{env}; #{bin} --#{option}`.chomp
end

osgVersion = runOsgVersion('version-number')
$osgSoVersion=runOsgVersion('so-number')
$openThreadsSoVersion=runOsgVersion('openthreads-soversion-number')

puts "osgVersion=#{osgVersion}, so-number=#{$osgSoVersion}"

$alutSourcePath='/Library/Frameworks/ALUT.framework'

def fix_install_names(object)
  #puts "fixing install names for #{object}"
  
  $osgLibs.each do |l|
    oldName = "lib#{l}.#{$osgSoVersion}.dylib"
    newName = "@executable_path/../Frameworks/#{oldName}"
    `install_name_tool -change #{oldName} #{newName} #{object}`
  end
  
  oldName = "libOpenThreads.#{$openThreadsSoVersion}.dylib"
  newName= "@executable_path/../Frameworks/#{oldName}"
  `install_name_tool -change #{oldName} #{newName} #{object}`
  
  alutBundlePath = "@executable_path/../Frameworks/Alut.framework"
  alutLib = "Versions/A/ALUT"
  `install_name_tool -change #{$alutSourcePath}/#{alutLib} #{alutBundlePath}/#{alutLib} #{object}`
end

prefixDir=Dir.pwd + "/dist"
dmgDir=Dir.pwd + "/image"
srcDir=Dir.pwd + "/flightgear"


puts "Erasing previous image dir"
`rm -rf #{dmgDir}`

bundle=dmgDir + "/FlightGear.app"
contents=bundle + "/Contents"
macosDir=contents + "/MacOS"
frameworksDir=contents +"/Frameworks"
resourcesDir=contents+"/Resources"
osgPluginsDir=contents+"/PlugIns/osgPlugins-#{osgVersion}"


fgVersion = File.read("#{srcDir}/version").strip
volName="\"FlightGear #{fgVersion}\""

dmgPath = Dir.pwd + "/output/fg_mac_#{fgVersion}.dmg"

puts "Creating directory structure"
`mkdir -p #{macosDir}`
`mkdir -p #{frameworksDir}`
`mkdir -p #{resourcesDir}`
`mkdir -p #{osgPluginsDir}`

puts "Copying binaries"
bins = ['fgfs', 'fgjs']
bins.each do |b|
  `cp #{prefixDir}/bin/#{b} #{macosDir}/#{b}`
  fix_install_names("#{macosDir}/#{b}")
end

puts "copying libraries"
$osgLibs.each do |l|
  libFile = "lib#{l}.#{$osgSoVersion}.dylib"
  `cp #{prefixDir}/lib/#{libFile} #{frameworksDir}`
  fix_install_names("#{frameworksDir}/#{libFile}")
end

# and not forgetting OpenThreads
libFile = "libOpenThreads.#{$openThreadsSoVersion}.dylib"
`cp #{prefixDir}/lib/#{libFile} #{frameworksDir}`

$osgPlugins.each do |p|
  pluginFile = "osgdb_#{p}.so"
  sourcePath = "#{prefixDir}/lib/osgPlugins-#{osgVersion}/#{pluginFile}"
  if File.exists?(sourcePath)
      `cp #{sourcePath} #{osgPluginsDir}`
      fix_install_names("#{osgPluginsDir}/#{pluginFile}")
  end
end

# custom ALUT
# must copy frameworks using ditto
`ditto #{$alutSourcePath} #{frameworksDir}/ALUT.framework`

# Macflightgear launcher
puts "Copying Macflightgear launcher files"

Dir.chdir "maclauncher/FlightGearOSX" do
  `cp FlightGear #{macosDir}`
  `rsync -a *.rb *.lproj *.sh *.tiff #{resourcesDir}`
end

# Info.plist
template = File.read("Info.plist.in")
output = ERB.new(template).result(binding)

File.open("#{contents}/Info.plist", 'w') { |f|
  f.write(output)
}

`cp #{srcDir}/package/mac/FlightGear.icns #{resourcesDir}/FlightGear.icns`
`cp #{srcDir}/COPYING #{dmgDir}`

puts "Copying base package files into the image"
`rsync -a fgdata/ #{resourcesDir}/data`

puts "Creating DMG"

createArgs = "-format UDBZ -imagekey bzip2-level=9 -quiet -volname #{volName}"

`rm #{dmgPath}`
`hdiutil create -srcfolder #{dmgDir} #{createArgs} #{dmgPath}`
