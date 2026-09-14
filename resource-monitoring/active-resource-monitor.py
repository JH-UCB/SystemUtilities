# in your command line, run this with `python active-resource-monitor.py`

import psutil
import time
from datetime import datetime

try:
    from IPython.display import clear_output
except ImportError:
    def clear_output(wait=True):
        pass

for _ in range(100):  # or while True for indefinite
    clear_output(wait=True)
    cpu = psutil.cpu_percent()
    ram = psutil.virtual_memory().percent
    print(f"Time: {datetime.now().isoformat()}")
    print(f"CPU Usage: {cpu}%")
    print(f"RAM Usage: {ram}%")
    print("")
    time.sleep(1)