FROM sbtscala/scala-sbt:eclipse-temurin-17_1.x

ARG PSE_PROXY
USER sbtuser
WORKDIR /home/sbtuser/app

COPY --chown=sbtuser:0 build.sbt ./
COPY --chown=sbtuser:0 project/ project/
RUN sbt -batch update

COPY --chown=sbtuser:0 src/ src/
RUN sbt -batch test makeBom

CMD ["sbt", "-batch", "run"]
