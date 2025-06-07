#!/bin/bash

for i in {1..100}
do
    clear
    echo "Time: $(date +"%Y-%m-%dT%H:%M:%S%z")"

    # CPU usage (average over 1 second)
    CPU=$(top -l 2 -n 0 | grep "CPU usage" | tail -1 | awk '{print $3}' | sed 's/%//')
    echo "CPU Usage: $CPU%"

    # RAM usage (as percent)
    PAGE_SIZE=$(vm_stat | grep "page size of" | awk '{print $8}')
    MEM_USED=$(vm_stat | grep "Pages active" | awk '{print $3}' | sed 's/\.//')
    MEM_INACTIVE=$(vm_stat | grep "Pages inactive" | awk '{print $3}' | sed 's/\.//')
    MEM_FREE=$(vm_stat | grep "Pages free" | awk '{print $3}' | sed 's/\.//')
    MEM_SPECULATIVE=$(vm_stat | grep "Pages speculative" | awk '{print $3}' | sed 's/\.//')
    TOTAL_PAGES=$((MEM_USED + MEM_INACTIVE + MEM_FREE + MEM_SPECULATIVE))
    USED_PAGES=$((MEM_USED + MEM_INACTIVE))
    if [ "$TOTAL_PAGES" -eq 0 ]; then
        RAM=0
    else
        RAM=$(echo "scale=2; 100 * $USED_PAGES / $TOTAL_PAGES" | bc)
    fi
    echo "RAM Usage: $RAM%"

    echo ""
    sleep 1
done
