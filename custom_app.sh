apkBaseName=$1
tempSmaliDir=$2

if [ "$apkBaseName" = "TeleService" ];then
        echo ">>> in custom_app for $apkBaseName to adjust the interface "registerForNetworkLocked" with "registerForPersoLocked""
        find $tempSmaliDir/ -name "*.smali" | xargs sed -i 's#registerForNetworkLocked#registerForPersoLocked#g'  

elif [ "$apkBaseName" = "Keyguard" ];then
        echo ">>> in custom_app for $apkBaseName to adjust the field IccCardConstants$State;->NETWORK_LOCKED with IccCardConstants$State;->PERSO_LOCKED"
        find $tempSmaliDir/ -name "*.smali" | xargs sed -i 's#IccCardConstants$State;->NETWORK_LOCKED#IccCardConstants$State;->PERSO_LOCKED#g'   

elif [ "$apkBaseName" = "SystemUI" ];then
        echo ">>> in custom_app for $apkBaseName to adjust the field IccCardConstants$State;->NETWORK_LOCKED with IccCardConstants$State;->PERSO_LOCKED"
        find $tempSmaliDir/ -name "*.smali" | xargs sed -i 's#IccCardConstants$State;->NETWORK_LOCKED#IccCardConstants$State;->PERSO_LOCKED#g'

elif [ "$apkBaseName" = "BaiduCamera" ];then
        echo ">>> add parent for item TextAppearance.DialogWindowTitle in styles.xml"
        sed -i 's#\"TextAppearance.DialogWindowTitle\"#\"TextAppearance.DialogWindowTitle\" parent=\"@*android:style\/TextAppearance\"#g' $tempSmaliDir/res/values/styles.xml
        echo ">>> add Camera Receiver for Camera Button"
        sed -i '/.MediaSaveService/r overlay/CameraReceiver.xml' $tempSmaliDir/AndroidManifest.xml

elif [ "$apkBaseName" = "BaiduGallery3D" ];then
        echo ">>> remove play video activity in BaiduGallery3D"
        sed -i '/movie_view_label/,+35d' $tempSmaliDir/AndroidManifest.xml

elif [ "$apkBaseName" = "InCallUI" ];then
        echo ">>> fix the button cannot display complete when having call"
        sed -i 's#2.0dip#30.0dip#g' $tempSmaliDir/res/layout/dialpad.xml

fi

