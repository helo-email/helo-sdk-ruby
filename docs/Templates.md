# Helo::Templates

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list**](Templates.md#list) | **GET** /templates | List operation |
| [**create**](Templates.md#create) | **POST** /templates | Create operation |
| [**render_draft**](Templates.md#render_draft) | **POST** /templates/render | Render_draft operation |
| [**retrieve**](Templates.md#retrieve) | **GET** /templates/{id} | Retrieve operation |
| [**update**](Templates.md#update) | **PATCH** /templates/{id} | Update operation |
| [**delete**](Templates.md#delete) | **DELETE** /templates/{id} | Delete operation |
| [**render**](Templates.md#render) | **POST** /templates/{id}/render | Render operation |


## list

> <PaginatedResponseOfTemplateSummaryResponse> list(opts)

List operation

Fetch a paginated list of Templates.

### Example

```ruby Templates_list
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

opts = {
  limit: 10,
  offset: 10,
  name: "example",
  channel_ids: ["550e8400-e29b-41d4-a716-446655440000", "6ba7b810-9dad-11d1-80b4-00c04fd430c8"]
}
Helo::Templates.list(opts)
```


## create

> <TemplateResponse> create(create_template_request)

Create operation

Create a new Template.

### Example

```ruby Templates_create
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

create_template_request = Helo::CreateTemplateRequest.new(
  name: "test-name",
  subject: "test-subject",
  html: "test-html",
  mjml: "test-mjml",
  text: "test-text",
  channel_ids: ["550e8400-e29b-41d4-a716-446655440000", "6ba7b810-9dad-11d1-80b4-00c04fd430c8"]
)
Helo::Templates.create(create_template_request)
```


## render_draft

> <RenderTemplateResponse> render_draft(render_draft_request)

Render_draft operation

Render ad-hoc template content (Subject/Html/Text) with sample data, without persisting anything.

### Example

```ruby Templates_renderDraft
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

render_draft_request = Helo::RenderDraftRequest.new(
  subject: "test-subject",
  html: "test-html",
  mjml: "test-mjml",
  text: "test-text",
  inline_styles: true,
  data: {}
)
Helo::Templates.render_draft(render_draft_request)
```


## retrieve

> <TemplateResponse> retrieve(id)

Retrieve operation

Fetch a single Template.

### Example

```ruby Templates_retrieve
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

id = "550e8400-e29b-41d4-a716-446655440000"
Helo::Templates.retrieve(id)
```


## update

> <TemplateResponse> update(id, update_template_request)

Update operation

Update an existing Template.

### Example

```ruby Templates_update
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

id = "550e8400-e29b-41d4-a716-446655440000"
update_template_request = Helo::UpdateTemplateRequest.new(
  name: "test-name",
  subject: "test-subject",
  html: "test-html",
  mjml: "test-mjml",
  text: "test-text",
  channel_ids: ["550e8400-e29b-41d4-a716-446655440000", "6ba7b810-9dad-11d1-80b4-00c04fd430c8"],
  version: 123
)
Helo::Templates.update(id, update_template_request)
```


## delete

> delete(id)

Delete operation

Delete a Template.

### Example

```ruby Templates_delete
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

id = "550e8400-e29b-41d4-a716-446655440000"
Helo::Templates.delete(id)
```


## render

> <RenderTemplateResponse> render(id, render_template_request)

Render operation

Render a saved Template with sample data.

### Example

```ruby Templates_render
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

id = "550e8400-e29b-41d4-a716-446655440000"
render_template_request = Helo::RenderTemplateRequest.new(
  inline_styles: true,
  data: {}
)
Helo::Templates.render(id, render_template_request)
```

