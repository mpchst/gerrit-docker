FROM openjdk:8-jdk
RUN wget https://gerrit-releases.storage.googleapis.com/gerrit-2.13.5.war
RUN java -jar gerrit-2.13.5.war init -d /var/gerrit --batch --no-auto-start

EXPOSE 8080
EXPOSE 29418

CMD /var/gerrit/bin/gerrit.sh start && tail -f /var/gerrit/logs/error_log
