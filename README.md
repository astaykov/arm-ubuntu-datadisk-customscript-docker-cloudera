# arm-ubuntu-datadisk-customscript-docker-cloudera
A quick start template that installs Ubuntu, adds &amp; initializes data disk, installs docker, downloads Cloudera quick start docker image, imports the image into docker

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fastaykov%2Farm-ubuntu-datadisk-customscript-docker-cloudera%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fastaykov%2Farm-ubuntu-datadisk-customscript-docker-cloudera%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

When the VM is up and running (it may take up to 40 minutes depending on the size you chose), connect to it using SSH client (i.e. Putty), your provided username and password.

To start the docker image for cloudera enter the following command:

```
docker run --hostname=quickstart.cloudera --privileged=true -t -i -p 80:80 -p 8888:8888 -p 7180:7180  cloudera/cloudera:latest /usr/bin/docker-quickstart
```