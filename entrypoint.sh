#!/bin/bash
scala -classpath "/app:/usr/local/spark/jars/*" Ankit &
PID=$!
echo "Scala application started with PID $PID"
wait $PID
