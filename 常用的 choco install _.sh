choco install vagrant

# Install PostgreSQL 12.3
# choco install postgresql12 --version=12.3
# cinst postgresql12 --params '/Password:test'
choco install postgresql12 --version=12.3 --params '/Password:Umph2014'
refreshenv
