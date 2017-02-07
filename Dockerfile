FROM openjdk:8-jdk
RUN useradd gerrit --home /var/gerrit
RUN mkdir /var/gerrit && chown gerrit:gerrit /var/gerrit
USER gerrit
WORKDIR /var/gerrit
RUN ls -l /var
RUN wget https://gerrit-releases.storage.googleapis.com/gerrit-2.13.5.war
RUN java -jar gerrit-2.13.5.war init -d /var/gerrit --batch --no-auto-start

EXPOSE 8080
EXPOSE 29418
VOLUME /var/gerrit

CMD /var/gerrit/bin/gerrit.sh start && tail -f /var/gerrit/logs/error_log
