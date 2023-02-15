
# This Project is built using Git, Jenkins and Docker. 

This Project will give you end to end knowledge on what is CI/CD and how Jenkins is used in creating one. we will deploy this project on AWS EC2.

Follow below steps to deploy this beautiful todo app built using django.




## Prerequisites for this project

- EC2 Instance
- GitHub Account
## Table of Contents

- Launching an EC2 Instance
  - Installing Jenkins and docker in EC2
  - Configuring Jenkins
- Creating a Job in Jenkins using freestyle project
- Adding GitHub Webhooks for Continuous Integration and Continuos Delivery
**_Lets Start the Project by Launching an EC2 Instance and configuring it by installing Jenkins and Docker in it._**

### Launching an EC2 Instance

- Goto AWS EC2 Service and Select Launch instances.

- Select Ubuntu Free Tier AMI.

- Select t2.micro in the EC2 Instance type.

- In Network, settings create a security group and open port 22 for ssh and port 8080 for Jenkins.

- Click on Launch Instance. 

### Installing Jenkins and Docker in EC2

- Connect to your EC2 Instance and run following commands to Install jenkins and Docker.
   - Commands to Install Jenkins
   ``` 
  sudo apt update
  sudo apt install openjdk-11-jre -y
  curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
  echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
  sudo apt-get update
  sudo apt-get install jenkins -y
  Sudo systemctl enable jenkins 
  sudo systemctl start jenkins 
  ```
  - Commands to Install Docker
  ```
    sudo apt-get remove docker docker-engine docker.io containerd runc
  sudo apt-get update
  sudo apt-get install \
      ca-certificates \
      curl \
      gnupg \
      lsb-release
  sudo mkdir -m 0755 -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
  sudo apt install docker-compose -y
  sudo usermod -a -G $USER docker
  ```
  **_Note: Please reboot your instance so that your user will be added to docker and you can run docker commands without using sudo._**
  
### Configuring Jenkins

- Open your browser and goto `https://ec2publicip:8080/`
- Jenkins Startup page will open.
- Follow the Steps as per Jenkins Introduction.
- Configuring Jenkins has been completed.

### Creating a Job in Jenkins 

- In Jenkins Dashboard select New Item on left section select it.
- Now give a name for your Job.
- Select freestyle and click on ok.
- your new job will be created.
- Enter Description of your choice.
- **_Note: fork my DevOps-Project repository or you can use it directly Repo Link: https://github.com/jrapolug/DevOps-Project.git_** 
- In SCM enter GitHub Repository Link.
- In Build Triggers Select github webhook for pollscm.
- In Build Steps Select Execute Shell and run following commands.
```
docker-compose build
docker-compose up -d
```
- After first build got successful Configure Jenkins shell commands to 
```
docker-compose down
docker-compose build
docker-compose up -d
```

### Integrating Jenkins and GitHub using GitHub Webhooks for Continous Deployment


-  Copy your Jenkins web address.
-  Goto your GitHub Project repository and open repository settings.
-  you will find webhooks option on the left side select on that and add webhook.
-  In payload url Copy your Jenkins web address and select application/json.
-  click on save/update.

#### We have Successfully finished our project Enjoy the Project Keep Learning and Have Fun : ) 🥳🥳🎉🎉