use actix_web::{web, HttpRequest, HttpResponse};
use serde::Serialize;

#[derive(Serialize)]
struct Response {
    message: String,
}

fn root_handler(_request: HttpRequest) -> HttpResponse {
    HttpResponse::Ok().json(Response {
        message: "Grettings from GCP!".to_string(),
    })
}

fn hello_handler(_request: HttpRequest) -> HttpResponse {
    HttpResponse::Ok().json(Response {
        message: "This is another endpoint!".to_string(),
    })
}

pub fn configure(cfg: &mut web::ServiceConfig) {
    cfg.route("/", web::get().to(root_handler));
    cfg.route("/hello", web::get().to(hello_handler));
}
