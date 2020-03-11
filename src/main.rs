use actix_web::{HttpServer, App, middleware::Logger};

mod client_api;

#[actix_rt::main]
async fn main() -> std::io::Result<()> {
    env_logger::init();

    println!("Starting on :8080; Don't Panic! 🚀");
    HttpServer::new(|| App::new().wrap(Logger::default()).configure(client_api::configure))
        .bind("0.0.0.0:8080")?
        .run()
        .await
}
