DEST_DIR=$(pwd)/Backup
BACKUP_NAME=$(date +"%Y-%m-%dT%H:%M:%S")

# Setup dated directory for backup file destination
mkdir -pv $DEST_DIR/$BACKUP_NAME/

echo "Creating backup of MacOS Keychain..."
mkdir $DEST_DIR/$BACKUP_NAME/Keychains

mkdir $DEST_DIR/$BACKUP_NAME/Keychains/System
cp -n -R \
  /Library/Keychains/* \
  $DEST_DIR/$BACKUP_NAME/Keychains/System

mkdir $DEST_DIR/$BACKUP_NAME/Keychains/User
cp -n -R \
  /Users/$(whoami)/Library/Keychains/* \
  $DEST_DIR/$BACKUP_NAME/Keychains/User

echo "Compressing backup..."
pushd $DEST_DIR
zip -r -T --move --quiet ./$BACKUP_NAME ./$BACKUP_NAME
popd

echo "Done."
