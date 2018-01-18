#!/usr/bin/env groovy

node {
    stage('checkout') {
        checkout scm
    }

    docker.image('maven:3.3.3-jdk-8').inside('-v /root/.m2:/root/.m2 -v /tmp:/tmp') {
        stage('BUILD') {
            sh "mvn clean"
            sh "mvn package"
        }
    }

    def dockerImage
    stage('PACKAGE') {
        sh "cp -R src/main/docker target/"
        sh "cp target/*.war target/docker/"
        dockerImage = docker.build('deliflow/cas-service', 'target/docker')
    }

    stage('PUBLISH') {
        docker.withRegistry('http://thoughtworks.io:5001', 'registry-login') {
            dockerImage.push 'latest'
        }
    }
}
