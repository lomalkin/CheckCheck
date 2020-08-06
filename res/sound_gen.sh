#!/bin/bash
#
# Для генерации своего файла звукового сопровождения сканирования.
#

#play -V -r 48000 -n -b 16 -c 2 snd.wav synth 0.08 sin 800 vol -10dB 2>/dev/null
sox -V -r 48000 -n -b 16 -c 2 snd.wav synth 0.08 sin 800 vol -10dB 2>/dev/null
