# MS-Zusteller
This is the **Web front-end** of the Microservice application that shows the location of a simulated deliverer using google MAP API.

Displays the live location by polling (PULL) the latest position(SYNCHRONOUS REST call) from a Microservices called **MS-GeoPosition-Tracker** that itself fetches 
the geolocation(GPX data) from "ApacheMQ Messaging QUEUE".

## Technical Stack
 **Languages, frameworks library used**: Java 8, Spring Boot 1.5, Spring WebMVC, JSP, Google Maps API, Spring Cloud Eureka Client.

 **Build tools** (Maven/Gradle).

This is a complete Microservice Application to SEE the live position of a Deliverer(Zusteller). The live position is simulated by using GPX data of a stretch.


## Other Microservices that works together
There are 6 Microservices
1. <a href="https://github.com/vimalkrishna/MS-Eureka-Registry" target="_blank" rel="noopener">MS-Eureka-Registry</a> (This makes service discover automated, for communication with MS.)
2. <a href="https://github.com/vimalkrishna/MS-global-config" target="_blank" rel="noopener">MS-global-config</a>(Optional! if we want to completely separate configurations.) {:target="_blank" rel="noopener"}
3. ActiveMQ Broker (Main decoupling mechanism between sender and receiver of GPX data.) This is a standalone application and you run it locally. I had apache-activemq-5.14.0 running.
4. <a href="https://github.com/vimalkrishna/MS-GeoLocation" target="_blank" rel="noopener">MS-GeoLocation</a>
(Simulates the sending of GPX data to the message queue.)
5. <a href="https://github.com/vimalkrishna/MS-GeoPosition-Tracker" target="_blank" rel="noopener">MS-GeoPosition-Tracker</a>
(Reads the data from Queue and exposes as REST service.)

**6. MS-Zusteller** (This service, fetches the GPX data from Microservice GeoPosition-Tracker as REST call and visualises through Google-MAP API.)

When all of the are running, we can see the movement appearing as live position of deliverer by refreshing (reloading) the browser. The GPX data is simulated and is not real time data.

### Useful localhost links for easy access:

```
MS-Eureka-Registry Server: http://localhost:8010/
ApacheMQ dashboard: http://localhost:8161/admin/queues.jsp  (with admin:admin as ID and Password)
Zusteller (this front end) http://localhost:8080/website/vehicles/vehicle/BMW 
```

## Consumer Contract tests
```
Try it as an excercise!
```
## Deployment

Each Microservices has been deployed with Docker SWARM and Kubernetes on AWS.
Another version as instances runing on EC2

## Versioning

Version 1.0
I use [SemVer](http://semver.org/) for versioning. 


## Authors
* **vimal krishna** 

## License
This project is licensed under the MIT License.
