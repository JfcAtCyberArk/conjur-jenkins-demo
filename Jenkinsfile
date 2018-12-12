node {
    stage('Work') {
        withCredentials([conjurSecretCredential(credentialsId: 'example-password', variable: 'SECRET')]) 
        {
            echo "Hello World $SECRET"
            sh "echo $SECRET > temp"
        }
    }
    stage('Results') {
        echo "Finished!"
    }
}
