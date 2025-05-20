#!/bin/bash

# 実行前に結果ファイル削除
rm -f out1.txt out2.txt out3.txt

# 解答スクリプトを実行
bash kaitou.sh

# 正解データ
expected_out1=$(cat <<EOF
RPi 5
RPi 4 Model B
RPi 3 Model B+
RPi 3 Model A+
RPi Zero 2 W
RPi Zero W
RPi 400
RPi Compute Module 4
RPi Compute Module 3+
Arduino Uno R3
Arduino Mega 2560
Arduino Leonardo
Arduino Nano
Arduino Nano Every
Arduino Nano 33 IoT
Arduino MKR WiFi 1010
Arduino Due
Arduino Portenta H7
Jetson Nano
Jetson Xavier NX
Jetson TX2
Jetson AGX Xavier
Jetson Orin Nano
Jetson Orin NX
BeagleBone Black
BeagleBone Green
BeagleBone AI
BeagleBoard-xM
Banana Pi M5
Banana Pi R2
Orange Pi 5
Orange Pi Zero 2
LattePanda Alpha
LattePanda 3 Delta
Rock Pi 4
ROCK64
PINE A64
ODROID-XU4
ODROID-C4
Khadas VIM3
EOF
)

expected_out2=$(cat <<EOF
Raspberry Pi Compute Module 4
Rock Pi 4
ROCK64
PINE A64
ODROID-XU4
ODROID-C4
EOF
)

expected_out3=$(cat <<EOF
Raspberry Pi 4 Model B
Raspberry Pi 3 Model B+
Raspberry Pi 3 Model A+
EOF
)

# 採点
score=0

check_output() {
    local output_file=$1
    local expected_content=$2
    local label=$3

    if diff -u <(echo "$expected_content") "$output_file" > /dev/null; then
        echo "$label: OK"
        ((score++))
    else
        echo "$label: NG"
        echo "--- Expected ---"
        echo "$expected_content"
        echo "--- Got ---"
        cat "$output_file"
    fi
}

check_output out1.txt "$expected_out1" "➀ Raspberry Pi を RPi に置換"
check_output out2.txt "$expected_out2" "➁ 末尾が4"
check_output out3.txt "$expected_out3" "➂ Model [A-Z]"

echo "Score: $score / 3"
