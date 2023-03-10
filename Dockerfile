#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["Encurtador.API/Encurtador.API/Encurtador.API.csproj", "Encurtador.API/Encurtador.API/"]
COPY ["Encurtador.Data/Encurtador.Data.csproj", "Encurtador.Data/"]
COPY ["Encurtador.Domain/Encurtador.Domain/Encurtador.Domain.csproj", "Encurtador.Domain/Encurtador.Domain/"]
COPY ["Encurtador.Service/Encurtador.Service/Encurtador.Service.csproj", "Encurtador.Service/Encurtador.Service/"]
RUN dotnet restore "Encurtador.API/Encurtador.API/Encurtador.API.csproj"
COPY . .
WORKDIR "/src/Encurtador.API/Encurtador.API"
RUN dotnet build "Encurtador.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Encurtador.API.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Encurtador.API.dll"]