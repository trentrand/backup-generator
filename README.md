# Create Backup

Utility script to archive a backup of MacOS Keychains to external storage

## How to use

Move this script to your external memory storage, then execute it to create a backup.

The backup files will be created in a directory `./Backup` relative to the script.

Each backup is stored in a dated folder and archived.

```
./create-backup.sh
CWD=$(pwd)
ls $CWD
```

## Known issues

- This script requires core gnu executables. On MacOS you can `brew install coreutils`,
then add `gnubin` to your $PATH. Running the command without this will delete your Backups!
