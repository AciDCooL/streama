FROM openjdk:8-jre-slim
VOLUME /data
EXPOSE 8080
ENV ACTIVE_PROFILE=docker

WORKDIR /app
COPY docker/entrypoint.sh /app/entrypoint.sh
COPY docker/init.sh /app/init.sh
RUN apk --no-cache add curl && chmod +x /app/init.sh && /app/init.sh

ENTRYPOINT ["sh", "entrypoint.sh"]
