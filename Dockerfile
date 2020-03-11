FROM debian:jessie AS builder

RUN apt-get update && apt-get install -y curl build-essential

# Install rust
RUN curl https://sh.rustup.rs/ -sSf | \
  sh -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"

COPY . ./

RUN cargo build --release

FROM debian:jessie

RUN apt-get update

EXPOSE 8080

COPY --from=builder \
  /target/release/paperboy \
  /usr/local/bin/

WORKDIR /root

ENV RUSTLOG="actixweb=info"

CMD ROCKET_PORT=$PORT /usr/local/bin/paperboy
