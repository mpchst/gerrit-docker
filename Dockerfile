FROM openjdk:8-jdk
RUN useradd gerrit
USER gerrit
WORKDIR /home/gerrit
RUN wget https://gerrit-releases.storage.googleapis.com/gerrit-2.13.5.war
RUN java -jar gerrit-2.13.5.war init -d /home/gerrit/site --batch --no-auto-start

EXPOSE 8080
EXPOSE 29418

CMD /home/gerrit/site/bin/gerrit.sh start && tail -f /home/gerrit/site/logs/error_log
