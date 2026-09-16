#!/bin/sh
# Skrip otomatis kontrol kecepatan kipas berdasarkan suhu SoC/System
while true; do
    TEMP=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null || echo 0)
    TEMP_C=$((TEMP / 1000))

    if [ $TEMP_C -gt 65 ]; then
        echo 255 > /sys/class/hwmon/hwmon0/pwm1 2>/dev/null
    elif [ $TEMP_C -gt 50 ]; then
        echo 160 > /sys/class/hwmon/hwmon0/pwm1 2>/dev/null
    else
        echo 90 > /sys/class/hwmon/hwmon0/pwm1 2>/dev/null
    fi
    sleep 10
done
