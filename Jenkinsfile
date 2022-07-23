pipeline{
    agent any
		tools { maven "Maven3.5" }
		
  stages {
    
    stage('Parameters'){
                steps {
                    script {
                    properties([
                            parameters([
                              string(name: 'ServiceBranch'),
							  booleanParam(name: 'consulUpdate', defaultValue: false),
							  booleanParam(name: 'bcmUpdate', defaultValue: false),
							  extendedChoice(description: '', multiSelectDelimiter: ' ', name: 'ServiceName', quoteValue: false, saveJSONParameterToFile: false, type: 'PT_CHECKBOX', value: 'All,coy-wcc-services-printersetup,coy-wcc-services-admin,coy-wcc-services-content,coy-wcc-services-methones,coy-wcc-services-adxes', visibleItemCount: 5),
                              extendedChoice(multiSelectDelimiter: ',', name: 'Release', propertyFile: '/opt/release_data/release_name.txt', propertyKey: 'release_names', quoteValue: false, saveJSONParameterToFile: false, type: 'PT_SINGLE_SELECT', visibleItemCount: 10),
                              choice(name: 'Environment', choices: ['dev1', 'dev2', "qa1", "qa2"]),
							  string(name: 'devopsConfigBranch', defaultValue: 'develop/22.1')							  
							])
						])
					}
				}
			}
	stage('Cleaning Workspace') {
	  steps {
	    deleteDir()
	  }
	 }
    stage('GitClone') {
	  steps {
	    git branch: "${params.ServiceBranch}",
		url: 'https://github.com/kaminisuresh/springboot1.git',
		credentialsId: 'https://github.com/kaminisuresh/springboot1.git'
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
