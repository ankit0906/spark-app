FROM openjdk:8-jdk

RUN apt-get update && \
    apt-get install -y scala

RUN curl -O https://archive.apache.org/dist/spark/spark-3.2.0/spark-3.2.0-bin-hadoop3.2.tgz && \
    tar -xvf spark-3.2.0-bin-hadoop3.2.tgz && \
    mv spark-3.2.0-bin-hadoop3.2 /usr/local/spark

WORKDIR /app

COPY Ankit.scala /app

RUN scalac -classpath "$(find /usr/local/spark -name '*jar' | tr '\n' ':')" Ankit.scala

CMD ["scala", "-classpath", "/app:/usr/local/spark/jars/*", "Ankit"]




