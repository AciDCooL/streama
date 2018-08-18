FROM openjdk:8-jre
VOLUME /data
EXPOSE 8080
ENV ACTIVE_PROFILE=docker

WORKDIR /app
COPY docker/entrypoint.sh entrypoint.sh
COPY build/libs/*.war streama.war
COPY docker/init.sh init.sh
CMD chmod +x init.sh && /app/init.sh

ENTRYPOINT ["sh", "entrypoint.sh"]
