# escape=`

# Builder image

FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-ltsc2022 AS builder

SHELL ["cmd", "/S", "/C"]

COPY . /Work/Project
WORKDIR /Work/Project

RUN nuget restore
RUN msbuild -t:Build -p:Configuration=Release `
  -p:DeployOnBuild=true `
  -p:PublishProfile=FolderProfile `
  -p:PublishUrl=/Work/Publish

# Runtime image

FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2022 AS runtime

COPY --from=builder /Work/Publish /inetpub/wwwroot
