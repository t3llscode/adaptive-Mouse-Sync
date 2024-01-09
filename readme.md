# adaptive-Mouse-Sync

## The Idea

I like Counter-Strike. In my mind, I would benefit from a higher DPI, as the mouse would pick up the input in smaller increments. Therefore I use a DPI of 4000 when I play FPS games.  

Turns out a DPI that high is not that compatible with normal mouse movement outside my FPV. To make it less annoying, I used to change the Windows setting for the mouse cursor speed manually.  

And this is where adaptive-M-Sync enters the party. A lightweight script that automatically changes the cursor speed, if an FPS game is open.

## How It Works

The Task Scheduler starts `ps1HiddenStarter.vbs` on logon. As argument it passes the script to start (`adaptive-M-Sync.ps1`).

This script will now change the mouse speed according to the open applications. Since a simple registry edit does not update the speed, `MouseSpeed.ps1 created by [raevilman](https://github.com/raevilman/windows-scripts) is used.

## The Setup

### Step 1: Your Settings

Open `settings.json` and change the ProcessName and MouseSpeed values to match your application.  
You can also choose a different default speed (to be used after the game is closed) and a different interval at which the script is run.

### Step 2: Script Execution

Open PowerShell and execute `Set-ExecutionPolicy -Scope CurrentUser unrestricted`. This will allow the execution of unknown PowerShell scripts.

### Step 3: Task Scheduler

1. Run `taskschd.msc`
- - -
2. Click "Create Task" in the "Actions" pane
3. Choose a name and description
4. Tick "Run only when user is logged on"
- - -
5. Create a new trigger in the "Triggers" tab
6. Select "At log on" as the trigger type
- - -
7. Create a new action in the "Actions" tab
8. Select "Start a program" as the action type
9. Select `wscript` as the program
10. Add `"C:\path\to\your\ps1HiddenStarter.vbs" "adaptive-M-Sync.ps1"` as arguments (change path)
- - -
11. Confirm everything and browse inside your "Task Scheduler Library" to find your task
11. Select the task and click "Run" in the "Actions" pane to test the action

### Step 4: Optional Test

You can run a manual test by running:  
`wscript "C:\path\to\your\ps1HiddenStarter.vbs" "adaptive-M-Sync.ps1"`

Change the mouse pointer speed in the Windows settings and wait the specified interval for it to return to the default. Note that the slider will not update until you change the page in the settings.
