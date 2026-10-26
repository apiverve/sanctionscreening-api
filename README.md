# [Sanctions Screening API](https://apiverve.com/marketplace/sanctionscreening?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)

Sanctions Screening is an OFAC API that checks a person, company or vessel name against the US Treasury OFAC SDN and Consolidated lists, the UN Security Council Consolidated List, the EU consolidated financial sanctions list and the UK Sanctions List. It returns scored JSON matches with the list each hit came from, aliases, dates of birth, addresses and sanctions programs so you can decide whether to block or review.

The Sanctions Screening API provides a simple, reliable way to integrate sanctions screening functionality into your applications. Built for developers who need production-ready sanctions screening capabilities without the complexity of building from scratch.

**[View API Details →](https://apiverve.com/marketplace/sanctionscreening?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![API Status](https://img.shields.io/badge/Status-Active-green.svg)](https://apiverve.com/marketplace/sanctionscreening?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
[![Method](https://img.shields.io/badge/Method-GET-blue.svg)](#)
[![Platform](https://img.shields.io/badge/Platform-Multi--Platform-orange.svg)](#installation)

**Available on:**
[![npm](https://img.shields.io/badge/npm-CB3837?style=flat&logo=npm&logoColor=white)](https://www.npmjs.com/package/@apiverve/sanctionscreening)
[![NuGet](https://img.shields.io/badge/NuGet-004880?style=flat&logo=nuget&logoColor=white)](https://www.nuget.org/packages/APIVerve.API.SanctionsScreening)
[![PyPI](https://img.shields.io/badge/PyPI-3776AB?style=flat&logo=python&logoColor=white)](https://pypi.org/project/apiverve-sanctionscreening/)
[![RubyGems](https://img.shields.io/badge/RubyGems-E9573F?style=flat&logo=rubygems&logoColor=white)](https://rubygems.org/gems/apiverve_sanctionscreening)
[![Packagist](https://img.shields.io/badge/Packagist-F28D1A?style=flat&logo=packagist&logoColor=white)](https://packagist.org/packages/apiverve/sanctionscreening)
[![Go](https://img.shields.io/badge/Go-00ADD8?style=flat&logo=go&logoColor=white)](#-go)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)](https://pub.dev/packages/apiverve_sanctionscreening)
[![JitPack](https://img.shields.io/badge/JitPack-2E7D32?style=flat&logo=android&logoColor=white)](#-android-jitpack)

---

## Quick Start

### Using JavaScript

```javascript
async function callSanctionsScreeningAPI() {
    try {
        const params = new URLSearchParams({
            name: 'Banco Nacional de Cuba',
            lists: 'ofac_sdn,un,eu,uk'
        });

        const response = await fetch(`https://api.apiverve.com/v1/sanctionscreening?${params}`, {
            method: 'GET',
            headers: {
                'x-api-key': 'YOUR_API_KEY_HERE'
            }
        });

        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error('Error:', error);
    }
}

callSanctionsScreeningAPI();
```

### Using cURL

```bash
curl -X GET "https://api.apiverve.com/v1/sanctionscreening?name=Banco%20Nacional%20de%20Cuba&lists=ofac_sdn%2Cun%2Ceu%2Cuk" \
  -H "x-api-key: YOUR_API_KEY_HERE"
```

**Get your API key:** [https://apiverve.com](https://apiverve.com)

**📁 For more examples, see the [examples folder](./examples/)**

---

## Installation

Choose your preferred programming language:

### 📦 NPM (JavaScript/Node.js)

```bash
npm install @apiverve/sanctionscreening
```

[**View NPM Package →**](https://www.npmjs.com/package/@apiverve/sanctionscreening) | [**Package Code →**](./npm/)

---

### 🔷 NuGet (.NET/C#)

```bash
dotnet add package APIVerve.API.SanctionsScreening
```

[**View NuGet Package →**](https://www.nuget.org/packages/APIVerve.API.SanctionsScreening) | [**Package Code →**](./nuget/)

---

### 🐍 Python (PyPI)

```bash
pip install apiverve-sanctionscreening
```

[**View PyPI Package →**](https://pypi.org/project/apiverve-sanctionscreening/) | [**Package Code →**](./python/)

---

### 💎 Ruby (RubyGems)

```bash
gem install apiverve_sanctionscreening
```

[**View RubyGems Package →**](https://rubygems.org/gems/apiverve_sanctionscreening) | [**Package Code →**](./ruby/)

---

### 🐘 PHP (Packagist)

```bash
composer require apiverve/sanctionscreening
```

[**View Packagist Package →**](https://packagist.org/packages/apiverve/sanctionscreening) | [**Package Code →**](./php/)

---

### 🎯 Dart (pub.dev)

```bash
dart pub add apiverve_sanctionscreening
```

[**View pub.dev Package →**](https://pub.dev/packages/apiverve_sanctionscreening) | [**Package Code →**](./dart/)

---

### 🤖 Android (JitPack)

```gradle
implementation 'com.github.apiverve:sanctionscreening-api:1.0.0'
```

[**Package Code →**](./android/)

---

### 🐹 Go

```bash
go get github.com/apiverve/sanctionscreening-api/go
```

[**Package Code →**](./go/)

---

## Why Use This API?

| Feature | Benefit |
|---------|---------|
| **Multi-language SDKs** | Native packages for JavaScript, Python, C#, Go, and Android |
| **Simple Integration** | Single API key authentication, consistent response format |
| **Production Ready** | 99.9% uptime SLA, served from 24 global regions |
| **Comprehensive Docs** | Full examples, OpenAPI spec, and dedicated support |

---

## Documentation

- 🏠 **API Home:** [Sanctions Screening API](https://apiverve.com/marketplace/sanctionscreening?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 📚 **API Reference:** [docs.apiverve.com/ref/sanctionscreening](https://docs.apiverve.com/ref/sanctionscreening)
- 📖 **OpenAPI Spec:** [openapi.yaml](./openapi.yaml)
- 💡 **Examples:** [examples/](./examples/)

---

## What Can You Build?

The Sanctions Screening API is commonly used for:

- **Web Applications** - Add sanctions screening features to your frontend or backend
- **Mobile Apps** - Native SDKs for Android development
- **Automation** - Integrate with n8n, Zapier, or custom workflows
- **SaaS Products** - Enhance your product with sanctions screening capabilities
- **Data Pipelines** - Process and analyze data at scale

---

## API Reference

### Authentication
All requests require an API key in the header:
```
x-api-key: YOUR_API_KEY_HERE
```

Get your API key: [https://apiverve.com](https://apiverve.com)

### Response Format

Every APIVerve endpoint returns the same envelope — check `status`, then read `data`:

```json
{
  "status": "ok",
  "error": null,
  "data": { ... }
}
```

### Example Response

A real response from the Sanctions Screening API:

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

---

## Support & Community

- 🏠 **API Home**: [Sanctions Screening API](https://apiverve.com/marketplace/sanctionscreening?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 💬 **Support**: [https://apiverve.com/contact](https://apiverve.com/contact)
- 🐛 **Issues**: [GitHub Issues](../../issues)
- 📖 **Documentation**: [https://docs.apiverve.com](https://docs.apiverve.com)
- 🌐 **Website**: [https://apiverve.com](https://apiverve.com)

---

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## Security

For security concerns, please review our [Security Policy](SECURITY.md).

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

Built with ❤️ by [APIVerve](https://apiverve.com)

Copyright © 2026 APIVerve. All rights reserved.
