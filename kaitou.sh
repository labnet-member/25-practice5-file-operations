#!/bin/bash

# ➀ Raspberry Pi → RPi に置換（末尾に改行あり）
sed [➀] device.txt > out1.txt

# ➁ 4で終わる名前を抽出
grep [➁] device.txt > out2.txt

# ➂ Model [A-Z] を含む行を抽出
grep [➂] device.txt > out3.txt
