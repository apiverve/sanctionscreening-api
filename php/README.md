# Sanctions Screening API - PHP Package

Sanctions Screening is an OFAC API that checks a person, company or vessel name against the US Treasury OFAC SDN and Consolidated lists, the UN Security Council Consolidated List, the EU consolidated financial sanctions list and the UK Sanctions List. It returns scored JSON matches with the list each hit came from, aliases, dates of birth, addresses and sanctions programs so you can decide whether to block or review.

## Installation

Install via Composer:

```bash
composer require apiverve/sanctionscreening
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Sanctionscreening\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'name' => 'Banco Nacional de Cuba',
    'threshold' => 0.85,
    'limit' => 10,
    'type' => 'individual',
    'lists' => 'ofac_sdn,un,eu,uk'
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Sanctionscreening\Client;
use APIVerve\Sanctionscreening\Exceptions\APIException;
use APIVerve\Sanctionscreening\Exceptions\ValidationException;

try {
    $response = $client->execute(['name' => 'Banco Nacional de Cuba', 'threshold' => 0.85, 'limit' => 10, 'type' => 'individual', 'lists' => 'ofac_sdn,un,eu,uk']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
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
        "remarks": null,
        "source": "ofac_sdn",
        "sourceId": "306",
        "listedOn": null
      }
    ],
    "matchedLists": [
      "ofac_sdn"
    ],
    "list": {
      "source": "OFAC SDN",
      "authority": "US Department of the Treasury, Office of Foreign Assets Control",
      "publishDate": "10/21/2026",
      "recordCount": 19471,
      "lastUpdated": "2026-10-22T10:00:41.118Z"
    },
    "lists": [
      {
        "code": "ofac_sdn",
        "source": "OFAC SDN",
        "authority": "US Department of the Treasury, Office of Foreign Assets Control",
        "publishDate": "10/21/2026",
        "recordCount": 19471,
        "lastUpdated": "2026-10-22T10:00:41.118Z"
      },
      {
        "code": "ofac_cons",
        "source": "OFAC Consolidated (non-SDN)",
        "authority": "US Department of the Treasury, Office of Foreign Assets Control",
        "publishDate": "10/19/2026",
        "recordCount": 486,
        "lastUpdated": "2026-10-22T10:01:02.540Z"
      },
      {
        "code": "un",
        "source": "UN Security Council Consolidated List",
        "authority": "United Nations Security Council",
        "publishDate": "2026-10-21",
        "recordCount": 1010,
        "lastUpdated": "2026-10-22T10:01:09.876Z"
      },
      {
        "code": "eu",
        "source": "EU Consolidated Financial Sanctions List",
        "authority": "European Union (European Commission, Financial Sanctions Files)",
        "publishDate": "2026-10-15",
        "recordCount": 6234,
        "lastUpdated": "2026-10-22T10:01:31.204Z"
      },
      {
        "code": "uk",
        "source": "UK Sanctions List",
        "authority": "UK Foreign, Commonwealth & Development Office",
        "publishDate": "2026-10-16",
        "recordCount": 6408,
        "lastUpdated": "2026-10-22T10:01:52.663Z"
      }
    ]
  }
}
```

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/sanctionscreening?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/sanctionscreening?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/sanctionscreening?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
