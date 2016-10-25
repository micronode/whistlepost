FROM java:openjdk-8-jdk

# Set the WORKDIR. All following commands will be run in this directory.
WORKDIR /app

# Copying all gradle files necessary to install gradle with gradlew
COPY gradlew build.gradle settings.gradle gradle.properties ./
COPY gradle gradle

COPY extensions extensions
COPY whistlepost-app whistlepost-app
COPY whistlepost-content whistlepost-content
COPY whistlepost-config whistlepost-config

ENTRYPOINT ["/app/gradlew"]

CMD ["-q", "tasks", "--all"]
