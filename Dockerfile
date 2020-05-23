FROM openjdk:8-jre-slim
VOLUME /data
EXPOSE 8080
ENV ACTIVE_PROFILE=docker

WORKDIR /app
COPY docker/entrypoint.sh /app/entrypoint.sh
COPY docker/init.sh /app/init.sh
RUN apt-get update && apt-get install -y curl && chmod +x /app/init.sh && /app/init.sh

ENTRYPOINT ["sh", "entrypoint.sh"]
