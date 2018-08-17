FROM openjdk:8-jre
VOLUME /data
EXPOSE 8080
ENV ACTIVE_PROFILE=docker

WORKDIR /app
COPY docker/entrypoint.sh entrypoint.sh
COPY docker/application.yml /app/application.yml
COPY docker/application.yml /tmp/application.yml
COPY build/libs/*.war streama.war
ADD docker/init.sh /app
CMD chmod +x init.sh
CMD /app/init.sh

ENTRYPOINT ["sh", "entrypoint.sh"]
