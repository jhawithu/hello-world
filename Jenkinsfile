pipeline{
    agent {
         node {
              label 'built-in'
              customWorkspace '/mnt/git-repo'
              }
            }
        stages {
            stage ('clone-repo') {
                steps {
                       sh "rm -rf hello-world*"
                      sh "git clone https://github.com/ghanashyam86/hello-world.git"
                      }
                   }
            stage ('build-hello-world-repo') {
                steps {
                    dir ('/mnt/git-repo/hello-world'){
                    sh "mvn clean install"
                  }
                }     
            }
            stage ('copy-war-file-on-slave-dev-A') {
                steps {
                    sh "chmod -R 777 /mnt/git-repo/hello-world/webapp/target/webapp.war"
                    sh "scp -i /mnt/shyam_mumbai_key.pem /mnt/git-repo/hello-world/webapp/target/webapp.war ec2-user@10.10.1.117:/mnt"
                }
            }
            stage ('copy-war-in-compose-dir-slave-dev-a') {
                   agent {
                       node {
                           label 'qa1'
                       }
                   }
                   steps {
                           sh "yum install git -y"
                           sh "cp /mnt/webapp.war /mnt/compose"
                   }
               }
            
            stage ('deploy-on-slave2-dev-a') {
                agent {
                    node {
                        label 'qa1'
                        customWorkspace '/mnt/compose'
                    }
                }
                steps {
                    sh "docker-compose up -d"
                }
            }
       }
}
