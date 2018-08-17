FROM openjdk:8-jre
VOLUME /data
EXPOSE 8080
ENV ACTIVE_PROFILE=docker

WORKDIR /app
COPY docker/entrypoint.sh entrypoint.sh
COPY docker/application.yml /tmp/application.yml
ADD docker/init.sh /app
CMD /app/init.sh

ENTRYPOINT ["sh", "entrypoint.sh"]
