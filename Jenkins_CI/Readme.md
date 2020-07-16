#build image of Jenkins
docker build --tag my_jenkins:latest .

#Run container with Jenkins using created image
docker run -d -p 0.0.0.0:8080:8080 -p 0.0.0.0:50000:50000  -v /var/run/docker.sock:/var/run/docker.sock --name Jenkins <image name>

Jenkins will be listening port 8080 and can be reached on localhost:8080/

Create a pipeline using code from attached Jenkinsfile to run jobs and push builds to dockerhub as images
