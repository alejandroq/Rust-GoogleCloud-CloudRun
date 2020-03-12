FROM debian:jessie AS builder
RUN apt-get update && apt-get install -y curl build-essential ca-certificates cmake musl-tools libssl-dev && \
  rm -rf /var/lib/apt/lists/*
RUN curl https://sh.rustup.rs/ -sSf | \
  sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
COPY . ./
RUN rustup target add x86_64-unknown-linux-musl
ENV PKGCONFIGALLOWCROSS=1
RUN cargo build  --target x86_64-unknown-linux-musl --release

FROM alpine
RUN apk update
EXPOSE 8080
COPY --from=builder \
  /target/x86_64-unknown-linux-musl/release/paperboy \
  /usr/local/bin/
WORKDIR /root
ENV RUSTLOG="actixweb=info"
CMD ROCKET_PORT=$PORT /usr/local/bin/paperboy
