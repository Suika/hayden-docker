FROM microsoft/dotnet:latest as builder
RUN git clone https://github.com/bbepis/Hayden build && cd /build && dotnet publish -r linux-musl-x64 -o /hayden ; exit 0

FROM alpine:latest
CMD ["/hayden/Hayden"]
WORKDIR /hayden
RUN apk add --update --no-cache libstdc++ glib icu-libs libcurl
COPY --from=builder /hayden /hayden
