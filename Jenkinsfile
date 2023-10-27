
node
{
   def buildNumber = BUILD_NUMBER
   stage("Git CheckOut"){
        git url: 'https://github.com/jbackia19/java-web-app-docker-CICD-.git',branch: 'master'
    }
    
    stage(" Maven Clean Package"){
      def mavenHome =  tool name: "Maven-3.6.3", type: "maven"
      def mavenCMD = "${mavenHome}/bin/mvn"
      sh "${mavenCMD} clean package"
    } 
   stage("Build Dokcer Image") {
         sh "docker build -t jbackia19/javawebapp:${buildNumber} ."
    }
    stage("Docker login and Push"){
        withCredentials([string(credentialsId: 'docker_hub_password', variable: 'Dockerpassword')]){
         sh "docker login -u jbackia19 -p ${Dockerpassword} " 
         sh "docker push jbackia19/javawebapp:${buildNumber}"
        }
    }
    stage("Deploy to dockercontinor in docker deployer"){
        sshagent(['docker_ssh_password']) {
            sh "ssh -o StrictHostKeyChecking=no ubuntu@13.233.104.108 docker rm -f cloudcandy || true"
            sh "ssh -o StrictHostKeyChecking=no ubuntu@13.233.104.108 docker run -d -p 8080:8080 --name cloudcandy jbackia19/javawebapp:${buildNumber}"           
         }
    }
}    


