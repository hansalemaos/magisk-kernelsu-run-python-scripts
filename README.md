
### Install Termux+Python and this module (only tested with VMs / emulators)

### Create a Python file with the name *pythonscript.py*

```py
import time
# LOOP_FOREVER -> If this is in your script, the script will always be restarted after finishing 
while True:
    time.sleep(5)
    with open("/sdcard/testtime.txt", mode="a", encoding="utf-8") as f:
        f.write(f"{time.time()}\n")
```

### copy the script to  */sdcard/hansgisk*

```sh
adb -s 127.0.0.1:5556 push C:\ProgramData\anaconda3\envs\a0\pythonscript.py  /sdcard/hansgisk
```

### Reboot