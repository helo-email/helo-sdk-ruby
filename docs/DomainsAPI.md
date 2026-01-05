# Helo::DomainsAPI

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create**](DomainsAPI.md#create) | **POST** /domains | Create a domain |
| [**delete**](DomainsAPI.md#delete) | **DELETE** /domains/{id} | Delete a domain |
| [**list**](DomainsAPI.md#list) | **GET** /domains | List all domains |
| [**retrieve**](DomainsAPI.md#retrieve) | **GET** /domains/{id} | Retrieve a domain |
| [**rotate_key**](DomainsAPI.md#rotate_key) | **POST** /domains/{id}/rotate-key | Rotate a domain key |
| [**update**](DomainsAPI.md#update) | **PATCH** /domains/{id} | Update a domain |
| [**verify**](DomainsAPI.md#verify) | **POST** /domains/{id}/verify | Verify a domain |


## create

> <DomainWithDnsResponse> create(create_domain_request)

Create a domain

Registers a new domain for sending emails. The domain must be verified before it can be used.

### Example

```ruby Domains_create
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

create_domain_request = Helo::CreateDomainRequest.new({ name: "name_example" })
Helo::Domains.create(create_domain_request)
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

id = "38400000-8cf0-11bd-b23e-10b96e4ef00d"
Helo::Domains.delete(id)
```

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
  limit: 56,
  offset: 56,
  name: "name_example",
  channel_ids: [ "inner_example" ]
}
Helo::Domains.list(opts)
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

id = "38400000-8cf0-11bd-b23e-10b96e4ef00d"
Helo::Domains.retrieve(id)
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

id = "38400000-8cf0-11bd-b23e-10b96e4ef00d"
Helo::Domains.rotate_key(id)
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

id = "38400000-8cf0-11bd-b23e-10b96e4ef00d"
update_domain_request = Helo::UpdateDomainRequest.new
Helo::Domains.update(id, update_domain_request)
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

id = "38400000-8cf0-11bd-b23e-10b96e4ef00d"
Helo::Domains.verify(id)
```
