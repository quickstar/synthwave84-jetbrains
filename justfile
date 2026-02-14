set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

image := "eclipse-temurin:17-jdk"
outdir := "build/distributions"

build:
    docker run --rm \
        -v "{{justfile_directory()}}:/project" \
        -w /project \
        {{image}} \
        ./gradlew buildPlugin --no-daemon
    @echo ""
    @echo "Plugin ZIP ready in {{outdir}}/"

clean:
    docker run --rm \
        -v "{{justfile_directory()}}:/project" \
        -w /project \
        {{image}} \
        ./gradlew clean --no-daemon
