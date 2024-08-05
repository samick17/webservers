use warp::http::header::{HeaderMap, HeaderValue};
use warp::Filter;
use serde_json::json;
use serde::{Serialize};

#[derive(Serialize)]
struct EmptyJson {
}

#[tokio::main]
async fn main() {
    // GET /hello/warp => 200 OK with body "Hello, warp!"
    let mut headers = HeaderMap::new();
    headers.insert("content-type", HeaderValue::from_static("application/json"));
    let hello = warp::path!("api" / "v1" / "test" / ..)
        .map(|| {
            json!(EmptyJson{}).to_string()
        })
        .with(warp::reply::with::headers(headers));

    warp::serve(hello)
        .run(([127, 0, 0, 1], 3000))
        .await;
}
