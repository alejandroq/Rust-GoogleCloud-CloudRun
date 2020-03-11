.PHONY: start
start:
	RUST_LOG="actix_web=info" cargo run

CONTAINER_IMAGE := gcr.io/mocolith/paperboy
.PHONY: deploy
deploy:
	docker build -t ${CONTAINER_IMAGE} .
	docker push ${CONTAINER_IMAGE}
	gcloud run deploy --image ${CONTAINER_IMAGE} --platform managed

.PHONY: benchmark
benchmark:
	drill --benchmark benchmark.yml --stats
