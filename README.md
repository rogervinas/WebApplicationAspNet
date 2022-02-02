[![CI](https://github.com/rogervinas/WebApplicationAspNet/actions/workflows/dockerimage.yml/badge.svg?branch=master)](https://github.com/rogervinas/WebApplicationAspNet/actions/workflows/dockerimage.yml)

# WebApplicationAspNet using Docker

This project uses **Windows Docker containers** to build and execute a simple ASP.NET web application.

* For Windows: just use [Docker for Windows](https://docs.docker.com/docker-for-windows/)
* For MacOs or Linux: try [StefanScherer/windows-docker-machine](https://github.com/StefanScherer/windows-docker-machine)

What I did on MacOS and it worked:
```
git clone https://github.com/StefanScherer/windows-docker-machine
cd windows-docker-machine
vagrant up --provider virtualbox 2019-box
docker context use 2019-box
```

## Build

```
docker build -t webapplication-aspnet:latest .
```

## Run

```
docker run --rm --name webapplication-aspnet -p 8080:80 webapplication-aspnet:latest
```

* For troubleshooting you can open a session into the container:
```
docker exec -it webapplication-aspnet cmd
```

## Test

* If you are on Windows:
```
curl -w "\n" -v http://localhost:8080/api/values
```

* If you are using 2019-box on MacOs or Linux:
```
curl -w "\n" -v http://$(docker-machine ip 2019-box):8080/api/values
```

## Deploy

This repo uses a GitHub Actions Workflow defined in [dockerimage.yml](.github/workflows/dockerimage.yml) to build a docker image and publish it to DockerHub.
Check [Automating your workflow with GitHub Actions](https://help.github.com/en/categories/automating-your-workflow-with-github-actions) for more info.

## What's Next?

* Execute unit tests before generating the docker image
* Execute integration tests using the generated docker image
* Explore [gradle-msbuild-plugin](https://github.com/Itiviti/gradle-msbuild-plugin)
* How to use a private NuGet repository in the build stage?
* Find out about licensing: all images seem to use the same license as the [Windows Server Core base image](https://hub.docker.com/_/microsoft-windows-servercore/)

## More Information

* [Migrating ASP.NET MVC Applications to Windows Containers](https://docs.microsoft.com/en-us/aspnet/mvc/overview/deployment/docker-aspnetmvc)
* [Docker Multi-stage Builds](https://docs.docker.com/develop/develop-images/multistage-build/)
* [.NET Framework SDK Docker Images](https://hub.docker.com/_/microsoft-dotnet-framework-sdk/)
* [.NET Docker Announcements](https://github.com/dotnet/announcements/labels/Docker)
* [MSBuild command-line reference](https://docs.microsoft.com/en-us/visualstudio/msbuild/msbuild-command-line-reference?view=vs-2019)
