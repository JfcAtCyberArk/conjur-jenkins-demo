#! /bin/bash

. ./vars.sh

# 1 Launch the Jenkins container
docker run -d -p 8090:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --name jenkins jenkins/jenkins:lts

# 2 retrieve the Jenkins password
docker exec -it jenkins bash -c 'cat /var/jenkins_home/secrets/initialAdminPassword'

# 3 Connect to the Jenkins UI and install suggested plugin [Manual]

# 4 Setup a password for the admin user [Manual]

# 5 Load the Conjur.hpi plugin into Jenkins [Manual]

# 6 Create a credential (username,password) that will contain the Conjur Identity [Manual]

# 7 Create a credential (certificate) that will contain the Conjur certificate [Manual]
openssl pkcs12 -export -inkey conjur-master.key -in conjur-conjurpoc.pem -out conjur-conjurpoc.p12

# 8 Create a credential (Conjur secret) that will contain the variable name of the Conjur secret [Manual]

# 9 Configure the Jenkins instance and provide the Conjur account, the Conjur URL and both Conjur Identity and Certificate credentials [Manual]

# 10 Create a pipeline that will use the Conjur secret [Manual]
cat ./Jenkinsfile

# 11 Make sure that the Jenkins container can resolve the Conjur URL
docker exec -it -u root jenkins bash -c "echo '$conjur-master-ip conjur-master' >> /etc/hosts"

# 12 Launch the pipeline

