read -p "Enter Widget Name:" widgetName
echo $widgetName
rm -rf /tmp/xcf
xcodebuild archive -project WidgetExample.xcodeproj -scheme $widgetName -destination="iOS" -archivePath /tmp/xcf/ios.xcarchive -derivedDataPath /tmp/iphoneos -sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
xcodebuild archive -project WidgetExample.xcodeproj -scheme $widgetName -destination="iOS Simulator" -archivePath /tmp/xcf/iossimulator.xcarchive -derivedDataPath /tmp/iphoneos -sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
xcodebuild -create-xcframework -framework /tmp/xcf/ios.xcarchive/Products/Library/Frameworks/$widgetName.framework -framework /tmp/xcf/iossimulator.xcarchive/Products/Library/Frameworks/$widgetName.framework -output /tmp/xcf/$widgetName.xcframework
cp -r /tmp/xcf/$widgetName.xcframework/ ~/Desktop/$widgetName.xcframework/