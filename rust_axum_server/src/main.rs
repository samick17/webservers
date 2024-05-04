use axum::{
    routing::{get, post},
    http::StatusCode,
    Json, Router,
};
use serde::{Deserialize, Serialize};

#[tokio::main]
async fn main() {
    tracing_subscriber::fmt::init();

    let app = Router::new()
        .route("/api/v1/test", post(empty_json));

    let listener = tokio::net::TcpListener::bind("0.0.0.0:3000").await.unwrap();
    axum::serve(listener, app).await.unwrap();
}

async fn empty_json(
    Json(payload): Json<CreateEmptyJson>,
) -> (StatusCode, Json<EmptyJson>) {
    let user = EmptyJson {};

    (StatusCode::CREATED, Json(user))
}

#[derive(Deserialize)]
struct CreateEmptyJson {
}

// the output to our `create_user` handler
#[derive(Serialize)]
struct EmptyJson {
}
