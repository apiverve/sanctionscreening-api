# Sanctions Screening API - Ruby Gem

Sanctions Screening checks a person or company name against the US Treasury OFAC Specially Designated Nationals (SDN) list. It returns scored matches with aliases, dates of birth, addresses and sanctions programs so you can decide whether to block or review.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_sanctionscreening'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_sanctionscreening
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_sanctionscreening'

# Initialize the client
client = APIVerve::Sanctionscreening::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  name: "Banco Nacional de Cuba",
  threshold: 0.85,
  limit: 10,
  type: "individual"
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ name: "Banco Nacional de Cuba", threshold: 0.85, limit: 10, type: "individual" })
  puts response["data"]
rescue APIVerve::Sanctionscreening::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Sanctionscreening::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Sanctionscreening::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "query": "Banco Nacional de Cuba",
    "matched": true,
    "matchCount": 1,
    "verdict": "exact",
    "topScore": 1,
    "results": [
      {
        "uid": 306,
        "name": "BANCO NACIONAL DE CUBA",
        "type": "entity",
        "score": 1,
        "confidence": "exact",
        "matchedOn": "BANCO NACIONAL DE CUBA",
        "matchedVia": "primary",
        "isWeakAlias": false,
        "programs": [
          "CUBA"
        ],
        "title": null,
        "aka": [
          {
            "name": "BNC",
            "type": "aka",
            "strength": "weak"
          },
          {
            "name": "NATIONAL BANK OF CUBA",
            "type": "aka",
            "strength": "strong"
          }
        ],
        "dateOfBirth": [],
        "placeOfBirth": [],
        "nationalities": [],
        "citizenships": [],
        "addresses": [
          {
            "address1": "Zweierstrasse 35",
            "city": "Zurich",
            "postalCode": "CH-8022",
            "country": "Switzerland"
          },
          {
            "address1": "Avenida de Concha Espina 8",
            "city": "Madrid",
            "postalCode": "E-28036",
            "country": "Spain"
          },
          {
            "address1": "Dai-Ichi Bldg. 6th Floor, 10-2 Nihombashi, 2-chome, Chuo-ku",
            "city": "Tokyo",
            "postalCode": "103",
            "country": "Japan"
          },
          {
            "address1": "Federico Boyd Avenue & 51 Street",
            "city": "Panama City",
            "country": "Panama"
          }
        ],
        "ids": [],
        "remarks": null
      }
    ],
    "list": {
      "source": "OFAC SDN",
      "authority": "US Department of the Treasury, Office of Foreign Assets Control",
      "publishDate": "07/15/2026",
      "recordCount": 19217,
      "lastUpdated": "2026-07-16T05:00:12.431Z"
    }
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/sanctionscreening?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/sanctionscreening?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/sanctionscreening?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
