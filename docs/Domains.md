# Helo::Domains

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list**](Domains.md#list) | **GET** /domains | List all domains |
| [**create**](Domains.md#create) | **POST** /domains | Create a domain |
| [**retrieve**](Domains.md#retrieve) | **GET** /domains/{id} | Retrieve a domain |
| [**update**](Domains.md#update) | **PATCH** /domains/{id} | Update a domain |
| [**delete**](Domains.md#delete) | **DELETE** /domains/{id} | Delete a domain |
| [**verify**](Domains.md#verify) | **POST** /domains/{id}/verify | Verify a domain |
| [**rotate_key**](Domains.md#rotate_key) | **POST** /domains/{id}/rotate-key | Rotate a domain key |


## list

> <PaginatedResponseOfDomainResponse> list(opts)

List all domains

Retrieves all domains associated with the current account, including their verification status.

### Example

```ruby Domains_list
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

opts = {
  limit: 10,
  offset: 10,
  name: "example",
  channel_ids: ["00000000-0000-0000-0000-000000000000", "11111111-1111-1111-1111-111111111111"]
}
Helo::Domains.list(opts)
```


## create

> <DomainWithDnsResponse> create(create_domain_request)

Create a domain

Registers a new domain for sending emails. The domain must be verified before it can be used.

### Example

```ruby Domains_create
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

create_domain_request = Helo::CreateDomainRequest.new(name: "test-name")
Helo::Domains.create(create_domain_request)
```


## retrieve

> <DomainWithDnsResponse> retrieve(id)

Retrieve a domain

Gets detailed information about a specific domain, including verification status and configuration.

### Example

```ruby Domains_retrieve
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "00000000-0000-0000-0000-000000000000"
Helo::Domains.retrieve(id)
```


## update

> <DomainResponse> update(id, update_domain_request)

Update a domain

Modifies the configuration settings of an existing domain.

### Example

```ruby Domains_update
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "00000000-0000-0000-0000-000000000000"
update_domain_request = Helo::UpdateDomainRequest.new(channel_ids: ["00000000-0000-0000-0000-000000000000", "11111111-1111-1111-1111-111111111111"])
Helo::Domains.update(id, update_domain_request)
```


## delete

> delete(id)

Delete a domain

Removes a domain from the account. This will stop all email sending from this domain.

### Example

```ruby Domains_delete
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "00000000-0000-0000-0000-000000000000"
Helo::Domains.delete(id)
```


## verify

> <DnsRecordsResponse> verify(id)

Verify a domain

Initiates the domain verification process by checking DNS records.

### Example

```ruby Domains_verify
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "00000000-0000-0000-0000-000000000000"
Helo::Domains.verify(id)
```


## rotate_key

> <DnsRecordResponse> rotate_key(id)

Rotate a domain key

Generates new DKIM keys for the domain. This is recommended for security best practices.

### Example

```ruby Domains_rotateKey
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "00000000-0000-0000-0000-000000000000"
Helo::Domains.rotate_key(id)
```

