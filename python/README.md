Sanctions Screening API
============

Sanctions Screening checks a person or company name against the US Treasury OFAC Specially Designated Nationals (SDN) list. It returns scored matches with aliases, dates of birth, addresses and sanctions programs so you can decide whether to block or review.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-sanctionsscreening.svg)](https://pypi.org/project/apiverve-sanctionsscreening/)

This is a Python wrapper for the [Sanctions Screening API](https://apiverve.com/marketplace/sanctionscreening?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-sanctionsscreening
```

Using `pip3`:

```bash
pip3 install apiverve-sanctionsscreening
```

---

## Configuration

Before using the Sanctions Screening API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_sanctionsscreening.apiClient import SanctionscreeningAPIClient

# Initialize the client with your APIVerve API key
api = SanctionscreeningAPIClient("[YOUR_API_KEY]")

query = {
    "name": "Banco Nacional de Cuba",
    "threshold": 0.85,
    "limit": 10,
    "type": "individual"
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Sanctions Screening API documentation is found here: [https://docs.apiverve.com/ref/sanctionscreening](https://docs.apiverve.com/ref/sanctionscreening?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_sanctionsscreening.apiClient import SanctionscreeningAPIClient

# Initialize the client with your APIVerve API key
api = SanctionscreeningAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "name": "Banco Nacional de Cuba",
    "threshold": 0.85,
    "limit": 10,
    "type": "individual"
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `SanctionscreeningAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_sanctionsscreening.apiClient import SanctionscreeningAPIClient, SanctionscreeningAPIClientError

api = SanctionscreeningAPIClient("[YOUR_API_KEY]")

query = {
    "name": "Banco Nacional de Cuba",
    "threshold": 0.85,
    "limit": 10,
    "type": "individual"
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except SanctionscreeningAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_sanctionsscreening.apiClient import SanctionscreeningAPIClient, SanctionscreeningAPIClientError

api = SanctionscreeningAPIClient("[YOUR_API_KEY]")

query = {
    "name": "Banco Nacional de Cuba",
    "threshold": 0.85,
    "limit": 10,
    "type": "individual"
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except SanctionscreeningAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_sanctionsscreening.apiClient import SanctionscreeningAPIClient, SanctionscreeningAPIClientError

query = {
    "name": "Banco Nacional de Cuba",
    "threshold": 0.85,
    "limit": 10,
    "type": "individual"
}

# Using context manager ensures proper cleanup
with SanctionscreeningAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except SanctionscreeningAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_sanctionsscreening.apiClient import SanctionscreeningAPIClient

# Enable debug mode
api = SanctionscreeningAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "name": "Banco Nacional de Cuba",
    "threshold": 0.85,
    "limit": 10,
    "type": "individual"
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_sanctionsscreening.apiClient import SanctionscreeningAPIClient

api = SanctionscreeningAPIClient("[YOUR_API_KEY]")

query = {
    "name": "Banco Nacional de Cuba",
    "threshold": 0.85,
    "limit": 10,
    "type": "individual"
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
