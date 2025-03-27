if [ -z "$1" ]; then
    echo "Max frequency is not provided"
    exit 1
fi

sudo ryzenadj --power-saving
echo 0 | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/boost
sudo cpupower frequency-set -d 400MHz
sudo cpupower frequency-set -u "$1"Mhz
echo "power" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference
echo "powersave" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
