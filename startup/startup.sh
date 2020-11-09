echo 'begin startup'

echo 'install azcopy'
mkdir azcopy
cd azcopy
wget https://aka.ms/downloadazcopy-v10-linux
echo 'expand archive'
tar -xvf downloadazcopy-v10-linux
echo 'remove existing AzCopy version'
sudo rm /usr/bin/azcopy
echo 'move azcopy to /usr/bin'
sudo cp ./azcopy_linux_amd64_*/azcopy /usr/bin/
echo 'clean up'
cd ..
rmdir -rf azcopy

# Create the file repository configuration:
echo 'create the file repo config'
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Import the repository signing key:
echo 'import the repo signing key'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Update the package lists:
echo 'update the package lists'
sudo apt-get update

# Install the latest version of PostgreSQL.
# If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
echo 'install postgresql'
sudo apt-get -y install postgresql

echo 'startup complete'