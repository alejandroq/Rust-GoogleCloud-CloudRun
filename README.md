# Running Rust in Google Cloud Run

See the [`Makefile`](./Makefile) for deployments. Any stateless container fulfilling the Knative contract proposed by Google can be deployed to Cloud Run. 

Within [`benchmark.txt`](./benchmark.txt) is a benchmark (defined in [`benchmark.yml`](./benchmark.yml)) against the endpoint. Results included. The Google Cloud console proposes the latencies are as follows: 50% 96.00ms, 95% 124.80ms, and 99% 127.36. Provided the application is a glorified hello world, the results are not representative of more legitimate applications.

Overall this was a smooth developer experience - the longest part being Rust's long compile times. Quickly MVPing this in Go or another lanugage would like be very quick.