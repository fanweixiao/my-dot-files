if [ "$1" != "stop" ] ; then
	JAVA_OPTS="$JAVA_OPTS -Xms8m -Xmx8g -Xmn1g -DServer=xxx -XX:+UseConcMarkSweepGC -server -XX:SurvivorRatio=5 -XX:CMSInitiatingOccupancyFraction=80 -XX:+PrintTenuringDistribution  -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime -XX:+PrintGCApplicationConcurrentTime  -Xloggc:./gc.log"
fi
