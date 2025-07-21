# FastAPI Commands and Usage Reference

## Application Setup and Configuration

| Feature | Description | Example Usage |
|---------|-------------|---------------|
| `FastAPI()` | Creates a new FastAPI application instance | `app = FastAPI()` |
| `FastAPI(title="...")` | Creates app with custom title for docs | `app = FastAPI(title="My API")` |
| `FastAPI(description="...")` | Adds API description to documentation | `app = FastAPI(description="This API does...")` |
| `FastAPI(version="...")` | Sets API version in documentation | `app = FastAPI(version="1.0.0")` |
| `app.include_router()` | Includes a router in the application | `app.include_router(users.router, prefix="/users")` |
| `APIRouter()` | Creates a router to organize route handlers | `router = APIRouter()` |
| `APIRouter(prefix="...")` | Creates router with URL prefix | `router = APIRouter(prefix="/items")` |
| `APIRouter(tags=["..."])` | Creates router with tags for docs | `router = APIRouter(tags=["users"])` |

## Path Operations (Routes)

| Feature | Description | Example Usage |
|---------|-------------|---------------|
| `@app.get("/{path}")` | Handles HTTP GET requests | `@app.get("/items/")` |
| `@app.post("/{path}")` | Handles HTTP POST requests | `@app.post("/items/")` |
| `@app.put("/{path}")` | Handles HTTP PUT requests | `@app.put("/items/{item_id}")` |
| `@app.delete("/{path}")` | Handles HTTP DELETE requests | `@app.delete("/items/{item_id}")` |
| `@app.patch("/{path}")` | Handles HTTP PATCH requests | `@app.patch("/items/{item_id}")` |
| `@app.options("/{path}")` | Handles HTTP OPTIONS requests | `@app.options("/items/")` |
| `@app.head("/{path}")` | Handles HTTP HEAD requests | `@app.head("/items/")` |
| `@router.get("/{path}")` | Handles GET requests on router | `@router.get("/profile")` |
| `@app.get("/", status_code=201)` | Sets custom HTTP status code | `@app.get("/items/", status_code=200)` |
| `@app.get("/", deprecated=True)` | Marks endpoint as deprecated | `@app.get("/old-endpoint", deprecated=True)` |
| `@app.get("/", summary="...")` | Adds summary to docs | `@app.get("/items/", summary="Get all items")` |
| `@app.get("/", description="...")` | Adds description to docs | `@app.get("/items/", description="Returns all items from the database")` |

## Path Parameters and Query Parameters

| Feature | Description | Example Usage |
|---------|-------------|---------------|
| Path Parameters | Captures variables from URL path | `@app.get("/items/{item_id}")` <br> `def read_item(item_id: int):` |
| Optional Path Parameters | Makes path parameter optional | `@app.get("/items/{item_id?}")` <br> `def read_item(item_id: Optional[int] = None):` |
| Query Parameters | Gets parameters from query string | `@app.get("/items/")` <br> `def read_items(skip: int = 0, limit: int = 10):` |
| Optional Query Parameters | Makes query parameter optional | `@app.get("/items/")` <br> `def read_items(q: Optional[str] = None):` |
| Query Parameter Validation | Validates query parameters | `@app.get("/items/")` <br> `def read_items(q: str = Query(None, min_length=3, max_length=50)):` |
| Path Parameter Validation | Validates path parameters | `@app.get("/items/{item_id}")` <br> `def read_item(item_id: int = Path(..., gt=0)):` |
| Multiple Path Values | Captures all remaining path values | `@app.get("/files/{file_path:path}")` <br> `def read_file(file_path: str):` |

## Request Body Handling

| Feature | Description | Example Usage |
|---------|-------------|---------------|
| Pydantic Model | Defines data model for validation | ```class Item(BaseModel): name: str price: float description: Optional[str] = None```|
| Request Body | Validates and receives request body | `@app.post("/items/")` <br> `def create_item(item: Item):` |
| Multiple Body Parameters | Handles multiple body parameters | `@app.post("/items/")` <br> `def create_item(item: Item, user: User):` |
| Body with Path & Query Params | Combines different parameter types | `@app.put("/items/{item_id}")` <br> `def update_item(item_id: int, item: Item, q: Optional[str] = None):` |
| Nested Models | Handles nested data structures | ```class Image(BaseModel): url: str name: str``` <br> ```class Item(BaseModel): name: str images: List[Image]``` |
| List Models | Handles lists of models | `@app.post("/items/")` <br> `def create_items(items: List[Item]):` |
| Form Data | Handles form data | `@app.post("/login/")` <br> `def login(username: str = Form(...), password: str = Form(...)):` |
| File Upload | Handles file uploads | `@app.post("/files/")` <br> `def create_file(file: UploadFile = File(...)):` |
| Multiple Files | Handles multiple file uploads | `@app.post("/files/")` <br> `def create_files(files: List[UploadFile] = File(...)):` |

## Response Handling

| Feature | Description | Example Usage |
|---------|-------------|---------------|
| Response Model | Defines schema for response | `@app.get("/items/{item_id}", response_model=Item)` |
| Response Model Exclude | Excludes certain fields from response | `@app.get("/items/{item_id}", response_model=Item, response_model_exclude={"description"})` |
| Response Model Include | Includes only certain fields in response | `@app.get("/items/{item_id}", response_model=Item, response_model_include={"name", "price"})` |
| Response Status Code | Sets response status code | `@app.post("/items/", status_code=201)` |
| Response Headers | Sets response headers | `@app.get("/items/")` <br> `def read_items(response: Response):` <br> `    response.headers["X-Custom-Header"] = "value"` |
| JSON Response | Returns JSON response | `return {"item_id": item_id}` |
| Response object | Returns Response object | `return JSONResponse(content={"item_id": item_id})` |
| Custom Response | Returns custom response | `return Response(content=data, media_type="application/pdf")` |
| Streaming Response | Returns streaming response | `return StreamingResponse(file_like, media_type="video/mp4")` |
| File Response | Returns file response | `return FileResponse("large_video_file.mp4", media_type="video/mp4")` |
| HTML Response | Returns HTML response | `return HTMLResponse("<html><body><h1>Hello</h1></body></html>")` |
| Redirect Response | Returns redirect response | `return RedirectResponse(url="/items/")` |

## Dependencies and Dependency Injection

| Feature | Description | Example Usage |
|---------|-------------|---------------|
| Depends | Injects dependencies into path operations | `@app.get("/items/")` <br> `def read_items(commons: dict = Depends(get_common_parameters)):` |
| Depends with Parameters | Passes parameters to dependencies | `def get_db(db_name: str):` <br> `    db = databases[db_name]` <br> `    return db` <br> <br> `@app.get("/items/")` <br> `def read_items(db: Session = Depends(get_db("items"))):` |
| Class Dependencies | Uses class as dependency | ```class CommonQueryParams: def __init__(self, q: str = None, skip: int = 0, limit: int = 100): self.q = q self.skip = skip self.limit = limit``` <br> <br> `@app.get("/items/")` <br> `def read_items(commons: CommonQueryParams = Depends()):` |
| Path Operation Dependencies | Applies dependency to a specific path operation | `@app.get("/items/", dependencies=[Depends(verify_token), Depends(verify_key)])` |
| Router Dependencies | Applies dependency to all router operations | `router = APIRouter(dependencies=[Depends(get_token_header)])` |
| App Dependencies | Applies dependency to all operations | `app = FastAPI(dependencies=[Depends(verify_token)])` |
| Sub-dependencies | Dependencies with their own dependencies | `def dependency_a():` <br> `    return {"a": "value"}` <br> <br> `def dependency_b(a = Depends(dependency_a)):` <br> `    return {"b": "value", **a}` <br> <br> `@app.get("/items/")` <br> `def read_items(commons = Depends(dependency_b)):` |

## Authentication and Security

| Feature | Description | Example Usage |
|---------|-------------|---------------|
| OAuth2PasswordBearer | Implements OAuth2 with password (Bearer token) | `oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")` <br> <br> `@app.get("/users/me")` <br> `def read_users_me(token: str = Depends(oauth2_scheme)):` |
| OAuth2PasswordRequestForm | Handles OAuth2 login form | `@app.post("/token")` <br> `def login(form_data: OAuth2PasswordRequestForm = Depends()):` |
| HTTP Basic Auth | Implements HTTP Basic authentication | `security = HTTPBasic()` <br> <br> `@app.get("/users/me")` <br> `def read_current_user(credentials: HTTPBasicCredentials = Depends(security)):` |
| API Key | Implements API key authentication | `api_key_scheme = APIKeyHeader(name="X-API-Key")` <br> <br> `@app.get("/items/")` <br> `def read_items(api_key: str = Depends(api_key_scheme)):` |
| JWT Tokens | Works with JWT tokens | `@app.post("/token")` <br> `def login(form_data: OAuth2PasswordRequestForm = Depends()):` <br> `    user = authenticate_user(form_data.username, form_data.password)` <br> `    access_token = create_access_token(data={"sub": user.username})` <br> `    return {"access_token": access_token, "token_type": "bearer"}` |
| Security Scopes | Implements security with scopes | `oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token", scopes={"items": "Read items", "users": "Read users"})` |
| HTTPSRedirectMiddleware | Redirects HTTP to HTTPS | `app.add_middleware(HTTPSRedirectMiddleware)` |
| TrustedHostMiddleware | Enforces trusted hosts | `app.add_middleware(TrustedHostMiddleware, allowed_hosts=["example.com", "*.example.com"])` |

## Background Tasks, WebSockets, and Advanced Features

| Feature | Description | Example Usage |
|---------|-------------|---------------|
| Background Tasks | Runs code after returning response | `@app.post("/send-notification/{email}")` <br> `def send_notification(email: str, background_tasks: BackgroundTasks):` <br> `    background_tasks.add_task(send_email_notification, email, message="Welcome!")` <br> `    return {"message": "Notification sent in the background"}` |
| WebSockets | Handles WebSocket connections | `@app.websocket("/ws")` <br> `async def websocket_endpoint(websocket: WebSocket):` <br> `    await websocket.accept()` <br> `    while True:` <br> `        data = await websocket.receive_text()` <br> `        await websocket.send_text(f"Message text was: {data}")` |
| Events | Handles startup and shutdown events | `@app.on_event("startup")` <br> `async def startup_event():` <br> `    # Code to run on startup` <br> <br> `@app.on_event("shutdown")` <br> `async def shutdown_event():` <br> `    # Code to run on shutdown` |
| Middleware | Adds custom middleware | `@app.middleware("http")` <br> `async def add_custom_header(request: Request, call_next):` <br> `    response = await call_next(request)` <br> `    response.headers["X-Custom"] = "Value"` <br> `    return response` |
| CORS | Adds CORS middleware | `from fastapi.middleware.cors import CORSMiddleware` <br> <br> `app.add_middleware(` <br> `    CORSMiddleware,` <br> `    allow_origins=["*"],` <br> `    allow_credentials=True,` <br> `    allow_methods=["*"],` <br> `    allow_headers=["*"],` <br> `)` |
| Static Files | Serves static files | `app.mount("/static", StaticFiles(directory="static"), name="static")` |
| Templates | Works with Jinja2 templates | `templates = Jinja2Templates(directory="templates")` <br> <br> `@app.get("/items/{id}", response_class=HTMLResponse)` <br> `def read_item(request: Request, id: str):` <br> `    return templates.TemplateResponse("item.html", {"request": request, "id": id})` |
| Exception Handlers | Handles specific exceptions | `@app.exception_handler(UnicornException)` <br> `async def unicorn_exception_handler(request: Request, exc: UnicornException):` <br> `    return JSONResponse(status_code=418, content={"message": "Oops! Unicorn error!"})` |

## Testing and Documentation

| Feature | Description | Example Usage |
|---------|-------------|---------------|
| TestClient | Tests FastAPI applications | `from fastapi.testclient import TestClient` <br> <br> `client = TestClient(app)` <br> <br> `def test_read_main():` <br> `    response = client.get("/")` <br> `    assert response.status_code == 200` <br> `    assert response.json() == {"message": "Hello World"}` |
| Docs URL | Customizes docs URL | `app = FastAPI(docs_url="/documentation", redoc_url="/redocumentation")` |
| Docs Authentication | Secures documentation | `app = FastAPI(docs_url="/docs", redoc_url="/redoc")` <br> <br> `@app.get("/docs", include_in_schema=False)` <br> `async def get_documentation(username: str = Security(get_current_username)):` <br> `    return get_swagger_ui_html(openapi_url="/openapi.json", title="docs")` |
| Custom OpenAPI | Customizes OpenAPI schema | `def custom_openapi():` <br> `    if app.openapi_schema:` <br> `        return app.openapi_schema` <br> `    openapi_schema = get_openapi(...)` <br> `    app.openapi_schema = openapi_schema` <br> `    return app.openapi_schema` <br> <br> `app.openapi = custom_openapi` |
| OpenAPI Tags | Adds metadata for tags | `app = FastAPI(openapi_tags=[` <br> `    {"name": "users", "description": "Operations with users"},` <br> `    {"name": "items", "description": "Item operations"},` <br> `])` |
| Response Schema | Documents response schema | `@app.get("/items/", response_model=List[Item], responses={404: {"model": Message}})` |

## Database Integration (SQLAlchemy)

| Feature | Description | Example Usage |
|---------|-------------|---------------|
| Database Session | Creates database session middleware | `def get_db():` <br> `    db = SessionLocal()` <br> `    try:` <br> `        yield db` <br> `    finally:` <br> `        db.close()` |
| CRUD Operations | Creates database CRUD operations | `@app.post("/users/", response_model=schemas.User)` <br> `def create_user(user: schemas.UserCreate, db: Session = Depends(get_db)):` <br> `    db_user = crud.get_user_by_email(db, email=user.email)` <br> `    if db_user:` <br> `        raise HTTPException(status_code=400, detail="Email already registered")` <br> `    return crud.create_user(db=db, user=user)` |
| Async Database | Works with async databases | `@app.on_event("startup")` <br> `async def startup():` <br> `    await database.connect()` <br> <br> `@app.on_event("shutdown")` <br> `async def shutdown():` <br> `    await database.disconnect()` <br> <br> `@app.get("/users/", response_model=List[User])` <br> `async def read_users():` <br> `    query = users.select()` <br> `    return await database.fetch_all(query)` |
