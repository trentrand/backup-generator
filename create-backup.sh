DEST_DIR=$(pwd)/Backup
BACKUP_NAME=$(date --iso-8601=date)

# Setup dated directory for backup file destination
mkdir --parents $DEST_DIR/$BACKUP_NAME/

echo "Creating backup of MacOS Keychain..."
mkdir $DEST_DIR/$BACKUP_NAME/Keychains

mkdir $DEST_DIR/$BACKUP_NAME/Keychains/System
cp --no-clobber --recursive \
  --target-directory $DEST_DIR/$BACKUP_NAME/Keychains/System \
  /Library/Keychains/*

mkdir $DEST_DIR/$BACKUP_NAME/Keychains/User
cp --no-clobber --recursive \
  --target-directory $DEST_DIR/$BACKUP_NAME/Keychains/User \
  /Users/trand/Library/Keychains/*

echo "Compressing backup..."
pushd $DEST_DIR
zip -r -T --move --quiet ./$BACKUP_NAME ./$BACKUP_NAME
popd

echo "Done."
