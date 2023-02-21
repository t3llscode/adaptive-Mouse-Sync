# adaptive-M-Sync

## The Idea

I like Counter-Strike. In my mind, I would benefit from a higher DPI, as the mouse would pick up the input in smaller increments. Therefore I use a DPI of 4000 when I play FPS games.  
Turns out a DPI that high is not that compatible with normal mouse movement outside my FPV. To make it less annoying, I used to change the Windows setting for the mouse cursor speed manually.  
And this is where adaptive-M-Sync enters the party. A lightweight script that automatically changes the cursor speed, if an FPS game is open.

## The Setup

### Step 1: Paths

Set the paths of the applications with which you want to activate your different cursor speed.
Add these paths to the ```$paths``` array. Also change the path of ```MouseSpeed.ps1``` to your choosen location.

### Step 2: Cursor Speed

Decide what cursor speed should be set if an FPS game is open / not open. Check the comments in ```adaptive-M-Sync.ps1``` to change it to your preferred values.

### Step 3: Task Scheduler

1. Run ```taskschd.msc```
2. Click "Create Task" in the "Actions" pane
3. Choose a name and description
4. Create a new trigger in the "Triggers" tab
5. Select "At log on" as the trigger type
6. Create a new action in the "Actions" tab
7. Select "Start a program" as the action type
8. Select PowerShell.exe as the program (default path: ```C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe```)
9. Add ```-ExecutionPolicy Bypass -WindowStyle Hidden -File "C:\path\to\your\adaptive-M-Sync.ps1"``` as argument (change path to your choosen location)
10. Log out and in again so the task will be started

Now you should test, if everything works as expected.