### Setup Project
1. Download example project from git
2. Build project using maven
``maven -U clean package``
3. Run examples
   - 3.1 setup SPARK_HOME to spark installation directory
   - 3.2 run bin/run-pi.sh with different master address, e.g local/standalone/yarn 

### FAQ
1. How to accelerate the speed of donwloading maven dependent jar packages?
Using mirror source instead of official maven address, e.g nexus-aliyun
```xml
<repository>
    <id>nexus-aliyun</id>
    <name>Nexus aliyun</name>
    <url>http://maven.aliyun.com/nexus/content/groups/public</url>
</repository>
```
2. Can not connect to master setup in virtual machine, throw the following exception:
``Connection refused: bigdata/172.16.148.133:7077``
- Check whether master is started with IPv6. If it is add the following options to SPARK_MASTER_OPTS and SPARK_WORKER_OPTS:
``-Djava.net.preferredStackIpv4=true``
- Check whether master is bind to localhost. If it is, change SPARK_MASTER_HOST to 0.0.0.0
3. Can not start application in standalone mode, throw the following exception:
``17/03/26 19:23:55 ERROR ClientEndpoint: Exception from cluster was: java.nio.file.NoSuchFileException: /workspace/sparkexample_2.1.0/target/examples-0.1-SNAPSHOT-jar-with-dependencies.jar``
- Uploading your jar to hdfs and change jar address to hdfs path
- Uploading your jar to all worker nodes, and use that local path
