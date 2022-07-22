FROM kaminis/wcc_base:1
ARG SERVICE_BASE_PATH=/wcc-services/coy-wcc-services-application
WORKDIR $SERVICE_BASE_PATH 
COPY startup.sh .
#Make port 9098 available to the world outside this container
EXPOSE 8080
#Add the application jar to the container 
ADD target/*.jar .
#Run jar file the using
ENTRYPOINT ["sh", "/wcc-services/coy-wcc-services-application/startup.sh"]
