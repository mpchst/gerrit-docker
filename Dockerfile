FROM openjdk:8-jdk

RUN wget -O /var/gerrit.war https://gerrit-releases.storage.googleapis.com/gerrit-2.13.5.war
RUN useradd gerrit --home /var/gerrit
USER gerrit

EXPOSE 8080
EXPOSE 29418
VOLUME /var/gerrit

CMD java -jar /var/gerrit.war init -d /var/gerrit --batch --no-auto-start && /var/gerrit/bin/gerrit.sh start && tail -f /var/gerrit/logs/error_log
