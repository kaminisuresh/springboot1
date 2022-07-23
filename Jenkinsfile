pipeline{
    agent any
		tools { maven "Maven3.5" }
		
  stages {
    
    stage('Parameters'){
                steps {
                    script {
                    properties([
                            parameters([
                              string(name: 'ServiceBranch')							  
							])
						])
					}
				}
			}
    stage('GitClone') {
	  steps {
	    git branch: "${params.ServiceBranch}",
            url: 'https://github.com/kaminisuresh/springboot1.git',
	    credentialsId: 'jenkins'
	  }
	}
	
	stage('Build') {
	  steps {
	    sh '''
		
		    mvn clean install 
		  
		  '''
		} 
	   }
	
	
	stage('DockerImageCreation') {
	  steps {
	    sh '''		
		  docker build -t application .		  
		  '''		    
		  }
		}
	
	stage('Cleaning Service Workspace') {
	  steps {
	    sh '''		
		    docker rmi application
		  '''
	  }
	}
   }     
 }
